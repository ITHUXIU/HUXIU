using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Activity_select : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }

        RptDataBind(1);

    }

    protected void rptActivity_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label label = (Label)e.Item.FindControl("lbActivityClass");

            if(label.Text=="1")
            {
                label.Text = "虎嗅活动";
            }
            else if(label.Text=="2")
            {
                label.Text = "活动频道";
            }
            else
            {
                label.Text = "外部活动";
            }
        }
    }

    protected void rptActivity_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument.ToString());

        if (e.CommandName == "Delete")
        {
            using (var db = new HuXiuEntities())
            {
                Activity activity = db.Activity.SingleOrDefault(a => a.activity_id == id);

                db.Activity.Remove(activity);

                db.SaveChanges();
            }
            Response.Write("<script>alert('删除成功！');location='Activity_select.aspx'</script>");
        }
    }
    protected void RptDataBind(int currentPage)
    {
       
        using (var db = new HuXiuEntities())
        {
            var datascore = from it in db.Activity select it;

            if (Session["class1"] != null && Session["class1"].ToString() != "0")
            {
                int class1 = Convert.ToInt32(Session["class1"].ToString());

                datascore = from it in db.Activity where it.activity_class == class1 select it;
            }
      
            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 5;

            pds.DataSource = datascore.ToList();

            lbTotal.Text = pds.PageCount.ToString();

            pds.CurrentPageIndex = currentPage - 1;//当前页数从零开始，故把接受的数减一

            rptActivity.DataSource = pds;

            rptActivity.DataBind();

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

    protected void btnSelect_Click(object sender, EventArgs e)
    {
        int class1 = 0;
        if (activityKind.SelectedValue == "虎嗅活动")
            class1 = 1;
        else if (activityKind.SelectedValue == "活动频道")
            class1 = 2;
        else if (activityKind.SelectedValue == "外部活动")
            class1 = 3;
        Session["class1"] = class1;

        Response.Write("<script>window.location='Activity_select.aspx'</script>");
    }
}