using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_end_Period_huxiu1_Activity_content : System.Web.UI.Page
{
    Class1 activity = new Class1();

    Class1 login = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            using (var db = new HuXiuEntities())
            {
                var topic = (from it in db.Topic orderby it.topic_id select it).Take(4);

                //DataTable dt = activity.LINQToDataTable(topic);

                rptTopic.DataSource = topic.ToList();

                rptTopic.DataBind();
            }
        }
    }

    protected void rptTopic_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void rptTopic_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
           if(e.Item.ItemType==ListItemType.Item)
            {
                LinkButton linkbutton = (LinkButton)e.Item.FindControl("lkbtnTopic");

                string simplify = System.Text.RegularExpressions.Regex.Replace(linkbutton.Text, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

                if (simplify.Length > 15)
                    simplify = simplify.Substring(0, 15) + "....";

                linkbutton.Text = simplify;

                Panel panel = (Panel)e.Item.FindControl("pnActivitiy");

               // panel.CssClass = "stystem - content stystem - content - left";
            }
            else
            {
                LinkButton linkbutton = (LinkButton)e.Item.FindControl("lkbtnTopic");

                string simplify = System.Text.RegularExpressions.Regex.Replace(linkbutton.Text, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

                if (simplify.Length > 15)
                    simplify = simplify.Substring(0, 15) + "....";

                linkbutton.Text = simplify;

                Panel panel = (Panel)e.Item.FindControl("pnActivitiy");

                panel.CssClass = "stystem-content";
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtusername.Text;

        string password = txtpassword.Text;

        password = login.md5(password, 16);

        using (var db = new HuXiuEntities())
        {
            Admin admin = db.Admin.SingleOrDefault(a => a.nickname == username && a.password == password);

            if (admin == null)
            {
                Response.Write("<script>alert('登陆失败!')</script>");
            }
            else
            {
                Session["username"] = admin.nickname;

                Response.Write("<script>alert('登陆成功！');location='../../Backstage/Index.aspx'</script>");
            }
        }
    }

}