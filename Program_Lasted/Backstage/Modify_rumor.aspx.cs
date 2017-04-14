using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Modify_rumor : System.Web.UI.Page
{
    protected void Page_PreLoad(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
        try
        {
            int id = Convert.ToInt32(Request.QueryString["id"].ToString());
        }
        catch (Exception ex)
        {
            Server.Transfer("../Front-end/Period-huxiu/404.aspx");
        }

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
        if (!IsPostBack)
        {
            int id = Convert.ToInt32(Request.QueryString["id"].ToString());

            using (var db = new HuXiuEntities())
            {
                Rumor rumor = db.Rumor.SingleOrDefault(a => a.rumor_id == id);

                txtRumorTitle.Text = rumor.rumor_title;

                myEditor.InnerHtml = rumor.rumor_content;

                txtRumorTime.Text = rumor.rumor_time.ToShortDateString();

                txtRumorHot.Text = rumor.rumor_hot.ToString();

                txtRumorState.Text = rumor.rumor_state.ToString();

                txtRumorLike.Text = rumor.rumor_like.ToString();

            }
        }
    }


    protected void btnRumor_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());

        if (txtRumorTitle.Text != "" && txtRumorTime.Text != "" && txtRumorHot.Text != "" && txtRumorState.Text != "" && myEditor.InnerHtml != ""&& txtRumorLike.Text!="")
        {
            using (var db = new HuXiuEntities())
            {
                Rumor rumor = db.Rumor.SingleOrDefault(a => a.rumor_id == id);

                rumor.rumor_title = txtRumorTitle.Text;

                rumor.rumor_content = Server.HtmlDecode(myEditor.InnerHtml);

                rumor.rumor_hot = Convert.ToInt32(txtRumorHot.Text);

                rumor.rumor_like = Convert.ToInt32(txtRumorLike.Text);

                rumor.rumor_state = Convert.ToInt32(txtRumorState.Text);

                rumor.rumor_time = Convert.ToDateTime(txtRumorTime.Text);

                db.SaveChanges();

            }
        }
        else
        {
            Response.Write("<script>alert('请填写完全！')</script>");
        }
    }
}