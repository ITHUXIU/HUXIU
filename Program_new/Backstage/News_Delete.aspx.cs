using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackstageHTML_sccl_admin_page_News_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
        if (!IsPostBack) {
        using (var db = new HuXiuEntities())
        {
            var news = from it in db.News select it;

                PagedDataSource pds = new PagedDataSource();

                pds.AllowPaging = true;

                pds.PageSize = 10;

                pds.DataSource = news.ToList();

                lbTotal.Text = pds.PageCount.ToString();

                pds.CurrentPageIndex = 1 - 1;

                rptNews.DataSource = pds;

                rptNews.DataBind();
               
           /* var news = from it in db.News select new MyDataInfo
            {
                news_id = it.news_id,
                news_class = it.news_class,
                news_content = it.news_content,
                news_cover = it.news_cover,
                news_title = it.news_title,
                news_time = it.news_time,
                news_hot = it.news_hot,
                news_like = it.news_like,
                news_top = it.news_top,
                new_author = it.new_author,
                new_column = it.new_column
            };
            DataTable dt = transToDataTable(news);

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 10;

            pds.DataSource = news.ToList();

            lbTotal.Text = pds.PageCount.ToString();

            pds.CurrentPageIndex = 0;

            rptNews.DataSource = pds;

            rptNews.DataBind();

            //rptNews.DataSource = dt;
            //rptNews.DataBind();*/
           }  
        }
    }





  /*  private DataTable transToDataTable(IQueryable<MyDataInfo> ans)
    {

        string[] column = new string[] { "news_id", "news_class", "news_content", "news_cover", "news_title", "news_time", "new_author", "new_column", "news_hot", "news_top" };
        DataTable dt = new DataTable();
        //为新标建立列明
        for (int i = 0; i < column.Length ; i++)
        {
            DataColumn dc = new DataColumn(column[i], Type.GetType("System.String"));   //第一个参数 列名，第二个参数 列的类型
            dt.Columns.Add(dc);                                                     ///把列添加到新建表中
        }
        
        //向 DT 中添加数据
        foreach (var item in ans)
        {
            DataRow dr = dt.NewRow();
            dr["news_id"] = item.news_id.ToString();
            dr["news_class"] = item.news_class.ToString();
            dr["news_content"] = item.news_content.ToString();
            dr["news_cover"] = item.news_cover.ToString();
            dr["news_title"] = item.news_title.ToString();
            //dr["news_hot"] = item.news_time.ToString();
            dr["new_author"] = item.news_time.ToString();
            dr["new_column"] = item.news_time.ToString();
            dr["news_hot"] = item.news_time.ToString();
            dr["news_top"] = item.news_time.ToString();
            dr["news_time"] = item.news_time.ToString();
            dt.Rows.Add(dr);
        }
        return dt;
    }

    public class MyDataInfo
    {
        public int news_id { get; set; }

        public string news_title { get; set; }

        public string news_content { get; set; }

        public DateTime news_time { get; set; }

        public int news_top { get; set; }

        public string news_cover { get; set; }

        public int news_class { get; set; }

        public int news_like { get; set; }

        public int news_hot { get; set; }

        public int new_column { get; set; }

        public string new_author { get; set; }

    }*/


    void DataBindToRepeater(int currentPage)
    {
        using (var db = new HuXiuEntities())
        {
            var news = from it in db.News select it;
            //news.ToList();

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

    //删除资讯
    protected void rptNews_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int newsid = Convert.ToInt32(e.CommandArgument.ToString());

            using (var db = new HuXiuEntities())
            {
                News del = db.News.SingleOrDefault(a => a.news_id == newsid);
                db.News.Remove(del);
                db.SaveChanges();
                //rptNews.DataBind();
                Response.Write("<script>alert('删除成功！');location='News_Delete.aspx'</script>");
            }
        }

    }
    //上一页
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

        if (number=="")
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


    protected void rptNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lb");

            string activity = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(activity, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 50) + "....";

            label.Text = simplify;

        }
    }
}