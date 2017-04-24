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

    static public string activityUrl;
    static protected string activityTime, activityContent;

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

                activityUrl = "../" + activity.activity_cover;

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


    protected void lkbtnBlog_Click(object sender, EventArgs e)
    {
        string content;
        content = activityContent;
        string simplify = System.Text.RegularExpressions.Regex.Replace(content, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

        // if (simplify.Length > 15)
        //  simplify = simplify.Substring(0, 15) + "....";
        string url = "http://service.weibo.com/share/share.php?appkey=1934882415&url=https%3A%2F%2Fwww.huxiu.com%2Farticle%2F190487.html%3Ff%3Dpc-weibo-article&title=" + simplify + "%40虎嗅网&content=utf-8&pic=https://imgs.bipush.com/article/cover/201702/02/210424231162.jpg#_loginLayer_1492261857422";

        Response.Redirect(url);
    }

    protected void lkbtnQq_Click(object sender, EventArgs e)
    {
        string content;
        content = activityContent;
        string simplify = System.Text.RegularExpressions.Regex.Replace(content, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

        // if (simplify.Length > 15)
        //  simplify = simplify.Substring(0, 15) + "....";
        string url = "https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=https%3A%2F%2Fwww.huxiu.com%2Farticle%2F187874.html%3Ff%3Dpc-qzone-article&showcount=0&desc=" + simplify + "&summary=&title=去年的十大刷屏营销案例，你看过几个？&site=虎嗅网&pics=&style=203&width=22&height=22&otype=share";

        Response.Redirect(url);

        
    }

    protected void lkbtnPay_Click(object sender, EventArgs e)
    {

    }

    protected void lkbtnWc_Click(object sender, EventArgs e)
    {

    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["search"] = txtSearch.Text;
        Response.Write("<script>window.location='../Period-huxiu/Search.aspx'</script>");
    }
}