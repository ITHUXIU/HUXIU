using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Activity_end : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RptDataBind();
    }
    protected void RptDataBind()
    {

        using (var db = new HuXiuEntities())
        {
            var datascore = from it in db.Activity where it.activity_end < DateTime.Now select it;

            rptActivity_end.DataSource = datascore.ToList();

            rptActivity_end.DataBind();

        }

    }
    protected void rptActivity_end_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}