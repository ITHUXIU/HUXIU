using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_end_homePage_master_Homepageaspx : System.Web.UI.Page
{
    static string url;
    Class1 login = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new HuXiuEntities())
            {
                //绑定分类
                var newclass = from it in db.News_class select it;
                rptClass.DataSource = newclass.ToList();
                rptClass.DataBind();

                //绑定头条
                var top = from it in db.Top select it;
                rptTop.DataSource = top.ToList();
                rptTop.DataBind();

                //绑定资讯头条
                var topNews = from it in db.News where it.news_top == 1 select it;
                rptNewstop.DataSource = topNews.ToList();
                rptNewstop.DataBind();

                //绑定资讯5条
                var News = from it in db.News where it.news_top ==0 orderby it.news_time descending select it;
                PagedDataSource pds = new PagedDataSource();
                pds.AllowPaging = true;
                pds.PageSize = 5;
                pds.DataSource = News.ToList();
                lbTotal.Text = pds.PageCount.ToString();
                pds.CurrentPageIndex = 0;
                rptNews.DataSource = pds;
                rptNews.DataBind();

                //绑定热文
                var HotNews = from it in db.News orderby it.news_hot descending select it;
                pds.AllowPaging = true;
                pds.PageSize = 3;
                pds.DataSource = HotNews.ToList();
                pds.CurrentPageIndex = 0;
                rptHotNews.DataSource = pds;
                rptHotNews.DataBind();

                //绑定短趣
                var interest = (from it in db.Interest orderby it.interest_id select it).Take(6);
                rptInterestTitle.DataSource = interest.ToList();
                rptInterestTitle.DataBind();
                //转化成DataTable类型
                DataTable dt = login.LINQToDataTable(interest);
                lbInterestTitle.Text = dt.Rows[0][1].ToString();
                url = dt.Rows[0][5].ToString();

                string interestContent = dt.Rows[0][2].ToString();

                string simplify = System.Text.RegularExpressions.Regex.Replace(interestContent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

                if (simplify.Length > 50)
                    simplify = simplify.Substring(0, 50) + "....";

                lbInterestContent.Text = simplify;

                lbTime.Text = login.PassTime(Convert.ToDateTime(dt.Rows[0][3].ToString()));
                //绑定传言
                var rumor = (from it in db.Rumor orderby it.rumor_like descending select it).Take(3);
                rptRumor.DataSource = rumor.ToList();
                rptRumor.DataBind();
            }
        }
    }
    //绑定资讯头两条
    protected void rptNewstop_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lbTopNews");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 50) + "....";

            label.Text = simplify;

        }
    }
    //绑定剩下五条的内容
    protected void rptNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lbNews");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 50) + "....";

            label.Text = simplify;

            label = (Label)e.Item.FindControl("lbNewsclass");

            int class_id = Convert.ToInt32(label.Text);

            using (var db = new HuXiuEntities())
            {
                News_class newsclass = db.News_class.SingleOrDefault(a => a.news_classid == class_id);
                label.Text = newsclass.news_classname;
            }
        }
    }

    void DataBindToRepeater(int currentPage)
    {
        using (var db = new HuXiuEntities())
        {
            var News = from it in db.News where it.news_top==0 orderby it.news_time descending select it;
            //news.ToList();

            News.ToList();

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 5;

            pds.DataSource = News.ToList();

            lbTotal.Text = pds.PageCount.ToString();

            pds.CurrentPageIndex = currentPage - 1;

            rptNews.DataSource = pds;

            rptNews.DataBind();
        }

    }

    //换一换
    protected void lbtChange_Click(object sender, EventArgs e)
    {
        if (lbTotal.Text != lbNow.Text)
        {
            lbNow.Text = Convert.ToString(Convert.ToInt32(lbNow.Text) + 1);
            DataBindToRepeater(Convert.ToInt32(lbNow.Text));
        }
        else
        {
            lbNow.Text = Convert.ToString(1);
            DataBindToRepeater(Convert.ToInt32(lbNow.Text));
        }
    }

    //绑定热文
    int itemcount = 1;
    protected void rptHotNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lbHotNews");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 50) + "....";

            label.Text = simplify;


            Image image1 = (Image)e.Item.FindControl("imgUp");

            Image image2 = (Image)e.Item.FindControl("imgDown");

            label = (Label)e.Item.FindControl("lbItem");

            

            if(itemcount%2==0)
            {
                image1.Visible = false;
                image2.Visible = true;
            }
            else
            {
                image1.Visible = true;
                image2.Visible = false;
            }
            itemcount++;
            //label.Text = itemcount.ToString();

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

    protected void rptInterestTitle_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "InterestContent")
        {
            using (var db = new HuXiuEntities())

            {
                Interest interest = db.Interest.SingleOrDefault(a => a.interest_id == id);

                lbInterestTitle.Text = interest.interest_title;
                url = interest.interest_url;
                lbInterestContent.Text = interest.interest_content;

                //显示多久之前时间
                lbTime.Text = login.PassTime(interest.interest_time);
            }
        }
    }

    protected void rptRumor_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }

    protected void lkInterest_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.open('" + url + "');</script>");
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["search"] = txtSearch.Text;
        Response.Write("<script>window.location='../Period-huxiu/Search.aspx'</script>");
    }


}