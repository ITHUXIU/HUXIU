using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
    }

    protected void btnAddManager_Click(object sender, EventArgs e)
    {
        string username = Session["username"].ToString();
        using (var db = new HuXiuEntities())
        {
            Admin admin = db.Admin.SingleOrDefault(a => a.username == username);

            if(admin.id==1)
            {
                Response.Write("<script>window.location='Add_manager.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('你没有权限添加新管理员!')</script>");
            }
        }
    }

    protected void lkbBackHomepage_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.open('../Front-end/homePage-master/Homepageaspx.aspx','_blank')</script>");
    }

    protected void lkbBackNews_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.open('../Front-end/Period-huxiu/Activity.aspx',''_blank)</script>");
        //Server.Transfer("4.4.aspx");
    }
    
    protected void lkbBackActivity_Click(object sender, EventArgs e)
    {
     
        Response.Write("<script language='javascript'>window.open('../Front-end/Period-huxiu/Activity.aspx');</script>");
    }
}