using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Activity_system : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RptDataBind2(1);
        RptDataBind(1);
    }
    protected void rptActivity_topic_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument.ToString());

        if (e.CommandName == "Delete")
        {
            using (var db = new HuXiuEntities())
            {
                Topic topic = db.Topic.SingleOrDefault(a => a.topic_id == id);

                db.Topic.Remove(topic);

                db.SaveChanges();
            }
        }
    }
    protected void RptDataBind2(int currentPage)
    {

        using (var db = new HuXiuEntities())
        {
            var datascore = from it in db.Topic select it;

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
    protected void btnDown2_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(lbNow.Text) + 1 <= Convert.ToInt32(lbTotal.Text))
        {
            lbNow.Text = Convert.ToString(Convert.ToInt32(lbNow.Text) + 1);

            RptDataBind2(Convert.ToInt32(lbNow.Text));
        }
    }
    protected void btnFirst2_Click(object sender, EventArgs e)
    {
        lbNow.Text = Convert.ToString(1);
        RptDataBind2(1);
    }
    protected void btnLast2_Click(object sender, EventArgs e)
    {
        lbNow.Text = lbTotal.Text;

        RptDataBind2(Convert.ToInt32(lbTotal.Text));
    }
    protected void btnJump2_Click(object sender, EventArgs e)
    {
        if (RequiredFieldValidator1.IsValid == true)
        {
            if (Convert.ToInt32(txtJump.Text) <= Convert.ToInt32(lbTotal.Text) && Convert.ToInt32(txtJump.Text) >= 1)
            {
                lbNow.Text = txtJump.Text;

                RptDataBind2(Convert.ToInt32(txtJump.Text));
            }
        }
    }
    protected void btnUp2_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(lbNow.Text) - 1 >= 1)
        {
            lbNow.Text = Convert.ToString(Convert.ToInt32(lbNow.Text) - 1);

            RptDataBind2(Convert.ToInt32(lbNow.Text));
        }
    }
    protected void RptDataBind(int currentPage)
    {

        using (var db = new HuXiuEntities())
        {
            var datascore = from it in db.Activity where it.activity_topicid==null select it;

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 5;

            pds.DataSource = datascore.ToList();

            lbTotal.Text = pds.PageCount.ToString();

            pds.CurrentPageIndex = currentPage - 1;//当前页数从零开始，故把接受的数减一

            rptActivity_notopic.DataSource = pds;

            rptActivity_notopic.DataBind();

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

    protected void rptActivity_notopic_ItemCommand(object source, RepeaterCommandEventArgs e)
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
        }
    }

    protected void btnback2_Click(object sender, EventArgs e)
    {
        panelTopicActivity.Visible = false;

        panelTopicActivityAdd.Visible = true;
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        panelTopicActivity.Visible = true;

        panelTopicActivityAdd.Visible = false;
    }
}