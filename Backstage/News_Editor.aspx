    <%@ Page Language="C#" AutoEventWireup="true" CodeFile="News_Editor.aspx.cs" Inherits="BackstageHTML_sccl_admin_page_News_Editor" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  <script type="text/javascript" src="../common/js/tablecloth.js"></script>
    <link href="../common/css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
    <style>

body{
	margin:0;
	padding:0;
	background:#f1f1f1;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
	line-height:150%;
	text-align:left;
}
a{
	text-decoration:none;
	color:#057fac;
}
a:hover{
	text-decoration:none;
	color:#999;
}
h1{
	font-size:140%;
	margin:0 20px;
	line-height:80px;	
}
h2{
	font-size:120%;
}
#container{
	margin:0 auto;
	width:680px;
	background:#fff;
	padding-bottom:20px;
}
#content{margin:0 20px;}
p.sig{	
	margin:0 auto;
	width:680px;
	padding:1em 0;
}
form{
	margin:1em 0;
	padding:.2em 20px;
	background:#eee;
}
    .auto-style1 {
        height: 27px;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
                        <h2>编辑资讯</h2>
          
                        <br />
                        <br />
                        资讯标题:<asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                        <asp:Label ID="lbTitle" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Button runat="server" ID="btnChangeTitle" OnClick="btnChangeTitle_Click" Text="修改" />
                        <br />
                        <br />
                        资讯内容:<asp:TextBox runat="server" ID="txtContent" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <asp:Label ID="lbContent" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="btnChangeContent" runat="server" OnClick="btnChangeContent_Click" Text="修改" />
                        <br />
                        <br />
                        资讯作者：
                        <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
                        <asp:Button ID="btnAuthor" runat="server" OnClick="btnAuthor_Click" />
                        <br />
                        上传资讯封面:
                    <asp:FileUpload ID="fup" runat="server" />
                        <br />
                        <br />
                        <asp:Label ID="lblInfo" runat="server" ForeColor="Red" Font-Size="13px"></asp:Label>

                        <br />
                        <asp:Button ID="btnChangeCover" runat="server" OnClick="btnChangeCover_Click" Text="修改" />
                        <br />
                        <br />

                        是否设置为头条:
                    <asp:RadioButtonList
                        ID="radlTop" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Value="0">不设置</asp:ListItem>
                        <asp:ListItem Value="1">设置</asp:ListItem>
                    </asp:RadioButtonList>
                        <br />
                        <asp:Button ID="btnChangeTop" runat="server" OnClick="btnChangeTop_Click" Text="修改" />
                        <br />
                        <br />
                        选择分类:
                    <asp:DropDownList ID="dropClass" runat="server"></asp:DropDownList>
                        <br />
                        <br />
                        <asp:Button ID="btnChangeClass" runat="server" Text="修改" OnClick="btnChangeClass_Click" />
    </div>
    </form>
</body>
</html>
