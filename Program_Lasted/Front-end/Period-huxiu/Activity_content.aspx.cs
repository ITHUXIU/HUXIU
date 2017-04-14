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

    protected void Page_PreLoad(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(Session["activityId"].ToString());
        }
        catch (Exception ex)
        {
            Server.Transfer("404.aspx");
        }

    }

    protected string activityTime, activityContent;
    protected void Page_Load(object sender, EventArgs e)
    {
     
        if(!IsPostBack)
        {
            int id = Convert.ToInt32(Session["activityId"].ToString());

            Class1.calculateHot("activity", id);

            using (var db = new HuXiuEntities())
            {
              

                var topic = (from it in db.Topic where it.topic_id != 8 orderby it.topic_id select it).Take(4);

                Activity activity = db.Activity.SingleOrDefault(a => a.activity_id == id);

                lbActivityName.Text = activity.activity_name;

                activityContent = activity.activity_content;

                activityTime = activity.activity_start.ToString();

                rptTopic.DataSource = topic.ToList();

                rptTopic.DataBind();

                //绑定分类
                var newclass = from it in db.News_class select it;
                rptClass.DataSource = newclass.ToList();
                rptClass.DataBind();
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