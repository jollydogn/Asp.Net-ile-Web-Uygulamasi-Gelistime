﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class YetkiliGirisMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCikis_Click(object sender, EventArgs e)
    {
        Session["yetki"] = "cikis";
        Response.Redirect("../../Login Sayfası/login.aspx");
    }
}
