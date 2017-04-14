using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackstageHTML_sccl_admin_page_News_Editor : System.Web.UI.Page
{
    protected void Page_PreLoad(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
        try
        {
            int id = Convert.ToInt32(Request.QueryString["news_id"].ToString());
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
            int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
            using (var db = new HuXiuEntities())
            {
                News news = db.News.SingleOrDefault(a => a.news_id == newsid);
                txtTitle.Text = news.news_title;
                myEditor.InnerHtml = news.news_content;
                txtAuthor.Text = news.new_author;

                var newsclass = from it in db.News_class select it;
                dropClass.DataSource = newsclass.ToList();
                dropClass.DataTextField = "news_classname";
                dropClass.DataBind();


            }
        }
    }

    //修改资讯名称
    protected void btnChangeTitle_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
        string aa = txtTitle.Text;
        if (txtTitle.Text == "")
            Response.Write("<script>alert('输入不能为空！')</script>");
        else
            using (var db = new HuXiuEntities())
            {
                News news = db.News.SingleOrDefault(a => a.news_id == newsid);
                news.news_title = txtTitle.Text;
                db.SaveChanges();
                Response.Write("<script>alert('修改成功！');location='News_Delete.aspx'</script>");
            }
    }
    //修改资讯内容
    protected void btnChangeContent_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
        if (Server.HtmlDecode(myEditor.InnerHtml) == "")
            Response.Write("<script>alert('输入不能为空！')</script>");
        else
            using (var db = new HuXiuEntities())
            {
                News news = db.News.SingleOrDefault(a => a.news_id == newsid);
                news.news_content = Server.HtmlDecode(myEditor.InnerHtml);
                db.SaveChanges();
                Response.Write("<script>alert('修改成功！');location='News_Delete.aspx'</script>");
            }
    }
    //修改资讯封面
    protected void btnChangeCover_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
        using (var db = new HuXiuEntities())
        {
            News news = db.News.SingleOrDefault(a => a.news_id == newsid);
            try
            {
                if (fup.PostedFile.FileName == "")
                {
                    lblInfo.Text = "请选择文件！";
                }
                else
                {
                    if (!IsAllowedExtension(fup) == false)
                        lblInfo.Text = "上传文件格式不正确！";
                    if (IsAllowedExtension(fup) == true)
                    {
                        string filepath = fup.PostedFile.FileName;
                        string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);
                        string serverpath = Server.MapPath("picture/") + filename;
                        fup.PostedFile.SaveAs(serverpath);
                        serverpath = "picture/" + filename;
                        news.news_cover = serverpath;
                        db.SaveChanges();
                        lblInfo.Text = "上传成功！";
                        Response.Write("<script>alert('修改成功！');location='News_Delete.aspx'</script>");
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
    }
    //修改是否为首页
    protected void btnChangeTop_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
        int cout;
        using (var db = new HuXiuEntities())
        {
            using (var dd = new HuXiuEntities())
            {
                var topcount = from it in db.News where it.news_top == 1 select it;
                cout = topcount.ToList().Count;
            }
            if (Convert.ToInt16(radlTop.SelectedValue) == 1 && cout >= 2)
                lbTop.Text = "已有2条头条，不能再设置头条了！";
            else
            {
                News news = db.News.SingleOrDefault(a => a.news_id == newsid);
                news.news_top = Convert.ToInt32(radlTop.SelectedValue);
                db.SaveChanges();
                Response.Write("<script>alert('修改成功！');location='News_Delete.aspx'</script>");
            }
            
        }
    }
    //修改分类资讯
    protected void btnChangeClass_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
        using (var db = new HuXiuEntities())
        {
            News news = db.News.SingleOrDefault(a => a.news_id == newsid);
            News_class newsclass = db.News_class.SingleOrDefault(a => a.news_classname == dropClass.SelectedItem.ToString());
            news.news_id = newsclass.news_classid;
            db.SaveChanges();
            Response.Write("<script>alert('修改成功！')</script>");
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
    //修改作者
    protected void btnAuthor_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
        if (txtAuthor.Text == "")
            Response.Write("<script>alert('输入不能为空！')</script>");
        else
            using (var db = new HuXiuEntities())
            {
                News news = db.News.SingleOrDefault(a => a.news_id == newsid);
                news.new_author = txtAuthor.Text;
                db.SaveChanges();
                Response.Write("<script>alert('修改成功！');location='News_Delete.aspx'</script>");
            }
    }
}