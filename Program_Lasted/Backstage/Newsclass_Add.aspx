<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Newsclass_Add.aspx.cs" Inherits="Backstage_Newsclass_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 
</head>
<body>
    <form id="form1" runat="server">
    <div>
        添加分类
        <asp:TextBox ID="txtClass" runat="server" MaxLength="12"></asp:TextBox>
        <asp:Button ID="btnSub" runat="server" Text="提交" OnClick="btnSub_Click" />
    </div>
    </form>
</body>
</html>
