using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_end_Period_huxiu1_js_Activity : System.Web.UI.Page
{
    Class1 login = new Class1();
    protected string activity_coverlabel;
    protected string activity_cover;
    protected string activity_content;
    static protected int activityId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            using (var db = new HuXiuEntities())
            {
                //绑定分类
                var newclass = from it in db.News_class select it;
                rptClass.DataSource = newclass.ToList();
                rptClass.DataBind();

                //虎嗅活动
                var huxiuActivity =( from it in db.Activity where it.activity_class == 1 select it).Take(4);

                rptHuxiuActivity.DataSource = huxiuActivity.ToList();

                rptHuxiuActivity.DataBind();

                //最热虎嗅活动
                var hotHuxiuActivity = (from it in db.Activity orderby it.activity_hot descending select it).Take(1);
                List<Activity> dt1 = hotHuxiuActivity.ToList();
                lkbtnActivityHot.Text= dt1[0].activity_name;
                activity_cover = "../" + dt1[0].activity_cover;
                activity_coverlabel = dt1[0].activity_coverlable;
                string simplify = System.Text.RegularExpressions.Regex.Replace(dt1[0].activity_content, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");                
                if (simplify.Length > 25)
                    simplify = simplify.Substring(0, 25) + "....";
                activity_content = simplify;
                if (Convert.ToDateTime(dt1[0].activity_start) > DateTime.Now)
                {
                    lbActivityState.Text = "未进行";
                }
                if (Convert.ToDateTime(dt1[0].activity_end) < DateTime.Now)
                {
                    lbActivityState.Text = "已结束";
                }
                if (Convert.ToDateTime(dt1[0].activity_start) <= DateTime.Now && DateTime.Now <= Convert.ToDateTime(dt1[0].activity_end))
                {
                    lbActivityState.Text  = "进行中";
                }
                activityId = dt1[0].activity_id;

                //外部活动
                var outActivity = (from it in db.Activity where it.activity_class == 2 select it).Take(3);

                rptOutActivity.DataSource =outActivity.ToList();

                rptOutActivity.DataBind();

                //活动频道

                var itemActivity = (from it in db.Activity where it.activity_class == 3 select it).Take(4);

                List<Activity> dt = itemActivity.ToList();

                
                int i;
                for (i = 0; i < itemActivity.ToList().Count(); i++)
                {

                    dt[i].activity_name = System.Text.RegularExpressions.Regex.Replace(dt[i].activity_name, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");
                }
                rptActivityItem.DataSource = itemActivity.ToList();

                rptActivityItem.DataBind();
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


    protected void rptHuxiuActivity_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "ActivityContent")
        {
            Session["activityId"] = id;

            Response.Write("<script>window.location='Activity_content.aspx'</script>");
        }
    }

    protected void rptHuxiuActivity_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lbActivityContent");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 25)
                simplify = simplify.Substring(0, 25) + "....";

            label.Text = simplify;


            //控制显示正在进行还是已经结束
            Label begin = (Label)e.Item.FindControl("beginTime");
            Label end = (Label)e.Item.FindControl("endTime");
            Label state = (Label)e.Item.FindControl("lbActivityState");
            if (Convert.ToDateTime(begin.Text)>DateTime.Now)
            {
                state.Text = "未进行";
            }
            if (Convert.ToDateTime(end.Text) < DateTime.Now)
            {
                state.Text = "已结束";
            }
            if (Convert.ToDateTime(begin.Text) <= DateTime.Now&& DateTime.Now <= Convert.ToDateTime(end.Text))
            {
                state.Text = "进行中";
            }
        }
    }


    protected void rptOutActivity_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "ActivityContent")
        {
            Session["activityId"] = id;

            Response.Write("<script>window.location='Activity_content.aspx'</script>");
        }
    }
    int counter = 0;
    protected void rptOutActivity_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
 
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            counter++;
                Image image2 = (Image)e.Item.FindControl("img2");
                Image image1 = (Image)e.Item.FindControl("img1");       
            if (counter%2==0)
            {
             
                image2.Visible = true;
                image1.Visible = false;
     
            }
            else
            {
                image2.Visible = false;
                image1.Visible = true;
            }
            //控制显示正在进行还是已经结束
            Label begin = (Label)e.Item.FindControl("beginTime");
            Label end = (Label)e.Item.FindControl("endTime");
            Label state = (Label)e.Item.FindControl("lbState");
            if (Convert.ToDateTime(begin.Text) > DateTime.Now)
            {
                state.Text = "未进行";
            }
            if (Convert.ToDateTime(end.Text) < DateTime.Now)
            {
                state.Text = "已结束";
            }
            if (Convert.ToDateTime(begin.Text) <= DateTime.Now && DateTime.Now <= Convert.ToDateTime(end.Text))
            {
                state.Text = "进行中";
            }
        }
    }

    protected void rptActivityItem_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "ActivityContent")
        {
            Session["activityId"] = id;

            Response.Write("<script>window.location='Activity_content.aspx'</script>");
        }
    }

    protected void rptActivityItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }

    protected void lkbtnActivityHot_Click(object sender, EventArgs e)
    {

        Session["activityId"] = activityId;

        Response.Write("<script>window.location='Activity_content.aspx'</script>");

    }
}