<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Top.aspx.cs" Inherits="Backstage_Top" %>
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
				<th>头条图片</th>
                <th>缩略图</th>
                <th>编辑</th>
			</tr>
    <asp:Repeater ID="rptTop" runat="server">
        <ItemTemplate>
           <tr> 
               <td><img src='<%# Eval("top_path") %>' runat="server" width="100" height="60" /></td>
                <td><img src='<%# Eval("top_cover") %>' runat="server" width="60" height="60" /></td>
               <td><asp:LinkButton runat="server" Text="编辑" PostBackUrl='<%#"Top_Editor.aspx?top_id="+Eval("top_id") %>'></asp:LinkButton></td>
               </tr>
           
        </ItemTemplate>
    </asp:Repeater>
            </table>

    </div>
    </form>
</body>
</html>
