using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Activity_begin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RptDataBind();
    }
    protected void RptDataBind()
    {

        using (var db = new HuXiuEntities())
        {
            var datascore = from it in db.Activity where it.activity_start >DateTime.Now select it;

            rptActivity_begin.DataSource = datascore.ToList();

            rptActivity_begin.DataBind();

        }

    }

    protected void rptActivity_begin_ItemCommand(object source, RepeaterCommandEventArgs e)
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