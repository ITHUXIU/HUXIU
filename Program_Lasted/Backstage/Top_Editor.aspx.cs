using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Top_Editor : System.Web.UI.Page
{
    protected void Page_PreLoad(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
        try
        {
            int id = Convert.ToInt32(Request.QueryString["top_id"].ToString());
        }
        catch (Exception ex)
        {
            Server.Transfer("../Front-end/Period-huxiu/404.aspx");
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
        if (!IsPostBack)
        {
            using (var db = new HuXiuEntities())
            {
                int topid = Convert.ToInt32(Request.QueryString["top_id"].ToString());

                Top top = db.Top.SingleOrDefault(a => a.top_id == topid);

                imgTop.ImageUrl = top.top_path;

                imgCover.ImageUrl = top.top_cover;

                News topnews = db.News.SingleOrDefault(a => a.news_id == top.top_news);

                lbTitle.Text = topnews.news_title;
                
                string simplify = System.Text.RegularExpressions.Regex.Replace(topnews.news_content, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

                if (simplify.Length > 50)
                    simplify = simplify.Substring(0, 50) + "....";

                lbContent.Text = simplify;

                var news = from it in db.News where it.news_id != top.top_news select it;

                PagedDataSource pds = new PagedDataSource();

                pds.AllowPaging = true;

                pds.PageSize = 10;

                pds.DataSource = news.ToList();

                lbTotal.Text = pds.PageCount.ToString();

                pds.CurrentPageIndex = 1 - 1;

                rptNews.DataSource = pds;

                rptNews.DataBind();

            }
        }
    }
    protected void lbtDetail_Click(object sender, EventArgs e)
    {
        using (var db = new HuXiuEntities())
        {
            int topid = Convert.ToInt32(Request.QueryString["top_id"].ToString());

            Top top = db.Top.SingleOrDefault(a => a.top_id == topid);

            News topnews = db.News.SingleOrDefault(a => a.news_id == top.top_news);

            lbContent.Text = topnews.news_content;

            lbtDetail.Visible = false;

            lbtBrief.Visible = true;

        }
        
    }


    protected void lbtBrief_Click(object sender, EventArgs e)
    {
        using (var db = new HuXiuEntities())
        {
            int topid = Convert.ToInt32(Request.QueryString["top_id"].ToString());

            Top top = db.Top.SingleOrDefault(a => a.top_id == topid);

            News topnews = db.News.SingleOrDefault(a => a.news_id == top.top_news);

            string simplify = System.Text.RegularExpressions.Regex.Replace(topnews.news_content, @"<[///!]*?[^<>]*?>", "").Replace("\n", "").Replace(" ", "").Replace("\t", "").Replace("\r", "").Replace("&nbsp;", "");

            if (simplify.Length > 50)
                simplify = simplify.Substring(0, 50) + "....";

            lbContent.Text = simplify;

            lbtDetail.Visible = true;

            lbtBrief.Visible = false;

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
        if (e.CommandName == "Set")
        {
            int newsid = Convert.ToInt32(e.CommandArgument.ToString());

            int topid = Convert.ToInt32(Request.QueryString["top_id"]);

            using (var db = new HuXiuEntities())
            {
                Top top = db.Top.SingleOrDefault(a => a.top_id == topid);
                top.top_news = newsid;
                db.SaveChanges();
            }
            Response.Write("<script>alert('设置成功！');location='Top.aspx'</script>");

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

    private static bool IsAllowedExtension(FileUpload upfile)
    {
        string strOldFilePath = "";
        string strExtension = "";
        string[] arrExtension = { ".gif", ".jpg", ".bmp", ".png" };
        if (upfile.PostedFile.FileName != string.Empty)
        {
            strOldFilePath = upfile.PostedFile.FileName;//获得文件的完整路径名 
            strExtension = strOldFilePath.Substring(strOldFilePath.LastIndexOf("."));//获得文件的扩展名，如：.jpg 
            for (int i = 0; i < arrExtension.Length; i++)
            {
                if (strExtension.Equals(arrExtension[i]))
                {
                    return true;
                }
            }
        }
        return false;
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        try
        {
            if (fup.PostedFile.FileName == "")
            {
                lblInfo.Text = "请选择文件！";
            }
            else
            {
                if (IsAllowedExtension(fup) == true)
                {
                    string filepath = fup.PostedFile.FileName;
                    string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);
                    string serverpath = Server.MapPath("picture/") + filename;
                    fup.PostedFile.SaveAs(serverpath);
                    serverpath = "picture/" + filename;

                    using (var db = new HuXiuEntities())
                    {
                        int topid = Convert.ToInt32(Request.QueryString["top_id"]);
                        Top top = db.Top.SingleOrDefault(a => a.top_id == topid);
                        top.top_path = serverpath;
                        db.SaveChanges();
                    }
                    Response.Write("<script>alert('上传成功！');location='Top.aspx'</script>");
                }
                else
                    lblInfo.Text = "请上传图片！";
            }
        }
        catch (Exception ex)
        {
            lblInfo.Text = DateTime.Now.ToString() + "上传发生错误！原因是：" + ex.ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.PostedFile.FileName == "")
            {
                Label1.Text = "请选择文件！";
            }
            else
            {
                if (IsAllowedExtension(FileUpload1) == true)
                {
                    string filepath = FileUpload1.PostedFile.FileName;
                    string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);
                    string serverpath = Server.MapPath("picture/") + filename;
                    FileUpload1.PostedFile.SaveAs(serverpath);
                    serverpath = "picture/" + filename;

                    using (var db = new HuXiuEntities())
                    {
                        int topid = Convert.ToInt32(Request.QueryString["top_id"]);
                        Top top = db.Top.SingleOrDefault(a => a.top_id == topid);
                        top.top_cover = serverpath;
                        db.SaveChanges();
                    }
                    Response.Write("<script>alert('上传成功！');location='Top.aspx'</script>");
                }
                else
                    Label1.Text = "请上传图片！";
            }
        }
        catch (Exception ex)
        {
            Label1.Text = DateTime.Now.ToString() + "上传发生错误！原因是：" + ex.ToString();
        }
    }
}