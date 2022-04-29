using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OtelRezervasyon;
using System.Web.UI.HtmlControls;

public partial class check_in : System.Web.UI.Page
{
    DbProcess db = new DbProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["yetki"] != "resepsiyon")
        {
            Response.Redirect("../../Login Sayfası/login.aspx");
        }
        string data = Request.QueryString["D"];
        string StrValue = "";
        while (data.Length > 0)
        {
            StrValue += System.Convert.ToChar(System.Convert.ToUInt32(data.Substring(0, 2), 16)).ToString();
            data = data.Substring(2, data.Length - 2);
        }
        string[] degerler = StrValue.Split('&');

        string[] ad = degerler[2].Split('=');
        txtAd.Text = ad[1];

        string[] soyad = degerler[3].Split('=');
        txtSoyad.Text= soyad[1];

        string[] telefon = degerler[4].Split('=');
        txtTelefon.Text = telefon[1];

        string[] gelis = degerler[0].Split('=');
        txtGelis.Text = gelis[1];

        string[] gidis = degerler[1].Split('=');
        txtGidis.Text = gidis[1];

        string[] indirim = degerler[5].Split('=');
        txtIndirim.Text = indirim[1];

        string[] odaIDal = degerler[6].Split('=');
        Odalar oda = new Odalar(null,null)
        {
            id= Convert.ToInt32(odaIDal[1])
        };


        List<Odalar> odalar = new List<Odalar>();
        odalar = db.OdalarSelectTekOda(oda);
        oda = odalar[0];
        txtOda.Text = oda.odaNo.ToString();
        txtKat.Text = oda.kat.ToString();

        List<OdaTip> odaTipler = new List<OdaTip>();
        odaTipler = db.OdaTipFiyatSelect(oda);

        OdaTip odaTip = new OdaTip(null);
        odaTip = odaTipler[0];
        txtUcret.Text = ((Convert.ToDateTime(txtGidis.Text) - Convert.ToDateTime(txtGelis.Text)).TotalDays * odaTip.fiyat/100*(100-Convert.ToUInt32(txtIndirim.Text))).ToString();
    }

    protected void btnCheckInOnayla_Click(object sender, EventArgs e)
    {
        Konaklamalar konaklamalar = new Konaklamalar(null)
        {
            otelID=1,
            ad = txtAd.Text,
            soyad=txtSoyad.Text,
            gelisTarihi=Convert.ToDateTime(txtGelis.Text),
            gidisTarihi=Convert.ToDateTime(txtGidis.Text),
            indirimOrani=Convert.ToInt32(txtIndirim.Text),
            kat=Convert.ToInt32(txtKat.Text),
            odaNo=Convert.ToInt32(txtOda.Text),
            tcKimlik=txtKimlik.Text,
            telefonNo=txtTelefon.Text,
            Ucret=Convert.ToDouble(txtUcret.Text)
        };

        db.KonaklamalarInsert(konaklamalar);

        HtmlMeta meta = new HtmlMeta();
        meta.HttpEquiv = "Refresh";
        meta.Content = "2;url=rezervasyonlar.aspx";
        this.Page.Controls.Add(meta);
        lblOnay.Visible = true;
        lblOnay.Text = "İşleminiz tamamlandı , 2 saniye sonra yönlendirileceksiniz.";
    }
}