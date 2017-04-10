using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_end_zixunCont_master_News_Content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);

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
}