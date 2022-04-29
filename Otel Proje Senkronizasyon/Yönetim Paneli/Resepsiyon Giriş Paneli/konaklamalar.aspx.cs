using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OtelRezervasyon;

public partial class konaklamalar : System.Web.UI.Page
{
    DbProcess db = new DbProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["yetki"] != "resepsiyon")
        {
            Response.Redirect("../../Login Sayfası/login.aspx");
        }
             
        if (Page.IsPostBack==false)
        {
            List<Odalar> odaDurumListele = new List<Odalar>();
            odaDurumListele = db.OdaDurumSelect("");
            rptOdaDurum.DataSource = odaDurumListele;
            rptOdaDurum.DataBind();
        }



    }

    protected void rptOdaDurum_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if(e.CommandName == "BilgiGetir")
        {
            List<Konaklamalar> konaklamalarListele = new List<Konaklamalar>();

            konaklamalarListele = db.odaBulunanKonaklamalarSelect(Convert.ToInt32(e.CommandArgument));

            rptKisiBilgi.DataSource = konaklamalarListele;
            rptKisiBilgi.DataBind();
        }
    }

    protected void odaNo_TextChanged(object sender, EventArgs e)
    {
            List<Odalar> odaDurumListele = new List<Odalar>();
            odaDurumListele = db.OdaDurumSelect(txtOdaNo.Text);
            rptOdaDurum.DataSource = odaDurumListele;
            rptOdaDurum.DataBind();
    }


    protected void btnTemizle_Click(object sender, EventArgs e)
    {
        txtOdaNo.Text = "";
        List<Odalar> odaDurumListele = new List<Odalar>();
        odaDurumListele = db.OdaDurumSelect("");
        rptOdaDurum.DataSource = odaDurumListele;
        rptOdaDurum.DataBind();
    }

    protected void MusteriAra_Click(object sender, EventArgs e)
    {
        if(txtAd.Text != "")
        {
            Konaklamalar konaklamalar = new Konaklamalar(null)
            {
                ad = txtAd.Text
            };
            List<Konaklamalar> konaklamalarListele = new List<Konaklamalar>();
            konaklamalarListele = db.KonaklamalarSelect(konaklamalar);
            rptKisiBilgi.DataSource = konaklamalarListele;
        }
        else
        {
            rptKisiBilgi.DataSource = null;
        }
        
         rptKisiBilgi.DataBind();
    }

    protected void MusteriTemizle_Click(object sender, EventArgs e)
    {
        txtAd.Text = "";
        rptKisiBilgi.DataSource = null;
        rptKisiBilgi.DataBind();
    }

    protected void rptKisiBilgi_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Cikis")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(',');
            Konaklamalar konaklamalar = new Konaklamalar(null)
            {
                tcKimlik = commandArgs[1].ToString()
            };
            db.KonaklamalarDelete(konaklamalar);

            List<Konaklamalar> konaklamalarListele = new List<Konaklamalar>();
            konaklamalarListele = db.odaBulunanKonaklamalarSelect(Convert.ToInt32(commandArgs[0]));
            rptKisiBilgi.DataSource = konaklamalarListele;
            rptKisiBilgi.DataBind();
        }
    }
}