﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Backstage_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:LinkButton ID="lkbtnAddManager" runat="server" Text="添加管理员" OnClick="btnAddManager_Click" /><br />
        <asp:LinkButton ID="lkbBackHomepage" runat="server" Text="返回首页" OnClick="lkbBackHomepage_Click"></asp:LinkButton><br />
        
        <asp:LinkButton ID="lkbBackActivity" runat="server" Text="返回活动页" OnClick="lkbBackActivity_Click"></asp:LinkButton>
        <br />
    </div>
    </form>
</body>
</html>
