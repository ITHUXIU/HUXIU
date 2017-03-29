using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Modify_activity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnActivity_Click(object sender, EventArgs e)
    {
        string activity_content = Server.HtmlDecode(myEditor.InnerHtml);//获取

        myEditor.InnerHtml = "xxxxx";//赋值
    }
}