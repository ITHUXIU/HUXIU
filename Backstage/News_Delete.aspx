<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News_Delete.aspx.cs" Inherits="BackstageHTML_sccl_admin_page_News_Delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript" src="../common/js/tablecloth.js"></script>
    <link href="../common/css/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #f1f1f1;
            font: 70% Arial, Helvetica, sans-serif;
            color: #555;
            line-height: 150%;
            text-align: left;
        }

        a {
            text-decoration: none;
            color: #057fac;
        }

            a:hover {
                text-decoration: none;
                color: #999;
            }

        h1 {
            font-size: 140%;
            margin: 0 20px;
            line-height: 80px;
        }

        h2 {
            font-size: 120%;
        }

        #container {
            margin: 0 auto;
            width: 680px;
            background: #fff;
            padding-bottom: 20px;
        }

        #content {
            margin: 0 20px;
        }

        p.sig {
            margin: 0 auto;
            width: 680px;
            padding: 1em 0;
        }

        form {
            margin: 1em 0;
            padding: .2em 20px;
            background: #eee;
        }

        .auto-style1 {
            height: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="rptNews" runat="server" OnItemCommand="rptNews_ItemCommand">
                <ItemTemplate>
                    <table>
                        <tr>
                            <th>资讯标题</th>
                            <th>资讯内容</th>
                            <th>删除资讯</th>
                            <th>修改资讯</th>
                        </tr>


                        <img src='<%# Eval("News_cover") %>' runat="server" width="60" height="60" />
                        <h3><%# Eval("News_title") %></h3>
                        <asp:Label ID="lbText" runat="server"></asp:Label>
                        <asp:LinkButton ID="lbt" runat="server" Text="删除" CommandName="Delete" CommandArgument='<%#Eval("News_id") %>'></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text="编辑" CommandName="Editor" PostBackUrl='<%#"News_Editor.aspx?news_id="+Eval("News_id") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
            <br />
            <asp:Button ID="btnUp" runat="server" Text="上一页" OnClick="btnUp_Click" />
            &nbsp;<asp:Button ID="btnDrow" runat="server" Text="下一页" OnClick="btnDrow_Click" />
            &nbsp;<asp:Button ID="btnFirst" runat="server" Text="首页" OnClick="btnFirst_Click" />
            &nbsp;<asp:Button ID="btnLast" runat="server" Text="尾页" OnClick="btnLast_Click" />
            &nbsp;页次：<asp:Label ID="lbNow" runat="server" Text="1"></asp:Label>
            /<asp:Label ID="lbTotal" runat="server" Text="1"></asp:Label>

            &nbsp;

                    转<asp:TextBox ID="txtJump" Text="1" runat="server" Width="23px"></asp:TextBox>
            &nbsp;<asp:Button ID="btnJump" runat="server" Text="Go" OnClick="btnJump_Click" />

            </div>
        
    </form>
</body>
</html>

