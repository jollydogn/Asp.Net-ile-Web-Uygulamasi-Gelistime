using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OtelRezervasyon;

public partial class Kullanıcı_Sayfası_yonlendir : System.Web.UI.Page
{
    DbProcess db = new DbProcess();
    protected void Page_Load(object sender, EventArgs e)
    {
        string data = Request.QueryString["D"];
        string StrValue = "";
        while (data.Length > 0)
        {
            StrValue += System.Convert.ToChar(System.Convert.ToUInt32(data.Substring(0, 2), 16)).ToString();
            data = data.Substring(2, data.Length - 2);
        }
        string[] degerler = StrValue.Split('&');

        string[] gelis = degerler[0].Split('=');

        string[] gidis = degerler[1].Split('=');

        string[] kapasite = degerler[2].Split('=');

        string[] indirim = degerler[3].Split('=');
        //Oluşturduğum tabloda belirtilen tarih aralığında sorgulama yaptırıp gelmeyen odaların tipini getiren bir select yaz
        //Bu selectin sonucunu bir repeatera at ve ana sayfayı doldur
        //sol tarafta özellik filtreleme kullan
        OdaTip odaTip = new OdaTip(null)
        {
            odaKapasite = Convert.ToInt32(kapasite[1]),
        };
        Rezervasyon rezervasyon = new Rezervasyon(null, null)
        {
            gelisTarihi = Convert.ToDateTime(gelis[1]),
            gidisTarihi = Convert.ToDateTime(gidis[1])
        };
        List<OdaOzellik> odaOzellik = new List<OdaOzellik>();
        List<OdalarGoruntule> odalarGoruntuleList = new List<OdalarGoruntule>();
        odaOzellik = db.OdalarAnaSayfa(rezervasyon,odaTip);
        for(int i=0;i<odaOzellik.Count;i++)
        {
            OdalarGoruntule odalarGoruntule= new OdalarGoruntule()
            {
                id = odaOzellik[i].odaTip.id,
                otelID = odaOzellik[i].odaTip.otelID,
                ad = odaOzellik[i].odaTip.ad,
                fiyat = odaOzellik[i].odaTip.fiyat,
                odaKapasite = odaOzellik[i].odaTip.odaKapasite,
                aciklama = odaOzellik[0].odaTip.aciklama,
            };
            string ozellikler = "";
            if (odaOzellik[i].manzaraId == 0)
            { ozellikler += "Manzara Tipi :Manzara Yok"; }
            else if (odaOzellik[i].manzaraId == 1)
            { ozellikler += "Manzara Tipi :Deniz Manzarası"; }
            else if (odaOzellik[i].manzaraId == 2)
            { ozellikler += "Manzara Tipi :Orman Manzarası"; }
            else if (odaOzellik[i].manzaraId == 3)
            { ozellikler += "Manzara Tipi :Dağ Manzarası"; }
            else if (odaOzellik[i].manzaraId == 4)
            { ozellikler += "Manzara Tipi :Şehir Manzarası"; }

            ozellikler += Environment.NewLine+Environment.NewLine + "Mevcut Özellikler :"+ Environment.NewLine;


            if (odaOzellik[i].balkon==true)
            { ozellikler += "Balkon, "+ Environment.NewLine; }
            if (odaOzellik[i].jakuzi == true)
            { ozellikler += "Jakuzi, " + Environment.NewLine; }
            if (odaOzellik[i].klima == true)
            { ozellikler += "Klima, " + Environment.NewLine; }
            if (odaOzellik[i].mutfak == true)
            { ozellikler += "Mutfak, " + Environment.NewLine; }
            if (odaOzellik[i].sacKurutmaMakinasi == true)
            { ozellikler += "Saç kurutma makinası, " + Environment.NewLine; }
            if (odaOzellik[i].sauna == true)
            { ozellikler += "Sauna, " + Environment.NewLine; }
            if (odaOzellik[i].sesYalitimi == true)
            { ozellikler += "Ses yalıtımı, " + Environment.NewLine; }
            if (odaOzellik[i].televizyon == true)
            { ozellikler += "Televizyon, " + Environment.NewLine; }

            ozellikler = ozellikler.Substring(0, ozellikler.Length - 4);

            odalarGoruntule.ozellikler = ozellikler;
            odalarGoruntuleList.Add(odalarGoruntule);
        }

        OdalarGetir.DataSource = odalarGoruntuleList;
        OdalarGetir.DataBind();

    }
}