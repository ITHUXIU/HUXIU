using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_end_zixunCont_master_News_Content : System.Web.UI.Page
{
    protected void Page_PreLoad(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(Request.QueryString["news_id"].ToString());
        }
        catch (Exception ex)
        {
            Server.Transfer("../Period-huxiu/404.aspx");
        }

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);

        Class1.calculateHot("news", newsid);

        using (var db = new HuXiuEntities())
        {
            //绑定分类
            var newclass = from it in db.News_class select it;
            rptClass.DataSource = newclass.ToList();
            rptClass.DataBind();

            //绑定界面内容
            News news = db.News.SingleOrDefault(a => a.news_id == newsid);
            lbTitle.Text = news.news_title;
            string aa = news.news_content;
            lbTime.Text = news.news_time.ToString();
            lbContent.Text = news.news_content;

            News_class newsclass = db.News_class.SingleOrDefault(a => a.news_classid == news.news_class);
            lbNewsClass.Text = newsclass.news_classname;

            //热文绑定
            var HotNews = from it in db.News orderby it.news_hot descending select it;
            PagedDataSource pds = new PagedDataSource();
            pds.AllowPaging = true;
            pds.PageSize = 3;
            pds.DataSource = HotNews.ToList();
            pds.CurrentPageIndex = 0;
            rptHotNews.DataSource = pds;
            rptHotNews.DataBind();
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Class1 login = new Class1();

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


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["search"] = txtSearch.Text;
        Response.Write("<script>window.location='../Period-huxiu/Search.aspx'</script>");
    }

}