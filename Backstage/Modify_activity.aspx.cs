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
        if(!IsPostBack)
        {
            //int id = Convert.ToInt32(Request.QueryString["activity_id"].ToString());

            //using (var db = new HuXiuEntities())
            //{
            //    Activity activity = db.Activity.SingleOrDefault(a => a.activity_id == id);

            //    txtTitle.Text = activity.activity_name;

            //    myEditor.InnerHtml = activity.activity_cover + activity.activity_content;

            //}
        }
    }

protected void btnActivity_Click(object sender, EventArgs e)
{
    string activity_content = Server.HtmlDecode(myEditor.InnerHtml);//获取

    myEditor.InnerHtml = "xxxxx";//赋值
}
}