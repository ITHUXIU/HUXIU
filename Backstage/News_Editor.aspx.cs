using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackstageHTML_sccl_admin_page_News_Editor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
            using (var db = new HuXiuEntities())
            {
                News news = db.News.SingleOrDefault(a => a.news_id == newsid);
                txtTitle.Text = news.news_title;
                txtContent.Text = news.news_content;
                txtAuthor.Text = news.new_author;
            }
        }
    }


    protected void btnChangeTitle_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
        using (var db = new HuXiuEntities())
        {
            News news = db.News.SingleOrDefault(a => a.news_id == newsid);
            news.news_title = txtTitle.Text;
            db.SaveChanges();
        }
    }

    protected void btnChangeContent_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
        using (var db = new HuXiuEntities())
        {
            News news = db.News.SingleOrDefault(a => a.news_id == newsid);
            news.news_content = txtContent.Text;
            db.SaveChanges();
        }
    }

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

    protected void btnChangeTop_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
        using (var db = new HuXiuEntities())
        {
            News news = db.News.SingleOrDefault(a => a.news_id == newsid);
            news.news_top = Convert.ToInt32(radlTop.SelectedValue);
            db.SaveChanges();
        }
    }
    protected void btnChangeClass_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
        using (var db = new HuXiuEntities())
        {
            News news = db.News.SingleOrDefault(a => a.news_id == newsid);
            News_class newsclass = db.News_class.SingleOrDefault(a => a.news_classname == dropClass.SelectedItem.ToString());
            news.news_id = newsclass.news_classid;
            db.SaveChanges();
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

    protected void btnAuthor_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["news_id"]);
        using (var db = new HuXiuEntities())
        {
            News news = db.News.SingleOrDefault(a => a.news_id == newsid);
            news.new_author = txtAuthor.Text;
            db.SaveChanges();
        }
    }
}