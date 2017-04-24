using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_end_Period_huxiu_Search : System.Web.UI.Page
{
    protected void Page_PreLoad(object sender, EventArgs e)
    {
        try
        {
            string search = Session["search"].ToString();
        }
        catch (Exception ex)
        {
            Server.Transfer("404.aspx");
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        

        string search = Session["search"].ToString();
        if (search == "")
            Response.Write("<script>alert('输入不能为空！')</script>");
        else
            using (var db = new HuXiuEntities())
            {
                //绑定分类
                var newclass = from it in db.News_class select it;
                rptClass.DataSource = newclass.ToList();
                rptClass.DataBind();

                var result = from it in db.News where (it.news_title.Contains(search)) select it;
                int cout = result.ToList().Count;
                if (cout == 0)
                    Response.Write("<script>alert('无相关结果，自动帮您跳回首页！');location='../homePage-master/Homepageaspx.aspx'</script>");
                else if (cout < 6)
                {
                    rptResult.DataSource = result.ToList();
                    rptResult.DataBind();
                    pnVi.Visible = false;
                }
                else
                {
                    PagedDataSource pds = new PagedDataSource();
                    pds.AllowPaging = true;
                    pds.PageSize = 5;
                    pds.DataSource = result.ToList();
                    lbTotals.Text = pds.PageCount.ToString();
                    pds.CurrentPageIndex = 0;
                    rptResult.DataSource = pds;
                    rptResult.DataBind();
                }
            }

    }

    protected void rptResult_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //显示缩略
            Label label = (Label)e.Item.FindControl("lbContent");

            string newscontent = label.Text;

            string simplify = System.Text.RegularExpressions.Regex.Replace(newscontent, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 50) + "....";

            label.Text = simplify;

            //显示时间  
            label = (Label)e.Item.FindControl("lbTime");

            DateTime time = Convert.ToDateTime(label.Text);

            TimeSpan ts1 = new TimeSpan(time.Ticks);
            TimeSpan ts2 = new TimeSpan(DateTime.Now.Ticks);
            TimeSpan ts = ts1.Subtract(ts2).Duration();

            if (ts.Days >= 365)
                label.Text = "1年前";
            else if (ts.Days > 90)
                label.Text = "3个月前";
            else if (ts.Days >= 30)
                label.Text = "1个月前";
            else if (ts.Days >= 7)
                label.Text = "1周前";
            else if (ts.Days >= 3)
                label.Text = "3天前";
            else if (ts.Days != 0)
                label.Text = ts.Days.ToString() + "天前";
            else if (ts.Hours != 0)
                label.Text = ts.Hours.ToString() + "小时前";
            else if (ts.Minutes != 0)
                label.Text = ts.Minutes.ToString() + "分钟前";
            else if (ts.Seconds != 0)
                label.Text = ts.Seconds.ToString() + "秒前";
            else
                label.Text = "刚刚";

            //绑定分类
            label = (Label)e.Item.FindControl("lbID");
            int class_id = Convert.ToInt32(label.Text);
            using (var db = new HuXiuEntities())
            {
                News news1 = db.News.SingleOrDefault(a => a.news_id == class_id);
                using (var db1 = new HuXiuEntities())
                {
                    int classid = news1.news_class;
                    News_class newsclass = db1.News_class.SingleOrDefault(it => it.news_classid == classid);
                    string aa = newsclass.news_classname;
                    label.Text = newsclass.news_classname;
                }
            }
        }
    }


    void DataBindToRepeater(int currentPage)
    {
        string search = Session["search"].ToString();
        using (var db = new HuXiuEntities())
        {
            var result = from it in db.News where (it.news_title.Contains(search)) select it;

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 5;

            pds.DataSource = result.ToList();

            lbTotals.Text = pds.PageCount.ToString();

            pds.CurrentPageIndex = currentPage - 1;

            rptResult.DataSource = pds;

            rptResult.DataBind();
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (lbTotals.Text != lbNows.Text)
        {
            lbNows.Text = Convert.ToString(Convert.ToInt32(lbNows.Text) + 1);
            DataBindToRepeater(Convert.ToInt32(lbNows.Text));
        }
        else
            Response.Write("<script>alert('已在尾页！')</script>");
    }

    protected void btnLast_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt16(lbNows.Text) == 1)
            Response.Write("<script>alert('已在首页！')</script>");
        else
        {
            lbNows.Text = Convert.ToString(Convert.ToInt32(lbNows.Text) - 1);
            DataBindToRepeater(Convert.ToInt32(lbNows.Text));
        }
    }

    protected void btnGo_Click(object sender, EventArgs e)
    {
        string number = txtPage.Text;
        if (number == "")
            Response.Write("<script>alert('输入不能为空！')</script>");
        else
        {
            int num = Convert.ToInt32(number);
            int max = Convert.ToInt32(lbTotals.Text);
            if (num < 1 || num > max)
                Response.Write("<script>alert('请正确输入数字！')</script>");
            else
            {
                DataBindToRepeater(num);
                lbNows.Text = number;
            }
        }
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtusername.Text;

        Class1 login = new Class1();

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
        Response.Write("<script>window.location='Search.aspx'</script>");
    }

    protected void ltnAA_Click(object sender, EventArgs e)
    {
        
        if(Class1.Test(txtAA.Text)==0)
            Response.Write("<script>'输入含有敏感字符！'</script>");
        else
        {
            Session["search"] = txtAA.Text;
            Response.Write("<script>window.location='Search.aspx'</script>");
        }
        
    }
}