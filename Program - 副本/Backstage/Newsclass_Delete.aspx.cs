using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Newsclass_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var db = new HuXiuEntities())
        {
            var newsclass = from it in db.News_class select it;
            rptActivity_begin.DataSource = newsclass.ToList();
            rptActivity_begin.DataBind();
        }
    }

    protected void rptActivity_begin_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument.ToString());

        if (e.CommandName == "Delete")
        {
            using (var db = new HuXiuEntities())
            {
                News_class newsclass = db.News_class.SingleOrDefault(a => a.news_classid == id);

                db.News_class.Remove(newsclass);

                db.SaveChanges();
            }
        }
    }
}