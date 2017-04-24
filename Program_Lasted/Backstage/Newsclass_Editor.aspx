<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Newsclass_Editor.aspx.cs" Inherits="Backstage_Newsclass_Editor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  
</head>
<body>
    <form id="form1" runat="server">
    <div>
            <asp:TextBox ID="txtName" runat="server" MaxLength="12"></asp:TextBox>
            <br />
            <asp:Button ID="btnSub" runat="server" Text="修改" OnClick="btnSub_Click" />
    </div>
    </form>
</body>
</html>
