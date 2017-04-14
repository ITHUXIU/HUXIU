﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modify_activity.aspx.cs" Inherits="Backstage_Modify_activity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
     <script  src="../ueditor/ueditor.config.js" type="text/javascript"></script>
     <script  src="../ueditor/ueditor.all.min.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
        </div>
        <h2 style="align-content:center  ">标题</h2>
        <asp:TextBox ID="txtTitle" runat="server" MaxLength="50"></asp:TextBox><br />
        封面小标签内容：
        <asp:TextBox ID="txtCoverLabel" runat="server" ></asp:TextBox><br />
        系列活动名称：
        <asp:TextBox ID="txtTopicName" runat="server" ></asp:TextBox><br />
         活动类别：<br />
                       <asp:RadioButtonList ID="activityKind" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" >
                    <asp:ListItem Selected="True" >虎嗅活动</asp:ListItem>
                    <asp:ListItem >活动频道</asp:ListItem> 
                    <asp:ListItem>外部活动</asp:ListItem>
                </asp:RadioButtonList><br />
         封面照片：<asp:ImageButton ID="ibtnChangeiamge" runat="server" ToolTip="更换封面" Width="200" Height="200" OnClick="ibtnChangeiamge_Click" />
        <asp:Panel ID="panel" runat="server" Visible="false"  >
              <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="上传" OnClick="btnupload_Click" /><br />
        </asp:Panel>
         <div>内容：<br />
           <%-- <script id="myEditor" type="text/plain"></script>--%>
            <textarea id="myEditor" name="myEditor" runat="server" onblur="setUeditor()" style="width: 1030px; height: 250px;"></textarea>
            <%-- 上面这个style这里是实例化的时候给实例化的这个容器设置宽和高，不设置的话，或默认为auto可能会造成部分显示的情况--%>
            
            <script type="text/javascript">
                var editor = new baidu.editor.ui.Editor();
                
                editor.render("<%=myEditor.ClientID%>");
            </script>
        </div>
<script type="text/javascript">
        function setUeditor() {
            var myEditor = document.getElementById("myEditor");
            myEditor.value = editor.getContent();//把得到的值给textarea
        }
    </script><br />
   <asp:TextBox ID="txtActivityBeginTime" TextMode="DateTime" runat="server" onblur="check()" ></asp:TextBox><br />
                 <script>
                  function check() {                 
                      var temp = document.getElementById("txtActivityBeginTime").value;
                  
                      var myreg = /(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/;
                      if (!myreg.test(temp)) {
                          alert('提示\n\n请输入有效时间');
                          myreg.focus();

                      }
                 
                  }
              </script>
        结束时间：
        <asp:TextBox ID="txtActivityEndTime" TextMode="DateTime" runat="server" onblur="checkEnd()"></asp:TextBox><br />
                <script>
                  function checkEnd() {                 
                      var temp = document.getElementById("txtActivityEndTime").value;
                  
                      var myreg = /(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/;
                      if (!myreg.test(temp)) {
                          alert('提示\n\n请输入有效时间');
                          myreg.focus();

                      }
                 
                  }
              </script>
        <asp:Button ID="btnActivity" runat="server" Text="确定" OnClick="btnActivity_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <%-- <asp:Button ID="btnActivity_return" runat="server" Text="返回" OnClick="btnActivity_return_Click" />--%>
    </div>
    </form>
</body>
</html>
