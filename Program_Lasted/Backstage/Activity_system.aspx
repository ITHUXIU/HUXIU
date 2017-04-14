<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activity_system.aspx.cs" Inherits="Backstage_Activity_system" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script  src="../ueditor/ueditor.config.js" type="text/javascript"></script>
     <script  src="../ueditor/ueditor.all.min.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
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
       <asp:panel ID="panelTopicActivity" runat="server" Visible="true">
		<table>
			<tr>
				<th>系列活动名称</th>
				<th>系列活动简述</th>
				
				<th>修改该系列活动</th>
				<th>删除该系列活动</th>
			</tr>
    <asp:Repeater ID="rptActivity_topic" runat="server" OnItemCommand="rptActivity_topic_ItemCommand" OnItemDataBound="rptActivity_topic_ItemDataBound">
        <ItemTemplate>
           <tr> 
               <td><asp:LinkButton ID="lbactivity_name" runat="server" Text='<%#Eval("topic_name") %>' PostBackUrl='<%#"Topic_activity.aspx?id="+Eval("topic_id") %>'></asp:LinkButton> </td>
            <td><asp:Label ID="lbTopicActicity" runat="server" Text='<%#Eval("topic_content") %>'></asp:Label></td>
               <td><asp:LinkButton ID="lbmodify_activity" runat="server" Text="修改" PostBackUrl='<%#"Modify_topic.aspx?id="+Eval("topic_id") %>'></asp:LinkButton></td>
            <td><asp:LinkButton ID="lbdelete_activity" runat="server" Text="删除" CommandName="Delete" CommandArgument='<%#Eval("topic_id") %>'></asp:LinkButton></td>
               </tr>
        </ItemTemplate>
       
    </asp:Repeater>
            </table>
         
            <asp:Button ID="btnUp2" runat="server" Text="上一页" OnClick="btnUp2_Click" />
        <asp:Button ID="btnDown2" runat="server" Text="下一页"  OnClick="btnDown2_Click"/>
        <asp:Button ID="btnFirst2" runat="server" Text="首页" OnClick="btnFirst2_Click"/>
        <asp:Button ID="btnLast2" runat="server" Text="尾页"  OnClick="btnLast2_Click"/>
        页次：<asp:Label ID="lbNow2" runat="server" Text="1"></asp:Label>
        /<asp:Label ID="lbTotal2" runat="server" Text="1"></asp:Label>
        转<asp:TextBox ID="txtJump2" Text="1" runat="server" Width="16px" onkeyup="this.value=this.value.replace(/\D/g,'')"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat ="server" ControlToValidate ="txtJump" ></asp:RequiredFieldValidator> 
        <asp:Button ID="btnJump2" runat="server" Text="Go"  OnClick="btnJump2_Click"/>
           <asp:Button ID="btnNewTopic" runat="server" Text="新建系列" OnClick="btnNewTopic_Click" />
         <asp:Button ID="btnback2" runat="server" Text="未编入系列活动管理" OnClick="btnback2_Click" />
           </asp:panel> 
        <asp:Panel ID="panelTopicActivityAdd" runat="server" Visible="false">
            <table>
			<tr>
				<th>活动名称</th>
				<th>活动开始时间</th>
				<th>活动结束时间</th>
				
				<th>修改活动</th>
				<th>删除活动</th>
			</tr>
    <asp:Repeater ID="rptActivity_notopic" runat="server" OnItemCommand="rptActivity_notopic_ItemCommand" >
        <ItemTemplate>
           <tr> 
               <td><asp:LinkButton ID="lbactivity_name" runat="server" Text='<%#Eval("activity_name") %>' PostBackUrl='<%#"Modify_activity.aspx?id="+Eval("activity_id") %>'></asp:LinkButton> </td>
            <td><%#Eval("activity_start").ToString().Substring(0,10) %></td>
            <td><%#Eval("activity_end").ToString().Substring(0,10) %></td>                                            
               <td><asp:LinkButton ID="lbmodify_activity" runat="server" Text="修改" PostBackUrl='<%#"Modify_activity.aspx?id="+Eval("activity_id") %>'></asp:LinkButton></td>
            <td><asp:LinkButton ID="lbdelete_activity" runat="server" Text="删除" CommandName="Delete" CommandArgument='<%#Eval("activity_id") %>'></asp:LinkButton></td>
               </tr>
           
        </ItemTemplate>
    </asp:Repeater>
            </table>
        <asp:Button ID="btnUp" runat="server" Text="上一页" OnClick="btnUp_Click" />
        <asp:Button ID="btnDown" runat="server" Text="下一页"  OnClick="btnDown_Click"/>
        <asp:Button ID="btnFirst" runat="server" Text="首页" OnClick="btnFirst_Click" />
        <asp:Button ID="btnLast" runat="server" Text="尾页"  OnClick="btnLast_Click"/>
        页次：<asp:Label ID="lbNow" runat="server" Text="1"></asp:Label>
        /<asp:Label ID="lbTotal" runat="server" Text="1"></asp:Label>
        转<asp:TextBox ID="txtJump" Text="1" runat="server" Width="16px" onkeyup="this.value=this.value.replace(/\D/g,'')"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat ="server" ControlToValidate ="txtJump" ></asp:RequiredFieldValidator> 
        <asp:Button ID="btnJump" runat="server" Text="Go"  OnClick="btnJump_Click"/>
         <asp:Button ID="btnback" runat="server" Text="系列管理" OnClick="btnback_Click" />
        </asp:Panel>
        <asp:Panel ID="pnNewTopic" runat="server" Visible="false">
            系列名称<br />
            <asp:TextBox ID="txtNewTopicName" runat="server" ></asp:TextBox><br />
            系列图标<br />
           <asp:ImageButton ID="imgbtnTopic" runat="server" ToolTip="点击更换" OnClick="imgbtnTopic_Click" />
              <asp:Panel ID="panel" runat="server" Visible="true"  >
              <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="上传" OnClick="btnupload_Click" /><br />
        </asp:Panel>
            系列简介<br />
                   <textarea id="myEditor" name="myEditor" runat="server" onblur="setUeditor()" style="width: 1030px; height: 250px;"></textarea>
            <%-- 上面这个style这里是实例化的时候给实例化的这个容器设置宽和高，不设置的话，或默认为auto可能会造成部分显示的情况--%>
            
            <script type="text/javascript">
                var editor = new baidu.editor.ui.Editor();
                
                editor.render("<%=myEditor.ClientID%>");
            </script>
      
<script type="text/javascript">
        function setUeditor() {
            var myEditor = document.getElementById("myEditor");
            myEditor.value = editor.getContent();//把得到的值给textarea
        }
    </script>
            <br />
            <asp:Button ID="btnNewTopicSet" runat="server" Text="确定" OnClick="btnNewTopicSet_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnBack1" runat="server" Text="返回" OnClick="btnBack_Click" />
            </asp:Panel>
    </div>
    </form>
</body>
</html>
