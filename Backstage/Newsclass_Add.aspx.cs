using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Newsclass_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        if (txtClass.Text == "")
            Response.Write("<script>alert('输入不能为空！')</script>");
        else
            using (var db = new HuXiuEntities())
            {
                News_class newsclass = new News_class();
                newsclass.news_classname = txtClass.Text;
                db.News_class.Add(newsclass);
                Response.Write("<script>alert('添加成功！');location='Newsclass_Add.aspx'</script>");
                db.SaveChanges();
            }
    }
}