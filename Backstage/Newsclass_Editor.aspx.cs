using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Newsclass_Editor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["newsclassid"]);
        if (!IsPostBack)
        {
            using (var db = new HuXiuEntities())
            {
                News_class newsclass = db.News_class.SingleOrDefault(a => a.News_classid == id);
                txtName.Text = newsclass.News_classname;
            }
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["newsclassid"]);
        using (var db = new HuXiuEntities())
        {
            News_class newsclass = db.News_class.SingleOrDefault(a => a.News_classid == id);
            newsclass.News_classname = txtName.Text;
            db.SaveChanges();
        }
    }
}