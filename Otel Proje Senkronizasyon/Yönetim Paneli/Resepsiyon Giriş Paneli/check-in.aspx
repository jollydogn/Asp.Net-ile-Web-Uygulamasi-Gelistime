<%@ Page Language="C#" AutoEventWireup="true" CodeFile="check-in.aspx.cs" Inherits="check_in" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Check-In</title>

<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Glance Design Dashboard Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />


<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 
 <!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>

<!--fontlar-->
<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet"/>

<!-- Menü için -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>

    <link href="../css/SidebarNav.min.css" rel="stylesheet" />
    <link href="../css/owl.carousel.css" rel="stylesheet" />
    <link href="../css/jqcandlestick.css" rel="stylesheet" />
    <link href="../css/font-awesome.css" rel="stylesheet" />
    <link href="../css/export.css" rel="stylesheet" />
    <link href="../css/custom.css" rel="stylesheet" />
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/animate.css" rel="stylesheet" /> 
    <link href="../css/style.css" rel="stylesheet" />
<style>
#chartdiv {
  width: 100%;
  height: 295px;
}
</style>
</head>
<body class="cbp-spmenu-push">
    <div class="main-content">

    <form id="form1" runat="server" class="form-horizontal">
        <table>
    <div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
		<!--sol menü için-->
		<aside class="sidebar-left">
      <nav class="navbar navbar-inverse">
          <div class="navbar-header">
            <h1><a class="navbar-brand" href="#">Resepsiyon<span class="dashboard_text">Dokuz Eylül Universitesi</span></a></h1>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="sidebar-menu">
              <li class="header" style="font-size:13px;">Sayfalar</li>
              <li class="treeview">
                <a href="#"><span>Check-In</span></a>
              </li>
            </ul>
             
          </div>
          <!-- /.navbar-collapse -->
      </nav>
    </aside>
	</div>
      <div class="sticky-header header-section ">
			<div class="header-left">

				<div class="profile_details_left"><!--notifications of menu start -->
					<ul class="nofitications-dropdown">
						<li class="dropdown head-dpdn">
					<p style="color:white">s</p>
						</li>	
					</ul>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>

          <!-- Sağ taraf giriş yapan kişi ve yetkisi -->
			<div class="header-right">
				<div class="profile_details">		
					<ul>
						<li class="dropdown profile_details_drop">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								<div class="profile_img">	
									<span class="prfil-img"><img src="images/2.jpg" alt=""/> </span> 
									<div class="user-name">
										<p>Mustafa</p>
										<span>Otel Sahibi</span>
									</div>
									<div class="clearfix"></div>	
								</div>	
							</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>				
			</div>
			<div class="clearfix"> </div>	
           <!-- Sağ taraf giriş yapan kişi ve yetkisi -->

		</div>
  <div id="page-wrapper">
                    <div class="main-page">
                        <div class="forms">
                            <div class=" form-grids row form-grids-right">
                                <div class="widget-shadow " data-example-id="basic-forms">
                                    <div class="form-title">
                                        <h4>Check-In Onaylama :</h4>
                                    </div>

                                    <div class="form-body">
                                        <div class="form-group">
                                            <asp:Label runat="server" for="inputEmail3" class="col-sm-2 control-label">Kimlik Numarası</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtKimlik" class="form-control" placeholder="Misafir Kimlik Numarası"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Lütfen bu alanı boş bırakmayınız." ControlToValidate="txtKimlik" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" for="inputEmail3" class="col-sm-2 control-label">Adı</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtAd" class="form-control" placeholder="Misafir Adı"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" for="inputEmail3" class="col-sm-2 control-label">Soyadı</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtSoyad" class="form-control" placeholder="Misafir Soyadı"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" for="inputEmail3" class="col-sm-2 control-label">Telefon Numarası</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtTelefon" class="form-control" placeholder="Misafir Telefon Numarası"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" for="inputEmail3" class="col-sm-2 control-label">Geliş Tarihi</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtGelis" class="form-control" placeholder="Misafir Geliş Tarihi" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" for="inputEmail3" class="col-sm-2 control-label">Gidiş Tarihi</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtGidis" class="form-control" placeholder="Misafir Gidiş Tarihi" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <asp:Label runat="server" for="inputEmail3" class="col-sm-2 control-label">İndirim Oranı</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtIndirim" class="form-control" placeholder="İndirim Oranı" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" for="inputEmail3" class="col-sm-2 control-label">Ücret</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtUcret" class="form-control" placeholder="Ücret" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" for="inputEmail3" class="col-sm-2 control-label">Oda Numarası</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtOda" class="form-control" placeholder="Oda Numarası" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label runat="server" for="inputEmail3" class="col-sm-2 control-label">Kat</asp:Label>
                                            <div class="col-sm-9">
                                                <asp:TextBox runat="server" ID="txtKat" class="form-control" placeholder="Kat" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-sm-offset-2">
                                            <asp:Button class="btn btn-default" Text="Onayla" runat="server" Style="background-color: #F2B33F; color: #fff" ID="btnCheckInOnayla" OnClick="btnCheckInOnayla_Click" />&nbsp&nbsp<asp:Label runat="server" ID="lblOnay" Visible="False" ForeColor="#32C867"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    <script src="js/bootstrap.js"> </script>
    <script src="js/SimpleChart.js"></script>
    <script src='js/SidebarNav.min.js' type='text/javascript'></script>
    <script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
    	<script src="js/classie.js"></script>
      <script src="js/Chart.bundle.js"></script>
    <script src="js/utils.js"></script>
            </table>
          </form>
        </div>
    </body>
</html>
