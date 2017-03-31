<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Column_Editor.aspx.cs" Inherits="Backstage_Column_Editor" %>

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
            专题名称
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnName" runat="server" OnClick="btnName_Click" Text="修改" />
            <br />
            专题内容
        <asp:TextBox ID="txtContent" runat="server"></asp:TextBox>
            <asp:Button ID="btnContent" runat="server" OnClick="btnContent_Click"  Text="修改"/>

            上传专题封面
                                <asp:FileUpload ID="fup" runat="server" />
            <br />
            <br />
            <asp:Label ID="lblInfo" runat="server" ForeColor="Red" Font-Size="13px"></asp:Label>
            <br />
            <br />
            <asp:Button Text="修改" runat="server" OnClick="Unnamed_Click"  />
            <div id="divHave" runat="server" visible="true">
            <asp:Repeater ID="rptHave" runat="server" OnItemCommand="rptHave_ItemCommand">
                <ItemTemplate>
                    <table>
                        <tr>
                            <th>资讯序号</th>
                            <th>资讯标题</th>
                            <th>资讯内容</th>
                            <th>从专题中移除</th>
                        </tr>
                        <%# Eval("News_id") %>
                        <h3><%# Eval("News_title") %></h3>
                        <%# Eval("News_content") %>
                        <asp:LinkButton ID="lbt" runat="server" Text="删除" CommandName="Delete" CommandArgument='<%#Eval("News_id") %>'></asp:LinkButton>
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
            <br />
            添加资讯
        搜索
        <asp:LinkButton ID="lbtID" Text="按ID搜索" runat="server" OnClick="lbtID_Click"></asp:LinkButton>
            <div id="divID" runat="server" visible="false">
                <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                <asp:Button OnClick="Unnamed_Click1" runat="server" Text="查找" />
            </div>
            <asp:LinkButton ID="lbtNames" Text="按名称查找" runat="server" OnClick="lbtNames_Click"></asp:LinkButton>
            <div id="divNames" runat="server" visible="false">
                <asp:TextBox ID="txtNames" runat="server"></asp:TextBox>
                <asp:Button ID="btnFind" runat="server" OnClick="btnFind_Click" Text="查找" />
            </div>

                <asp:Repeater ID="rptNews" runat="server" Visible="false" OnItemCommand="rptNews_ItemCommand">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <th>资讯序号</th>
                                <th>资讯标题</th>
                                <th>资讯内容</th>
                                <th>添加到专题</th>
                            </tr>
                            <%# Eval("News_id")%>
                            <h3><%# Eval("News_title") %></h3>
                            <%# Eval("News_content") %>
                            <asp:LinkButton ID="lbt" runat="server" Text="添加" CommandName="Add" CommandArgument='<%#Eval("News_id") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
                <br />
        </div>
    </form>
</body>
</html>

