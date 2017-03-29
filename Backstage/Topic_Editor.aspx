<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Topic_Editor.aspx.cs" Inherits="Backstage_Topic_Editor" %>



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
            <h2>编辑专题</h2>

            <br />
            <br />
            专题标题:<asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            <asp:Label ID="lbTitle" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button runat="server" ID="btnChangeTitle" OnClick="btnChangeTitle_Click" Text="修改" />
            <br />
            <br />
            专题内容:<asp:TextBox runat="server" ID="txtContent" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Label ID="lbContent" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnChangeContent" runat="server" OnClick="btnChangeContent_Click" Text="修改" />
            <br />
            <br />
            当前封面：<asp:Image ID="imgCover" runat="server" />
            <br />
            上传专题封面:
                    <asp:FileUpload ID="fup" runat="server" />
            <br />
            <br />
            <asp:Label ID="lblInfo" runat="server" ForeColor="Red" Font-Size="13px"></asp:Label>

            <br />
            <asp:Button ID="btnChangeCover" runat="server" OnClick="btnChangeCover_Click" Text="修改" />
            <br />
            <br />
            专题包含文章
            <asp:Repeater ID="rptNews" runat="server" OnItemCommand="rptNews_ItemCommand">
                <ItemTemplate>
                    <table>
                        <tr>
                            <th>资讯标题</th>
                            <th>资讯内容</th>
                            <th>从专题中移除</th>
                         </tr>
                         <h3><%# Eval("news_title") %></h3>
                         <%# Eval("news_content") %>
                         <asp:LinkButton ID="lbt" runat="server" Text="移除" CommandName="Delete" CommandArgument='<%#Eval("news_id") %>'></asp:LinkButton>
                    </table>   
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </form>
</body>
</html>
