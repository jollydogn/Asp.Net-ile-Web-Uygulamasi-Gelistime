<%@ Page Language="C#" AutoEventWireup="true" CodeFile="odalar.aspx.cs" Inherits="Kullanıcı_Sayfası_yonlendir" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link href="css/tasarim.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
     
  <div class="banner">
 <asp:ImageButton ImageUrl="images/deu.png" runat="server" CssClass="logo" PostBackUrl="~/Kullanıcı Sayfası/Default.aspx"/><p class="p">DOKUZ EYLÜL ÜNİVERSİTESİ</p>
        </div>
           <center>
              <table>
                  <tr>
                      <td style="vertical-align:top">
<div class="solmenu">
    <div class="solMenuOzellikBaslik">filtreleme / özellik</div>
    <div class="solMenuOzellik">
        <asp:Label runat="server" ID="lblOdaFiyat" CssClass="fiyat" Font-Bold="true" Font-Names="Arial">ODA ÖZELLİKLERİ</asp:Label><br />
        <asp:checkbox text="Balkon" runat="server" CssClass="chkOzellik"/><br />
        <asp:checkbox text="Jakuzi" runat="server" CssClass="chkOzellik"/><br />
        <asp:checkbox text="Sauna" runat="server" CssClass="chkOzellik"/><br />
        <asp:checkbox text="Klima" runat="server" CssClass="chkOzellik"/><br />
        <asp:checkbox text="Televizyon" runat="server" CssClass="chkOzellik"/><br />
        <asp:checkbox text="Saç Kurutma Makinesi" runat="server" CssClass="chkOzellik"/><br />
        <asp:checkbox text="Ses Yalıtımı" runat="server" CssClass="chkOzellik"/><br /><br /><br /><br />
        <asp:Label runat="server" ID="Label1" CssClass="fiyat" Font-Bold="true" Font-Names="Arial">MANZARA ÖZELLİKLERİ</asp:Label><br />
        <asp:RadioButton GroupName="manzara" text="Hepsi" runat="server" CssClass="chkOzellik"/><br />
        <asp:RadioButton GroupName="manzara" text="Deniz Manzarası" runat="server" CssClass="chkOzellik"/><br />
        <asp:RadioButton GroupName="manzara" text="Orman Manzarası" runat="server" CssClass="chkOzellik"/><br />
        <asp:RadioButton GroupName="manzara" text="Dağ Manzarası" runat="server" CssClass="chkOzellik"/><br />
        <asp:RadioButton GroupName="manzara" text="Şehir Manzarası" runat="server" CssClass="chkOzellik"/><br />
        <asp:RadioButton GroupName="manzara" text="Televizyon" runat="server" CssClass="chkOzellik"/><br />
    </div>
                </div>
                      </td>
                       <td  style="vertical-align:top">
                               <asp:repeater runat="server" ID="OdalarGetir">
    <itemtemplate>
                           <div class="odalar">

<table style="color:#002B41;font:normal 15px 'Century Gothic';">
    <thead>
        <tr>
            <th style="padding-top:10px;" colspan="2"><%#Eval("ad") %> (<%#Eval("odaKapasite") %> Kişilik)</th>
            <th style="padding-top:10px;">Oda Fiyatı / Açıklama</th>   
        </tr>
    </thead>
    <tbody>
        <tr>
            <td   style="padding:20px 20px 20px 20px;">
            <div class="odaResim">
                <asp:image imageurl="imageurl" runat="server" ID="odaResim" BorderStyle="None" Height="180px" Width="180px"/>
             </div>
            </td>
            <td   style="padding:20px 20px 20px 0;">
                <div class="odaOzellik">
                    <asp:TextBox runat="server" ID="txtOdaOzellik" Height="175px" ReadOnly="True" TextMode="MultiLine" Width="195px" BorderStyle="None" CssClass="kisitla1" Text='<%#Eval("ozellikler") %>' Font-Bold="true" Font-Names="Arial"></asp:TextBox>
                </div>
            </td>
               <td   style="padding:20px 20px 20px 0;">

               <div class="odaFiyat">
                    <asp:Label runat="server" ID="lblOdaFiyat" CssClass="fiyat" Font-Bold="true" Font-Names="Arial"><%# Eval("fiyat") %> ₺</asp:Label>
               </div>
               <div class="odaAciklama">
                    <asp:textbox runat="server" ID="txtAciklama" BorderStyle="None" Height="95px" ReadOnly="True" TextMode="MultiLine" Width="195px" CssClass="kisitla2" Text='<%#Eval("aciklama") %>' Font-Bold="true" Font-Names="Arial"/>
               </div>
               </td>
               <td   style="padding:20px 20px 20px 0;">
                  <div style="-webkit-box-shadow: 0 0 4px 4px #dddbdb;-moz-box-shadow: 0 0 4px 4px #dddbdb;box-shadow: 0 0 4px 4px #dddbdb;width:100px;height:40px;">
                      <div class="btn"><a href="#" data-hover="Rezervasyon Yap" class="islem">Rezervasyon</a></div>
                  </div>
               </td>
        </tr>

    </tbody>
</table>

                </div>
          </itemtemplate>
</asp:repeater>
                      </td>

                  </tr>
              </table>

            </center>

    </form>
</body>
</html>
