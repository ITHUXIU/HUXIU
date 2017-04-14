<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_manager.aspx.cs" Inherits="Backstage_Add_manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
    <table>
        <tr>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 注册页面</td>
        </tr>
        <tr>
            <td>
    
    <table>
         <tr>
            <td>
                用户名：</td>
            <td>
                <asp:TextBox ID="txtusername" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat ="server" ErrorMessage ="用户名不能为空！" ControlToValidate ="txtusername" ForeColor ="Red"></asp:RequiredFieldValidator> <br />
            </td>
        </tr>

        <tr>
            <td>
                昵称*：</td>
            <td>
                <asp:TextBox ID="txtnickname" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat ="server" ErrorMessage ="昵称不能为空！" ControlToValidate ="txtnickname" ForeColor ="Red"></asp:RequiredFieldValidator> <br />
            </td>
        </tr>
    <tr>
        <td>
            密码*：</td>
        <td>      
            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"  onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"></asp:TextBox>       
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat ="server" ErrorMessage ="密码不能为空！" ControlToValidate ="txtPwd" ForeColor ="Red"></asp:RequiredFieldValidator> <br />                    
        </td>
        </tr>
         <tr>
        <td>
           密码确认*：</td>
        <td>
            <asp:TextBox ID="txtPasswordConfirm" runat ="server" TextMode="Password"  onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"></asp:TextBox>  
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat ="server" ErrorMessage ="密码确认不能为空！" ControlToValidate ="txtPasswordConfirm" ForeColor ="Red"></asp:RequiredFieldValidator> <br />  
             <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage ="前后密码不一致！" ControlToCompare="txtPwd" ControlToValidate="txtPasswordConfirm" ForeColor ="Red"></asp:CompareValidator> <br />                          
        </td>
        </tr>
         <tr>
            <td>
                 邮箱*：</td>
          <td>
              <asp:TextBox ID ="txtmailbox" TextMode="Email" runat ="server" onblur="check()"  ></asp:TextBox>
              <script>
                  function check() {                 
                  var temp = document.getElementById("txtmailbox").value;
                  
                      var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                      if (!myreg.test(temp)) {
                          alert('提示\n\n请输入有效的E_mail！');
                          myreg.focus();

                      }
                 
                  }
              </script>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat ="server" ErrorMessage ="邮箱不能为空！一些操作会发邮件确认！" ControlToValidate ="txtmailbox" ForeColor ="Red"></asp:RequiredFieldValidator> <br />  
          </td>
        </tr>
        <tr>
            <td>
                密保问题1*：
            </td>
            <td>               
            <asp:DropDownList ID="DropDownList" runat="server" Width="147px">
            <asp:ListItem> 你父亲的名字</asp:ListItem>
            <asp:ListItem Selected="True">你的学号</asp:ListItem>
            <asp:ListItem>你母亲的名字</asp:ListItem>
            <asp:ListItem>你的故乡</asp:ListItem>
            <asp:ListItem>你就读的高中</asp:ListItem>  
            <asp:ListItem>你的梦想</asp:ListItem>     
        </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>答案*：</td>
            <td><asp:TextBox ID="txtanswer" runat="server" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat ="server" ErrorMessage ="答案不能为空！" ControlToValidate ="txtanswer" ForeColor ="Red"></asp:RequiredFieldValidator> <br />  
            </td>
        </tr>
        <tr>
            <td>
                密保问题2*：
            </td>
            <td>
                 <asp:DropDownList ID="DropDownList1" runat="server" Width="147px">
            <asp:ListItem> 你父亲的名字</asp:ListItem>
            <asp:ListItem Selected="True">你的学号</asp:ListItem>
            <asp:ListItem>你母亲的名字</asp:ListItem>
            <asp:ListItem>你的故乡</asp:ListItem>
            <asp:ListItem>你就读的高中</asp:ListItem>  
            <asp:ListItem>你的梦想</asp:ListItem>     
        </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>答案*：</td>
            <td><asp:TextBox ID="txtanswer1" runat="server" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat ="server" ErrorMessage ="答案不能为空！" ControlToValidate ="txtanswer1" ForeColor ="Red"></asp:RequiredFieldValidator> <br />  
            </td>
        </tr>
        <tr>
            <td>
                密保问题3*：
            </td>
            <td>
                 <asp:DropDownList ID="DropDownList2" runat="server" Width="147px">
            <asp:ListItem> 你父亲的名字</asp:ListItem>
            <asp:ListItem Selected="True">你的学号</asp:ListItem>
            <asp:ListItem>你母亲的名字</asp:ListItem>
            <asp:ListItem>你的故乡</asp:ListItem>
            <asp:ListItem>你就读的高中</asp:ListItem>  
            <asp:ListItem>你的梦想</asp:ListItem>     
        </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>答案*：</td>
            <td><asp:TextBox ID="txtanswer2" runat="server" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat ="server" ErrorMessage ="答案不能为空！" ControlToValidate ="txtanswer2" ForeColor ="Red"></asp:RequiredFieldValidator> <br />  
            </td>
        </tr>
             


    <tr>
        <td>
            </td>
        <td>
            <asp:Button ID="BtnRegister" runat="server"  OnClick="BtnRegister_Click" Text="注册" />
        </td>
        <td>
           <asp:Button ID="btnReturn" runat="server" Text="返回"  PostBackUrl="~/Backstage/Home.aspx"/>
        </td>
      
        <td>
            </td>
    </tr>
    </table>
                </td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
