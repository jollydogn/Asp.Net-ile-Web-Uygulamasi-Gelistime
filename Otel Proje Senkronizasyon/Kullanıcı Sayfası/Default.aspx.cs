using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OtelRezervasyon;

public partial class Kullanıcı_Sayfası_Default : System.Web.UI.Page
{
    DbProcess db = new DbProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            OdaTip odaTip = new OdaTip(null);
            odaTip = db.OdaTipKapasite();
            for (int i = 1; i <= odaTip.odaKapasite; i++)
            {
                drpKisiSayisi.Items.Add(i.ToString());
            }
        }
    }
    protected void Unnamed2_Click(object sender, EventArgs e)
    {
        clGelisTarih.Visible = true;
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date.CompareTo(DateTime.Today) < 0 || e.Day.Date.CompareTo(DateTime.Today.Date.AddYears(1)) > 0)
        {
            e.Day.IsSelectable = false;
        }

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        clGidisTarih.SelectedDate = clGelisTarih.SelectedDate.Date.AddDays(1);
        clGidisTarih.VisibleDate = clGidisTarih.SelectedDate;
        txtGelisTarih.Text = clGelisTarih.SelectedDate.ToString().Substring(0, 10);
        clGelisTarih.Visible = false;
        clGidisTarih.Visible = true;
        txtGidisTarih.Text = clGidisTarih.SelectedDate.ToString().Substring(0, 10);
    }

    protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date.CompareTo(clGelisTarih.SelectedDate.Date.AddDays(1)) < 0 || e.Day.Date.CompareTo(clGelisTarih.SelectedDate.Date.AddMonths(1)) > 0)
        {
            e.Day.IsSelectable = false;
        }

    }
    protected void btnGelis_Click(object sender, ImageClickEventArgs e)
    {
        clGelisTarih.Visible = true;
    }
    protected void btnGidis_Click(object sender, ImageClickEventArgs e)
    {
        clGidisTarih.Visible = true;
    }
    protected void clGidisTarih_SelectionChanged(object sender, EventArgs e)
    {
        txtGidisTarih.Text = clGidisTarih.SelectedDate.ToString().Substring(0, 10);
        clGidisTarih.Visible = false;
    }
    protected void RezervasyonYapClick(object sender, EventArgs e)
    {
        string data = "GelisTarihi=" + txtGelisTarih.Text + "&GidisTarihi=" + txtGidisTarih.Text + "&KisiSayisi=" + drpKisiSayisi.Text + "&IndirimKodu=" + SirketKod.Text;
        string hex = "";
        foreach (char c in data)
        {
            int tmp = c;
            hex += String.Format("{0:x2}", (uint)System.Convert.ToUInt32(tmp.ToString()));
        }
        Response.Redirect("odalar.aspx?D=" + hex);
    }
}