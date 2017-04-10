using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_end_Period_huxiu_News_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int newsclassid = Convert.ToInt32(Request.QueryString["news_classid"]);

        using (var db = new HuXiuEntities())
        {
            //绑定分类
            var newclass = from it in db.News_class select it;
            rptClass.DataSource = newclass.ToList();
            rptClass.DataBind();

            //设置分类信息
            News_class news_class = db.News_class.SingleOrDefault(a => a.news_classid == newsclassid);
            lbClass.Text = news_class.news_classname;
            lbClass1.Text = news_class.news_classname;

            //绑定热文
            var HotNews = from it in db.News where it.news_class == newsclassid orderby it.news_hot descending select it;
            PagedDataSource pds = new PagedDataSource();
            //pds.AllowPaging = true;
            //pds.PageSize = 3;
            //pds.DataSource = HotNews.ToList();
            //pds.CurrentPageIndex = 0;
            //rptHotNews.DataSource = pds;
            //rptHotNews.DataBind();

            //绑定资讯
            var news = from it in db.News orderby it.news_time descending select it;
            //pds.AllowPaging = true;
            //pds.PageSize = 12;
            //pds.DataSource = news.ToList();
            //lbTotal.Text = pds.PageCount.ToString();
            //pds.CurrentPageIndex = 0;
            rptHotNews.DataSource = news.ToList();
            rptHotNews.DataBind();

        }
    }

    protected void lbtChange_Click(object sender, EventArgs e)
    {

    }

    protected void rptHotNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lbHotNews");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 30) + "....";

            label.Text = simplify;
        }
    }

    protected void rptNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lbNews");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 30) + "....";

            label.Text = simplify;
        }
    }

    void DataBindToRepeater(int currentPage)
    {
        using (var db = new HuXiuEntities())
        {
            var news = from it in db.News orderby it.news_time descending select it;

            news.ToList();

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 10;

            pds.DataSource = news.ToList();

            lbTotal.Text = pds.PageCount.ToString();

            pds.CurrentPageIndex = currentPage - 1;

            rptNews.DataSource = pds;

            rptNews.DataBind();
        }

    }
    protected void btnUp_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt16(lbNow.Text) == 1)
            Response.Write("<script>alert('已在首页！')</script>");
        else
        {
            lbNow.Text = Convert.ToString(Convert.ToInt32(lbNow.Text) - 1);
            DataBindToRepeater(Convert.ToInt32(lbNow.Text));
        }
    }
    //下一页
    protected void btnDrow_Click(object sender, EventArgs e)
    {

        if (lbTotal.Text != lbNow.Text)
        {
            lbNow.Text = Convert.ToString(Convert.ToInt32(lbNow.Text) + 1);
            DataBindToRepeater(Convert.ToInt32(lbNow.Text));
        }
        else
            Response.Write("<script>alert('已在尾页！')</script>");
    }
    //首页
    protected void btnFirst_Click(object sender, EventArgs e)
    {
        DataBindToRepeater(1);
        lbNow.Text = "1";
    }
    //尾页
    protected void btnLast_Click(object sender, EventArgs e)
    {
        DataBindToRepeater(Convert.ToInt32(lbTotal.Text));
        lbNow.Text = lbTotal.Text;
    }
    //任意页
    protected void btnJump_Click(object sender, EventArgs e)
    {
        string number = txtJump.Text;
        int i;
        for (i = 0; i < number.Length; i++)
        {
            byte asc = Convert.ToByte(number[i]);
            if (asc < 48 || asc > 57) ;
        }

        if (number == "")
            Response.Write("<script>alert('输入不能为空！')</script>");
        else
        {
            int num = Convert.ToInt32(number);
            int max = Convert.ToInt32(lbTotal.Text);
            if (num < 1 || num > max)
                Response.Write("<script>alert('请正确输入数字！')</script>");
            else
            {
                DataBindToRepeater(num);
                lbNow.Text = number;
            }
        }
    }

}