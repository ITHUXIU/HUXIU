using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Column_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    //添加新专题
    protected void Unnamed_Click(object sender, EventArgs e)
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

                    if(txtName.Text==""|| Server.HtmlDecode(myEditor.InnerHtml)=="")
                        Response.Write("<script>alert('输入不能为空！')</script>");
                    else
                        {
                            using (var db = new HuXiuEntities())
                            {
                                var column = new Column();
                                column.column_title = txtName.Text;
                                column.column_content = Server.HtmlDecode(myEditor.InnerHtml);
                                column.column_cover = serverpath;
                                column.column_time = DateTime.Now;
                                db.Column.Add(column);
                                db.SaveChanges();

                            }

                            lblInfo.Text = "上传成功！";
                            Response.Write("<script>alert('添加成功！');location='Column_Add.aspx'</script>");
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