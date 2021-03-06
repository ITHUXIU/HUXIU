﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Top_Editor.aspx.cs" Inherits="Backstage_Top_Editor" %>

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
        <div id="divEditor" runat="server">
            <h1>头条封面</h1>
            <br />
            <asp:Image ID="imgTop" runat="server" Height="150" Width="250" />
            <br />
            <h1>头条新闻缩略图</h1>
            <asp:Image ID="imgCover" runat="server" Height="100" Width="100" />
            <h1>头条新闻</h1>
            <br />
            <h2><asp:Label ID="lbTitle" runat="server"></asp:Label></h2>
            <br />
            <asp:Label ID="lbContent" runat="server"></asp:Label>
            <asp:LinkButton ID="lbtDetail" runat="server" Text="展开全文" OnClick="lbtDetail_Click"></asp:LinkButton>
            <asp:LinkButton ID="lbtBrief" runat="server" Text="收起" OnClick="lbtBrief_Click" Visible="false"></asp:LinkButton>
            <br />
            <h1>更换头条封面</h1>
            上传资讯封面:
            <asp:FileUpload ID="fup" runat="server" />
            <br />
            <br />
            <asp:Label ID="lblInfo" runat="server" ForeColor="Red" Font-Size="13px"></asp:Label>
            <br />
            <asp:Button ID="btnSub" runat="server" OnClick="btnSub_Click" Text="上传" />
            <br />
            <h1>更换资讯缩略图</h1>
            上传资讯缩略图:
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Font-Size="13px"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="上传" />
            <br />
            <h1>更换新闻</h1>
            <br />
            <asp:Repeater ID="rptNews" runat="server" OnItemCommand="rptNews_ItemCommand" OnItemDataBound="rptNews_ItemDataBound">
                <HeaderTemplate>
                    <table>

                        <tr>
                            <th>资讯序号</th>
                            <th>资讯封面</th>
                            <th>资讯标题</th>
                            <th>资讯内容</th>
                            <th>设置为头条新闻</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <br />
                    <tr>
                    <th><%# Eval("News_id") %></th>
                    <th><img src='<%# Eval("News_cover") %>' runat="server" width="60" height="60" /></th>
                    <th><h3><%# Eval("News_title") %></h3></th>
                    <th><asp:Label ID="lb" runat="server" Text='<%# Eval("News_content") %>' Width="60%" ></asp:Label></th>
                    <th><asp:LinkButton ID="lbt" runat="server" Text="设置" CommandName="Set" CommandArgument='<%#Eval("News_id") %>'></asp:LinkButton></th>
                 <th>

               </th>

                    </tr>  

                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>

            </asp:Repeater>
            <br />
            <asp:Button ID="btnUp" runat="server" Text="上一页" OnClick="btnUp_Click" />
            &nbsp;<asp:Button ID="btnDrow" runat="server" Text="下一页" OnClick="btnDrow_Click" />
            &nbsp;<asp:Button ID="btnFirst" runat="server" Text="首页" OnClick="btnFirst_Click" />
            &nbsp;<asp:Button ID="btnLast" runat="server" Text="尾页" OnClick="btnLast_Click" />
            &nbsp;页次：<asp:Label ID="lbNow" runat="server" Text="1"></asp:Label>
            /<asp:Label ID="lbTotal" runat="server" Text="1"></asp:Label>

            &nbsp;

                    转<asp:TextBox ID="txtJump" Text="1" runat="server" Width="23px" onkeyup="this.value=this.value.replace(/\D/g,'')"></asp:TextBox>
            &nbsp;<asp:Button ID="btnJump" runat="server" Text="Go" OnClick="btnJump_Click" />

        </div>


    </div>
    </form>
</body>
</html>
