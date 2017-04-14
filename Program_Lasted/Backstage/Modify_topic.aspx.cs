using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Modify_topic : System.Web.UI.Page
{
    protected void Page_PreLoad(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
        try
        {
            int id = Convert.ToInt32(Request.QueryString["id"].ToString());
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
        RptDataBind(1);
        if (!IsPostBack)
        {
            int id = Convert.ToInt32(Request.QueryString["id"].ToString());

            using (var db = new HuXiuEntities())
            {
                Topic topic = db.Topic.SingleOrDefault(a => a.topic_id == id);

                txtTopicName.Text = topic.topic_name;

                txtTopicContent.Text = topic.topic_content;

                ibtnTopicImage.ImageUrl = topic.topic_cover;

            }
        }
    }

    protected void ibtnTopicImage_Click(object sender, ImageClickEventArgs e)
    {
        if (panel.Visible == false)
            panel.Visible = true;
        else
            panel.Visible = false;
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        //int id = Convert.ToInt32(Request.QueryString["id"].ToString());

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

                ibtnTopicImage.ImageUrl = path;

                FileUpload1.SaveAs(System.Web.HttpContext.Current.Server.MapPath(path));

                //using (var db = new HuXiuEntities())
                //{
                //    Activity activity = db.Activity.SingleOrDefault(a => a.activity_id == id);

                //    activity.activity_cover = path;

                //    db.SaveChanges();
                //}

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

    protected void RptDataBind(int currentPage)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);

        using (var db = new HuXiuEntities())
        {
            var datascore = from it in db.Activity where it.activity_topicid == id select it;

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 5;

            pds.DataSource = datascore.ToList();

            lbTotal.Text = pds.PageCount.ToString();

            pds.CurrentPageIndex = currentPage - 1;//当前页数从零开始，故把接受的数减一

            rptActivity_topic.DataSource = pds;

            rptActivity_topic.DataBind();

        }

    }
    protected void btnDown_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(lbNow.Text) + 1 <= Convert.ToInt32(lbTotal.Text))
        {
            lbNow.Text = Convert.ToString(Convert.ToInt32(lbNow.Text) + 1);

            RptDataBind(Convert.ToInt32(lbNow.Text));
        }
    }
    protected void btnFirst_Click(object sender, EventArgs e)
    {
        lbNow.Text = Convert.ToString(1);
        RptDataBind(1);
    }
    protected void btnLast_Click(object sender, EventArgs e)
    {
        lbNow.Text = lbTotal.Text;

        RptDataBind(Convert.ToInt32(lbTotal.Text));
    }
    protected void btnJump_Click(object sender, EventArgs e)
    {
        if (RequiredFieldValidator1.IsValid == true)
        {
            if (Convert.ToInt32(txtJump.Text) <= Convert.ToInt32(lbTotal.Text) && Convert.ToInt32(txtJump.Text) >= 1)
            {
                lbNow.Text = txtJump.Text;

                RptDataBind(Convert.ToInt32(txtJump.Text));
            }
        }
    }
    protected void btnUp_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(lbNow.Text) - 1 >= 1)
        {
            lbNow.Text = Convert.ToString(Convert.ToInt32(lbNow.Text) - 1);

            RptDataBind(Convert.ToInt32(lbNow.Text));
        }
    }

    protected void rptActivity_topic_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument.ToString());

        if(e.CommandName=="Delete")
        {
            using (var db = new HuXiuEntities())
            {
                Activity activity = db.Activity.SingleOrDefault(a => a.activity_id == id);

                db.Activity.Remove(activity);

                db.SaveChanges();
            }
        }
    }
}