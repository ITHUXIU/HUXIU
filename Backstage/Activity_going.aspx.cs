using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Activity_going : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RptDataBind();
    }
    protected void RptDataBind()
    {

        using (var db = new HuXiuEntities())
        {
            var datascore = from it in db.Activity where it.activity_start < DateTime.Now && it.activity_end > DateTime.Now select it;

            rptActivity_going.DataSource = datascore.ToList();

            rptActivity_going.DataBind();

        }

    }
    protected void rptActivity_going_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}