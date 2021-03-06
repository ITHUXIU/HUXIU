﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activity_new.aspx.cs" Inherits="Backstage_Activity_new" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 <script  src="../ueditor/ueditor.config.js" type="text/javascript"></script>
     <script  src="../ueditor/ueditor.all.min.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
    <form id="form1" runat="server" >
            <div>
         <h2 style="align-content:center  ">标题</h2>
        <asp:TextBox ID="txtTitle" runat="server" MaxLength="50"></asp:TextBox><br />
        封面小图标：<br /><asp:TextBox ID="txtCoverLabel" runat="server" ></asp:TextBox><br />
           
        系列活动名称：<br />

        <asp:TextBox ID="txtTopicName" runat="server" ></asp:TextBox><br />
         活动类别：<br />
                       <asp:RadioButtonList ID="activityKind" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" >
                    <asp:ListItem Selected="True" >虎嗅活动</asp:ListItem>
                    <asp:ListItem >活动频道</asp:ListItem> 
                    <asp:ListItem>外部活动</asp:ListItem>
                </asp:RadioButtonList><br />
        封面照片：<br />
                      <asp:ScriptManager ID="ScriptManager2" runat="server" ></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
            <ContentTemplate>   
                 <asp:ImageButton ID="ibtnChangeiamge" runat="server" ToolTip="更换封面" Width="200" Height="200" OnClick="ibtnChangeiamge_Click" />
                <asp:Label ID="lbImage" runat="server" ></asp:Label>
                         <asp:Panel ID="panel" runat="server" Visible="true"  >
              <asp:FileUpload ID="FileUpload1" runat="server" /> 
                         <asp:Button ID="Button1" runat="server" Text="上传" OnClick="btnupload_Click"/><br />         
        </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>          
                         
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
         开始时间：
        <asp:TextBox ID="txtActivityBeginTime" runat="server" ></asp:TextBox><br />
        结束时间：
        <asp:TextBox ID="txtActivityEndTime" runat="server" ></asp:TextBox><br />
        <asp:Button ID="btnNewActivity" runat="server" Text="确定" OnClick="btnNewActivity_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    </div>
        </form>
    
</body>
</html>
