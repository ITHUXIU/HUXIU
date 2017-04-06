﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Top : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var db = new HuXiuEntities())
        {
            var top = from it in db.Top select it;
            rptTop.DataSource = top.ToList();
            rptTop.DataBind();
        }
    }

}