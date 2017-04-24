using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Modify_interest : System.Web.UI.Page
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
                Interest interest = db.Interest.SingleOrDefault(a => a.interest_id == id);

                txtInterestTitle.Text = interest.interest_title;

                myEditor.InnerHtml = interest.interest_content;

                txtTime.Text = interest.interest_time.ToString();

                txtUrl.Text = interest.interest_url;

                txtLike.Text = interest.interest_like.ToString();

            }
        }
    }

    protected void btnInterest_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());

        if (txtInterestTitle.Text != "" && txtLike.Text != "" && txtTime.Text != "" && txtUrl.Text != "" && myEditor.InnerHtml != "")
        {
            using (var db = new HuXiuEntities())
            {
                Interest interest = db.Interest.SingleOrDefault(a => a.interest_id == id);

                interest.interest_title = txtInterestTitle.Text;

                interest.interest_like = Convert.ToInt32(txtLike.Text);

                interest.interest_time = Convert.ToDateTime(txtTime.Text);

                interest.interest_url = txtUrl.Text;

                interest.interest_content = Server.HtmlDecode(myEditor.InnerHtml);

                db.SaveChanges();

                Response.Write("<script>alert('编辑成功！');location='Interesting.aspx'</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('请填写完全！')</script>");
        }
    }

}