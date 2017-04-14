using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Newsclass_Editor : System.Web.UI.Page
{
    protected void Page_PreLoad(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
        try
        {
            int id = Convert.ToInt32(Request.QueryString["news_classid"].ToString());
        }
        catch (Exception ex)
        {
            Server.Transfer("../Front-end/Period-huxiu/404.aspx");
        }

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
        int id = Convert.ToInt32(Request.QueryString["news_classid"]);
        if (!IsPostBack)
        {
            using (var db = new HuXiuEntities())
            {
                News_class newsclass = db.News_class.SingleOrDefault(a => a.news_classid == id);
                txtName.Text = newsclass.news_classname;
            }
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["news_classid"]);
        if (txtName.Text == "")
            Response.Write("<script>alert('输入不能为空！')</script>");
        else
            using (var db = new HuXiuEntities())
            {
                News_class newsclass = db.News_class.SingleOrDefault(a => a.news_classid == id);
                newsclass.news_classname = txtName.Text;
                db.SaveChanges();
                Response.Write("<script>alert('修改成功！');location='Newsclass_Delete.aspx'</script>");
            }
    }
}