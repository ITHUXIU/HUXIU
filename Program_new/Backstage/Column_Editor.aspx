<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Column_Editor.aspx.cs" Inherits="Backstage_Column_Editor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
   <script  src="../ueditor/ueditor.config.js" type="text/javascript"></script>
     <script  src="../ueditor/ueditor.all.min.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            专题名称
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnName" runat="server" OnClick="btnName_Click" Text="修改" />
            <br />
            专题内容<br />
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
            <asp:Button ID="btnContent" runat="server" OnClick="btnContent_Click" Text="修改" />

            <br />
            <br />

            上传专题封面
                                <asp:FileUpload ID="fup" runat="server" />
            <br />
            <br />
            <asp:Label ID="lblInfo" runat="server" ForeColor="Red" Font-Size="13px"></asp:Label>
            <br />
            <br />
            <asp:Button Text="修改" runat="server" OnClick="Unnamed_Click" />
            <div id="divHave" runat="server" visible="true">
                <asp:Repeater ID="rptHave" runat="server" OnItemCommand="rptHave_ItemCommand">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <th>资讯序号</th>
                                <th>资讯封面</th>
                                <th>资讯标题</th>
                                <th>资讯内容</th>
                                <th>从专题中移除</th>
                            </tr>

                           <th> <%# Eval("News_id") %></th>
                               <th>
                            <img src='<%# Eval("News_cover") %>' runat="server" width="60" height="60" /></th>
                          <th>  <h3><%# Eval("News_title") %></h3></th>
                         <th>   <%# Eval("News_content") %></th>
                          <th>  <asp:LinkButton ID="lbt" runat="server" Text="删除" CommandName="Delete" CommandArgument='<%#Eval("News_id") %>'></asp:LinkButton></th>
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

                    转<asp:TextBox ID="txtJump" Text="1" runat="server" Width="23px"  onkeyup="this.value=this.value.replace(/\D/g,'')"></asp:TextBox>
                &nbsp;<asp:Button ID="btnJump" runat="server" Text="Go" OnClick="btnJump_Click" />
            </div>
            <br />
            添加资讯
        搜索
        <asp:LinkButton ID="lbtID" Text="按ID搜索" runat="server" OnClick="lbtID_Click"></asp:LinkButton>
            <div id="divID" runat="server" visible="false">
                <asp:TextBox ID="txtID" runat="server" onkeyup="this.value=this.value.replace(/\D/g,'')"></asp:TextBox>
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
                            <th>资讯封面</th>
                            <th>资讯标题</th>

                            <th>资讯内容</th>
                            <th>添加到专题</th>
                        </tr>
                        <tr>
                        <th><%# Eval("News_id")%></th>
                        <th>
                            <img src='<%# Eval("News_cover") %>' runat="server" width="60" height="60" /></th>
                        <th>
                            <h3><%# Eval("News_title") %></h3>
                        </th>
                        <th><%# Eval("News_content") %></th>
                        <th>
                            <asp:LinkButton ID="lbt" runat="server" Text="添加" CommandName="Add" CommandArgument='<%#Eval("News_id") %>'></asp:LinkButton>
                        </th>
                            </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <br />
        </div>
    </form>
</body>
</html>

