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
        using (var db = new HuXiuEntities())
        {
            var news = from it in db.News select it;
            rptNews.DataSource = news.ToList();
            rptNews.DataBind();
        }
    }

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
                rptNews.DataBind();
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
        int i, flag = 1;
        for (i = 0; i < number.Length; i++)
        {
            byte asc = Convert.ToByte(number[i]);
            if (asc < 48 || asc > 57) flag = 0;
        }

        if (flag == 0)
            Response.Write("<script>alert('请正确输入数字！')</script>");
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
        //if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //{
        //    Label lbText = (Label)e.Item.FindControl("lbText");          //寻找label控件

        //    lbText.Text = (1 + e.Item.ItemIndex).ToString();
        //}
    }
}