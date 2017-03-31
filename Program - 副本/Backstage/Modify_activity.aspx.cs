using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Modify_activity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            int id = Convert.ToInt32(Request.QueryString["id"].ToString());

            using (var db = new HuXiuEntities())
            {
                Activity activity = db.Activity.SingleOrDefault(a => a.activity_id == id);

                txtTitle.Text = activity.activity_name;

                myEditor.InnerHtml = activity.activity_content;

                ibtnChangeiamge.ImageUrl = activity.activity_cover;

                txtTopicName.Text = activity.activity_topicname;

                txtActivityBeginTime.Text = activity.activity_start.ToString();

                txtActivityEndTime.Text = activity.activity_end.ToString();

                txtCoverLabel.Text = activity.activity_coverlable;

            }
        }
    }

    protected void btnActivity_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());

        string activity_content = Server.HtmlDecode(myEditor.InnerHtml);

        using (var db = new HuXiuEntities())
        {
            Activity new_activity = db.Activity.SingleOrDefault(a => a.activity_id == id);

            new_activity.activity_name = txtTitle.Text;

            new_activity.activity_content = myEditor.InnerHtml;

            new_activity.activity_topicname = txtTopicName.Text;

            new_activity.activity_start = Convert.ToDateTime(txtActivityBeginTime.Text);

            new_activity.activity_end = Convert.ToDateTime(txtActivityEndTime.Text);

            new_activity.activity_coverlable = txtCoverLabel.Text;

            db.SaveChanges();

            Response.Write("<script>alert('修改成功！')</script>");
        }

    }

    protected void btnActivity_return_Click(object sender, EventArgs e)
    {

    }

    protected void ibtnChangeiamge_Click(object sender, ImageClickEventArgs e)
    {
        if (panel.Visible == false)
            panel.Visible = true;
        else
            panel.Visible = false;
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());

        Boolean fileOk = false;
        //指定文件路径，pic是项目下的一个文件夹；～表示当前网页所在的文件夹
        String path = Server.MapPath("../Images/");//物理文件路径

        int length = this.FileUpload1.PostedFile.ContentLength;//获取图片大小，以字节为单位


        //文件上传控件中如果已经包含文件
        if (FileUpload1.HasFile)
        {
            //得到文件的后缀
            String fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

            //允许文件的后缀
            String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg", ".bmp" };

            //看包含的文件是否是被允许的文件的后缀
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    fileOk = true;
                }
            }
        }
        if (fileOk)
        {
            try
            {

                //文件另存在服务器的指定目录下     
                string name = FileUpload1.FileName;//获取上传的文件名

                path = "../Images/" + name;

                ibtnChangeiamge.ImageUrl = path;

                FileUpload1.SaveAs(System.Web.HttpContext.Current.Server.MapPath(path));
           
                using (var db = new HuXiuEntities())
                {
                    Activity activity = db.Activity.SingleOrDefault(a => a.activity_id == id);

                    activity.activity_cover = path;

                    db.SaveChanges();
                }

                    panel.Visible = false;

                Response.Write("<script>alert('文件上传成功！');</script>");
            }
            catch
            {
                Response.Write("<script>alert('文件上传失败！');</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('只能上传png,jpg,bmp图象文件！');</script>");
        }
    }
}