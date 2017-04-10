using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Index : System.Web.UI.Page
{
    Class1 index = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["username"]==null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
        else
        {
            using (var db = new HuXiuEntities())
            {
                string username = Session["username"].ToString();

                Admin admin = db.Admin.SingleOrDefault(a => a.username ==username );

                lkbtnNickname.Text = admin.nickname;
            }
        }
    }

    protected void lkbtnSuperManager_Click(object sender, EventArgs e)
    {
        Random number = new Random();
        int color1 = number.Next(0, 255);
        int color2 = number.Next(0, 255);
        int color3 = number.Next(0, 255);
        lkbtnSuperManager.ForeColor = System.Drawing.Color.FromArgb(color1,color2,color3);
    }

    protected void lkbtnExit_Click(object sender, EventArgs e)
    {
        Session["username"] = null;

        Response.Write("<script>alert('退出成功！');location='../Login/Login.aspx'</script>");
    }
}