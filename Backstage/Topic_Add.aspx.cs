using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Topic_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
                        Topic topic = new Topic();
                        topic.topic_name = txtName.Text;
                        topic.topic_content = txtContent.Text;
                        topic.topic_cover = serverpath;
                        db.SaveChanges();
                        lblInfo.Text = "上传成功！";
                    }

                }
                else
                    lblInfo.Text = "请上传图片！";
            }
        }
        catch (Exception ex)
        {
            lblInfo.Text ="上传发生错误！原因是：" + ex.ToString();
        }
    }
}