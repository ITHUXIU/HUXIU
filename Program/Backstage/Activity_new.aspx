<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activity_new.aspx.cs" Inherits="Backstage_Activity_new" %>

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
        
		<table>
			<tr>
				<th>活动名称</th>
				<th>活动开始时间</th>
				<th>活动结束时间</th>
				
				<th>修改活动</th>
				<th>删除活动</th>
			</tr>
    <asp:Repeater ID="rptActivity_end" runat="server" OnItemCommand="rptActivity_end_ItemCommand" >
        <ItemTemplate>
           <tr> 
               <td><asp:LinkButton ID="lbactivity_name" runat="server" Text='<%#Eval("activity_name") %>' CommandName="Activity_content" CommandArgument='<%#Eval("activity_id") %>'></asp:LinkButton> </td>
            <td><%#Eval("activity_start") %></td>
            <td><%#Eval("activity_end") %></td>
               <td><asp:LinkButton ID="lbmodify_activity" runat="server" Text="修改" CommandName="Modify" CommandArgument='<%#Eval("activity_id") %>'></asp:LinkButton></td>
            <td><asp:LinkButton ID="lbdelete_activity" runat="server" Text="删除" CommandName="Delete" CommandArgument='<%#Eval("activity_id") %>'></asp:LinkButton></td>
               </tr>
            <br />
        </ItemTemplate>
    </asp:Repeater>
            </table>
    </div>
    </form>
</body>
</html>
