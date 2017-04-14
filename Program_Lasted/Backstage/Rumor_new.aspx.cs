using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Rumor_new : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
    }

    protected void btnRumor_Click(object sender, EventArgs e)
    {
        if (txtRumorTitle.Text != "" && txtRumorTime.Text != "" && txtRumorHot.Text != "" && myEditor.InnerHtml != "" && txtRumorLike.Text != "")
        {
            using (var db = new HuXiuEntities())
            {
                Rumor rumor = new Rumor();

                rumor.rumor_title = txtRumorTitle.Text;

                rumor.rumor_content = Server.HtmlDecode(myEditor.InnerHtml);

                if(txtRumorHot.Text!="")
                rumor.rumor_hot = Convert.ToInt32(txtRumorHot.Text);

                rumor.rumor_like = Convert.ToInt32(txtRumorLike.Text);

                if(rumorState.SelectedValue=="传言中")
                {
                    //1代表传言中
                    rumor.rumor_state = 1;
                }
                else
                {
                    rumor.rumor_state = 2;
                }
               

                rumor.rumor_time = Convert.ToDateTime(txtRumorTime.Text);

                db.Rumor.Add(rumor);

                db.SaveChanges();

                Response.Write("<script>alert('添加传言成功！');location='Rumor.aspx'</script>");

            }
        }
        else
        {
            Response.Write("<script>alert('请填写完全！')</script>");
        }
    }
}