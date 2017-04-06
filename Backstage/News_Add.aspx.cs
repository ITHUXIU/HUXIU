using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackstageHTML_sccl_admin_page_News_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var db = new HuXiuEntities())
        {

            var newsclass = from it in db.News_class select it;
            dropClass.DataSource = newsclass.ToList();
            dropClass.DataTextField = "news_classname";
            dropClass.DataBind();
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
    //添加资讯
    protected void btnSub_Click(object sender, EventArgs e)
    {
        int newsclassid;
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

                    using (var db = new HuXiuEntities())
                    {
                        var news = new News();
                        if (txtTitle.Text == "")
                            Response.Write("<script>alert('输入不能为空！')</script>");
                        else if (Server.HtmlDecode(myEditor.InnerHtml) == "")
                            Response.Write("<script>alert('输入不能为空！')</script>");
                        else if (txtAuthor.Text=="")
                            Response.Write("<script>alert('输入不能为空！')</script>");
                        else
                        {
                            news.news_title = txtTitle.Text;
                            news.news_content = Server.HtmlDecode(myEditor.InnerHtml);
                            news.news_time = DateTime.Now;
                            int cout;
                            using (var dd = new HuXiuEntities())
                            {
                                var topcount = from it in db.News where it.news_top==1 select it;
                                cout = topcount.ToList().Count;
                            }
                            if (Convert.ToInt16(radlTop.SelectedValue) == 1 && cout > 2)
                                Response.Write("<script>alert('已有三条头条，不能再设置头条了！');location='News_Add.aspx'</script>");

                            else
                            {
                                news.news_top = Convert.ToInt16(radlTop.SelectedValue);

                                news.news_cover = serverpath;
                                using (var db_0 = new HuXiuEntities())
                                {
                                    string dropclass = dropClass.SelectedValue.ToString();
                                    News_class news_class = db_0.News_class.SingleOrDefault(a => a.news_classname == dropclass);
                                    newsclassid = news_class.news_classid;
                                }
                                news.news_class = newsclassid;
                                news.new_column = 1;
                                news.new_author = txtAuthor.Text;
                                db.News.Add(news);
                                db.SaveChanges();
                            }
                            lblInfo.Text = "上传成功！";
                            Response.Write("<script>alert('添加成功！');location='News_Add.aspx'</script>");
                        }

                        
                    }
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