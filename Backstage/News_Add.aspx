<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News_Add.aspx.cs" Inherits="BackstageHTML_sccl_admin_page_News_Add" %>


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
    <form id="form1" runat="server">
    <div>
        
                    添加资讯
                <br />
                    <br />
                    资讯标题:<asp:TextBox ID="txtTitle" runat="server" Width="593px"></asp:TextBox>
                    <asp:Label ID="lbTitle" runat="server"></asp:Label>
                    <br />
                    <br />
                    资讯内容: <br /><textarea id="myEditor" name="myEditor" runat="server" onblur="setUeditor()" style="width: 1030px; height: 250px;"></textarea>
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
    </script>
        <div>
                    <br />
                    <asp:Label ID="lbContent" runat="server"></asp:Label>
                    <br />
                    <br />
                    作者/编辑:
                    <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    上传资讯封面:
                        <asp:FileUpload ID="fup" runat="server" />
                    <br />
                    <br />
                    <asp:Label ID="lblInfo" runat="server" ForeColor="Red" Font-Size="13px"></asp:Label>
                    <br />
                    <br />
                    <br />
                    是否设置为头条:
                    <asp:RadioButtonList
                        ID="radlTop" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        <asp:ListItem Selected="True" Value="0">不设置</asp:ListItem>
                        <asp:ListItem Value="1">设置</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    <br />
                    选择分类:
                    <asp:DropDownList ID="dropClass" runat="server"></asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button ID="btnSub" runat="server" Text="提交" OnClick="btnSub_Click" />
    </div>
    </form>
</body>
</html>

