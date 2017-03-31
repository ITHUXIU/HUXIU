<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modify_topic.aspx.cs" Inherits="Backstage_Modify_topic" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        系列活动名字：<br />
        <asp:TextBox ID="txtTopicName" runat="server" ></asp:TextBox><br />
        系列活动内容简述：<br />
        <asp:TextBox ID="txtTopicContent" runat="server" ></asp:TextBox><br />
        系列活动图标：<br />
        <asp:ImageButton ID="ibtnTopicImage" runat="server" ToolTip="点击更换图标" OnClick="ibtnTopicImage_Click" />
        <br />
         <asp:Panel ID="panel" runat="server" Visible="false" >
              <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="上传" OnClick="btnupload_Click" /><br />
        </asp:Panel>
        <asp:Button ID="btnModifyTopic" runat="server" Text="返回" PostBackUrl="~/Backstage/Activity_system.aspx" />
        
    </div>
    </form>
</body>
</html>
