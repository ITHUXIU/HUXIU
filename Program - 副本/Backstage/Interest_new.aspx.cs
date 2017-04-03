using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Interest_new : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInterestNew_Click(object sender, EventArgs e)
    {
        if (txtInterstTitle != null && txtUrl != null && myEditor.InnerHtml != null)
        {
            using (var db = new HuXiuEntities())
            {
                Interest interest = new Interest();

                interest.interest_time = DateTime.Now;

                interest.interest_title = txtInterstTitle.Text;

                interest.interest_content = Server.HtmlDecode(myEditor.InnerHtml);

                interest.interest_url = txtUrl.Text;

                db.Interest.Add(interest);

                db.SaveChanges();
            }
            Response.Write("<script>alert('添加成功！');location=Interest_new.aspx</script>");
        }
        else
        {
            Response.Write("<script>alert('请填写完全！')</script>");
        }
    }
}