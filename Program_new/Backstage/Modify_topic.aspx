<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modify_topic.aspx.cs" Inherits="Backstage_Modify_topic" %>

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
        系列活动名字：<br />
        <asp:TextBox ID="txtTopicName" runat="server" ></asp:TextBox><br />
        系列活动内容简述：<br />
        <asp:TextBox ID="txtTopicContent" runat="server" ></asp:TextBox><br />
        系列活动图标：<br />
        <asp:ImageButton ID="ibtnTopicImage" runat="server" ToolTip="点击更换图标" Width="200" Height="200" OnClick="ibtnTopicImage_Click" />
        <br />
         <asp:Panel ID="panel" runat="server" Visible="false" >
              <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="上传" OnClick="btnupload_Click" /><br />
        </asp:Panel>
        <table>
			<tr>
				<th>活动名称</th>
				<th>活动简述</th>
				
				<th>修改</th>
				<th>删除活动</th>
			</tr>
    <asp:Repeater ID="rptActivity_topic" runat="server" OnItemCommand="rptActivity_topic_ItemCommand" >
        <ItemTemplate>
           <tr> 
               <td><asp:LinkButton ID="lbactivity_name" runat="server" Text='<%#Eval("activity_name") %>' PostBackUrl='<%#"Modify_activity.aspx?id="+Eval("activity_id") %>'></asp:LinkButton> </td>
            <td><asp:Label ID="lbTopicActicity" runat="server" Text='<%#Eval("activity_content").ToString().Substring(0,30)+"..." %>'></asp:Label></td>
               <td><asp:LinkButton ID="lbmodify_activity" runat="server" Text="修改" PostBackUrl='<%#"Modify_activity.aspx?id="+Eval("activity_id") %>'></asp:LinkButton></td>
            <td><asp:LinkButton ID="lbdelete_activity" runat="server" Text="删除" CommandName="Delete" CommandArgument='<%#Eval("activity_id") %>'></asp:LinkButton></td>
               </tr>
        </ItemTemplate>
       
    </asp:Repeater>
            </table>
         
            <asp:Button ID="btnUp" runat="server" Text="上一页" OnClick="btnUp_Click" />
        <asp:Button ID="btnDown" runat="server" Text="下一页"  OnClick="btnDown_Click"/>
        <asp:Button ID="btnFirst" runat="server" Text="首页" OnClick="btnFirst_Click"/>
        <asp:Button ID="btnLast" runat="server" Text="尾页"  OnClick="btnLast_Click"/>
        页次：<asp:Label ID="lbNow" runat="server" Text="1"></asp:Label>
        /<asp:Label ID="lbTotal" runat="server" Text="1"></asp:Label>
        转<asp:TextBox ID="txtJump" Text="1" runat="server" Width="16px" onkeyup="this.value=this.value.replace(/\D/g,'')"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat ="server" ControlToValidate ="txtJump" ></asp:RequiredFieldValidator> 
        <asp:Button ID="btnJump" runat="server" Text="Go"  OnClick="btnJump_Click"/>
        <asp:Button ID="btnModifyTopic" runat="server" Text="返回" PostBackUrl="~/Backstage/Activity_system.aspx" />
        
    </div>
    </form>
</body>
</html>
