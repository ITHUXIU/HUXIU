<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Interest_new.aspx.cs" Inherits="Backstage_Interest_new" %>

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
    短趣标题<br />
        <asp:TextBox ID="txtInterstTitle" runat="server" ></asp:TextBox><br />
         <div>短趣内容：<br />
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
    </div>
        短趣URL<br />
        <asp:TextBox ID="txtUrl" runat="server" onblur="check()"></asp:TextBox><br />
         <script>
             function check() {


                

                      var temp = document.getElementById("txtUrl").value;
                      var aaa = document.getElementById("txtUrl");
                      // var match = /^((ht|f)tps?):\/\/[\w\-]+(\.[\w\-]+)+([\w\-\.,@?^=%&:\/~\+#]*[\w\-\@?^=%&\/~\+#])?$/;
                     var myre = /(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/;
//                      var strRegex = '^((https|http|ftp|rtsp|mms)?://)'
//+ '?(([0-9a-z_!~*\'().&=+$%-]+: )?[0-9a-z_!~*\'().&=+$%-]+@)?' //ftp的user@ 
//+ '(([0-9]{1,3}.){3}[0-9]{1,3}' // IP形式的URL- 199.194.52.184 
//+ '|' // 允许IP和DOMAIN（域名） 
//+ '([0-9a-z_!~*\'()-]+.)*' // 域名- www. 
//+ '([0-9a-z][0-9a-z-]{0,61})?[0-9a-z].' // 二级域名 
//+ '[a-z]{2,6})' // first level domain- .com or .museum 
//+ '(:[0-9]{1,4})?' // 端口- :80 
//+ '((/?)|' // a slash isn't required if there is no file name 
//+ '(/[0-9a-z_!~*\'().;?:@&=+$,%#-]+)+/?)$';
//                      var re = new RegExp(strRegex);
                      //re.test() 
                      if (!myre.test(temp)) {
                          alert("提示\n\n请输入有效URL");
                          aaa.value = "";
                           myre.focus();
                      } 

                      //if (!match.test(temp)) {
                      //    alert('提示\n\n请输入有效URL');
                      //    myreg.focus();

                      //}
                 
                  }
              </script>
        <asp:Button ID="btnInterestNew" runat="server" Text="确定" OnClick="btnInterestNew_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnBack" runat="server" Text="返回" PostBackUrl="~/Backstage/Interesting.aspx" />
    </form>
</body>
</html>
