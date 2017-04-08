using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Backstage_Add_manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Write("<script>alert('尚未登录!');location='../Login/Login.aspx'</script>");
        }
    }
    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        Class1 register = new Class1();

        string question1 = DropDownList.SelectedValue;

        string answer1 = txtanswer.Text;

        string question2 = DropDownList1.Text;

        string answer2 = txtanswer1.Text;

        string question3 = DropDownList2.Text;

        string answer3 = txtanswer2.Text;

        if (((((((CompareValidator1.IsValid == true && RequiredFieldValidator2.IsValid == true) && RequiredFieldValidator3.IsValid == true) && RequiredFieldValidator4.IsValid == true) && RequiredFieldValidator5.IsValid == true) && RequiredFieldValidator6.IsValid == true) && RequiredFieldValidator7.IsValid == true) && RequiredFieldValidator9.IsValid == true)
        {
            if (txtPwd.Text.IndexOf(" ") >= 0)
            {
                Response.Write("<script>alert('密码请不要输入空格！')</script>");
            }
            else
            {
                if (question1 == question2 || question2 == question3 || question3 == question1)
                {
                    Response.Write("<script>alert('问题不能选择一样！')</script>");
                }
                else
                {

                    using (var db = new HuXiuEntities())
                    {
                        Admin admin = new Admin();

                        Admin ad = db.Admin.SingleOrDefault(a => a.username == txtusername.Text);

                        if (ad == null)
                        {
                            admin.username = txtusername.Text;

                            admin.nickname = txtnickname.Text;

                            admin.password = register.md5(txtPwd.Text, 16);

                            admin.email = txtmailbox.Text;

                            admin.photo = "../ Images / t011f6933a23bb6faeb.png";

                            db.Admin.Add(admin);

                            db.SaveChanges();

                            Admin ad1 = db.Admin.SingleOrDefault(a => a.username == txtusername.Text);

                            int id = ad1.id;

                            Question thisquestion1 = new Question();
                            Question thisquestion2 = new Question();
                            Question thisquestion3 = new Question();

                            thisquestion1.user_id = id;
                            thisquestion1.question_id = 1;
                            thisquestion2.user_id = id;
                            thisquestion2.question_id = 2;
                            thisquestion3.user_id = id;
                            thisquestion3.question_id = 3;

                            thisquestion1.question1 = question1;
                            thisquestion2.question1 = question2;
                            thisquestion3.question1 = question3;

                            thisquestion1.answer = answer1;
                            db.Question.Add(thisquestion1);
                            thisquestion2.answer = answer2;
                            db.Question.Add(thisquestion2);
                            thisquestion3.answer = answer3;
                            db.Question.Add(thisquestion3);

                            db.SaveChanges();
                            Response.Write("<script>alert('注册成功！')</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('用户名已经存在！')</script>");
                        }

                    }
                }
            }
        }
    }
}