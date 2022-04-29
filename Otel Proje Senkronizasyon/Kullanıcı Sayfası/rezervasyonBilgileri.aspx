<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rezervasyonBilgileri.aspx.cs" Inherits="rezervasyonBilgileri" %>

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
            <div class="rezSorgulamaGovde">
                <p style="color:#fff;font:bold 16px 'Century Gothic';">REZERVASYON BİLGİLERİ<asp:Label runat="server" ID="lblKisiBilgisiSayac">(1.Kişi)</asp:Label></p>
                <div class="rezSorgula">
                    <table>
                        <tr>
                            <td>
                                 <p style="color:#002B41;font:bold 16px 'Century Gothic';float:left;margin-right:10px;">Ad :</p>
                            </td>
                            <td>
                                      <asp:textbox runat="server" ID="txtRezervasyonSorgula" CssClass="txt"  />
                            </td>
                             <td>
                                  <p style="color:#002B41;font:bold 16px 'Century Gothic';float:left;margin-right:10px;">Soyad :</p>
                            </td>
                            <td>
                                       <asp:textbox runat="server" ID="Textbox1" CssClass="txt"  /> 
                            </td>
                           
                        </tr>
                        <tr>
                            <td>
                                  <p style="color:#002B41;font:bold 16px 'Century Gothic';float:left;margin-right:10px;">E Posta :</p>
                            </td>
                            <td>
                                         <asp:textbox runat="server" ID="Textbox2" CssClass="txt"  />
                            </td>
                                <td>
                                  <p style="color:#002B41;font:bold 16px 'Century Gothic';float:left;margin-right:10px;">Cep Telefonu :</p>
                            </td>
                            <td>
                                         <asp:textbox runat="server" ID="Textbox3" CssClass="txt"  />
                            </td>

                        </tr>
                          <tr>
                            <td>
                                       <p style="color:#002B41;font:bold 16px 'Century Gothic';float:left;margin-right:10px;">Cinsiyet :</p>
                            </td>
                            <td>
                                         <asp:textbox runat="server" ID="Textbox10" CssClass="txt"  />
                            </td>
                        </tr>
                          <tr>
                           <td><br /></td>
                        </tr>
                          <tr>
                            <td>
                                        <p style="color:#002B41;font:bold 16px 'Century Gothic';float:left;margin-right:10px;">Ülke :</p>
                            </td>
                            <td>
                                         <asp:textbox runat="server" ID="Textbox11" CssClass="txt"  />
                            </td>
                               <td>
                                       <p style="color:#002B41;font:bold 16px 'Century Gothic';float:left;margin-right:10px;">Uyruk :</p>
                            </td>
                            <td>
                                         <asp:textbox runat="server" ID="Textbox4" CssClass="txt"  />
                            </td>
                        </tr>
                          <tr>
                           <td><br /></td>
                        </tr>
                          <tr>
                            <td>
                                      <p style="color:#002B41;font:bold 16px 'Century Gothic';float:left;margin-right:10px;">Geliş Tarihi :</p>
                            </td>
                            <td>
                                         <asp:textbox runat="server" ID="Textbox5" CssClass="txt"  />
                            </td>
                                                        <td>
                                        <p style="color:#002B41;font:bold 16px 'Century Gothic';float:left;margin-right:10px;">Gidiş Tarihi :</p>
                            </td>
                            <td>
                                         <asp:textbox runat="server" ID="Textbox12" CssClass="txt"  />
                            </td>
                        </tr>
                          <tr>
                            <td>
                                        <p style="color:#002B41;font:bold 16px 'Century Gothic';float:left;margin-right:10px;">İndirim Oranı :</p>
                            </td>
                            <td>
                                         <asp:textbox runat="server" ID="Textbox13" CssClass="txt"  />
                            </td>
                        </tr>
                        <tr>
                            <td>

                            </td>
                            <td></td><td></td>
                            <td><br /><br /><br />
                                                    <div class="btn"><a href="#" data-hover="Onayla" class="rez" runat="server">Onayla</a></div>
                            </td>
                        </tr>
                    </table>
</div>
          
                </div>
           
        </center>
    </form>
</body>
</html>
