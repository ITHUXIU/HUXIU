<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modify_rumor.aspx.cs" Inherits="Backstage_Modify_rumor" %>

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
        传言标题：<br />
        <asp:TextBox ID="txtRumorTitle" runat="server" ></asp:TextBox><br />
        
      <div>传言内容：<br />
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
        传言状态：<br />
        <asp:TextBox ID="txtRumorState" runat="server" ></asp:TextBox><br />
         传言时间：<br />
        <asp:TextBox ID="txtRumorTime" runat="server" ></asp:TextBox><br />
         传言热度：<br />
        <asp:TextBox ID="txtRumorHot" runat="server" ></asp:TextBox><br />
         传言点赞数：<br />
        <asp:TextBox ID="txtRumorLike" runat="server" ></asp:TextBox><br />
       <asp:Button ID="btnRumor" runat="server" Text="确定" OnClick="btnRumor_Click" />
        &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnBack1" runat="server" Text="返回" PostBackUrl="~/Backstage/Rumor.aspx" />
    </div>
    </form>
</body>
</html>
