using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Column_Editor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new HuXiuEntities())
            {
                int id = Convert.ToInt32(Request.QueryString["column_id"].ToString());
                Column column = db.Column.SingleOrDefault(a => a.column_id == id);
                txtName.Text = column.column_title;
                myEditor .InnerHtml = column.column_content;
                var news = from it in db.News where it.new_column == id select it;
                rptHave.DataSource = news.ToList();
                rptHave.DataBind(); 
                if (news.ToList().Count == 0)
                    divHave.Visible = false;
                rptNews.DataSource = news.ToList();
                rptNews.DataBind();
            }
        }
    }


    void DataBindToRepeater(int currentPage)
    {
        int id = Convert.ToInt32(Request.QueryString["column_id"].ToString());
        using (var db = new HuXiuEntities())
        {
            var news = from it in db.News where it.news_class == id select it;

            news.ToList();

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 10;

            pds.DataSource = news.ToList();

            lbTotal.Text = pds.PageCount.ToString();

            pds.CurrentPageIndex = currentPage - 1;

            rptHave.DataSource = pds;

            rptHave.DataBind();


        }

    }


    //修改封面
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

                    using (var db = new HuXiuEntities())
                    {
                        int id = Convert.ToInt32(Request.QueryString["column_id"].ToString());
                        Column column = db.Column.SingleOrDefault(a => a.column_id == id);
                        column.column_cover = serverpath;
                        db.SaveChanges();

                    }

                    lblInfo.Text = "上传成功！";
                    Response.Write("<script>alert('修改成功！');location='Column_Delete.aspx'</script>");
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
    //修改名字
    protected void btnName_Click(object sender, EventArgs e)
    {
        using (var db = new HuXiuEntities())
        {
            int id = Convert.ToInt32(Request.QueryString["column_id"].ToString());
            Column column = db.Column.SingleOrDefault(a => a.column_id == id);
            column.column_title = txtName.Text;
            db.SaveChanges();
            Response.Write("<script>alert('修改成功！');location='Column_Delete.aspx'</script>");
        }
      
    }
    //修改内容
    protected void btnContent_Click(object sender, EventArgs e)
    {
        using (var db = new HuXiuEntities())
        {
            int id = Convert.ToInt32(Request.QueryString["column_id"].ToString());
            Column column = db.Column.SingleOrDefault(a => a.column_id == id);
            column.column_content = Server.HtmlDecode(myEditor.InnerHtml);
            db.SaveChanges();
            Response.Write("<script>alert('修改成功！');location='Column_Delete.aspx'</script>");
        }
    }
    //判断上传格式
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
    
    protected void rptHave_ItemCommand(object source, RepeaterCommandEventArgs e)
    {   
        //将已有资讯从专题中移出
        if(e.CommandName=="Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new HuXiuEntities())
            {
                News news = db.News.SingleOrDefault(a => a.news_id == id);
                news.new_column = 1;
                db.SaveChanges();
                Response.Write("<script>alert('修改成功！');location='Column_Delete.aspx'</script>");
                rptHave.DataBind();
            }
            
        }
    }
    //按ID查找资讯
    protected void lbtID_Click(object sender, EventArgs e)
    {
        divID.Visible = true;
    }
    //按ID查找结果绑定
    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        int  id =Convert.ToInt32( txtID.Text);
        using (var db = new HuXiuEntities())
        {
            var news = from it in db.News where it.news_id==id select it;
            rptNews.DataSource = news.ToList();
            rptNews.DataBind();
            rptNews.Visible = true;
        }
    }
    //按名称查找资讯
    protected void lbtNames_Click(object sender, EventArgs e)
    {
        divNames.Visible = true;
    }
    //按名称查找结果绑定
    protected void btnFind_Click(object sender, EventArgs e)
    {
        string name = txtNames.Text;
        using (var db = new HuXiuEntities())
        {
            var news = from it in db.News where (it.news_title.Contains(name)) select it;
            rptNews.DataSource = news.ToList();
            rptNews.DataBind();
            rptNews.Visible = true;
        }


    }

    protected void rptNews_ItemCommand(object source, RepeaterCommandEventArgs e)
    {   
        //将资讯添加到专题
        if(e.CommandName=="Add")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new HuXiuEntities())
            {
                var news = db.News.SingleOrDefault(a => a.news_id == id);
                news.new_column = Convert.ToInt32(Request.QueryString["column_id"].ToString());
                db.SaveChanges();
                Response.Write("<script>alert('添加成功！');location='Column_Delete.aspx'</script>");
            }
        }
    }
    //跳至首页
    protected void btnFirst_Click(object sender, EventArgs e)
    {
        DataBindToRepeater(1);
        lbNow.Text = "1";
    }
    //跳至尾页
    protected void btnLast_Click(object sender, EventArgs e)
    {
        DataBindToRepeater(Convert.ToInt32(lbTotal.Text));
        lbNow.Text = lbTotal.Text;
    }
    //任意跳页
    protected void btnJump_Click(object sender, EventArgs e)
    {
        string number = txtJump.Text;
        int i, flag = 1;
        for (i = 0; i < number.Length; i++)
        {
            byte asc = Convert.ToByte(number[i]);
            if (asc < 48 || asc > 57) flag = 0;
        }

        if (flag == 0)
            Response.Write("<script>alert('请正确输入数字！')</script>");
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

}