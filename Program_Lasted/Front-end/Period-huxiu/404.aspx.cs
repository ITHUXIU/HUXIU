using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_end_Period_huxiu_404 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(@"<script language='javascript'>setTimeout('',1000);</script>");
        Response.Write("<meta http-equiv='refresh'   content='10;URL=../homePage-master/Homepageaspx.aspx'>");
    }

}