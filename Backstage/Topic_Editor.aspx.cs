using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Topic_Editor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int newsid = Convert.ToInt32(Request.QueryString["topic_id"]);
            using (var db = new HuXiuEntities())
            {
                Topic topic = db.Topic.SingleOrDefault(a => a.topic_id == newsid);
                txtTitle.Text = topic.topic_name;
                txtContent.Text = topic.topic_content;
                //var datascore = from it in db.Activity where it.activity_start > DateTime.Now select it;
                var news = from it in db.News where it.new_column==
                //News news = db.News.SingleOrDefault(a => a.news_class == newsid);
               // rptNews.DataSource = news.to
            }
        }
    }



    protected void btnChangeTitle_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["topic_id"]);
        using (var db = new HuXiuEntities())
        {
            Topic topic = db.Topic.SingleOrDefault(a => a.topic_id == newsid);
            topic.topic_name = txtTitle.Text;
            db.SaveChanges();
        }
    }

    protected void btnChangeContent_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["topic_id"]);
        using (var db = new HuXiuEntities())
        {
            Topic topic = db.Topic.SingleOrDefault(a => a.topic_id == newsid);
            topic.topic_content = txtContent.Text;
            db.SaveChanges();
        }
    }

    protected void btnChangeCover_Click(object sender, EventArgs e)
    {
        int newsid = Convert.ToInt32(Request.QueryString["topic_id"]);
        using (var db = new HuXiuEntities())
        {
            Topic topic = db.Topic.SingleOrDefault(a => a.topic_id == newsid);
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
                        topic.topic_cover = serverpath;
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
}