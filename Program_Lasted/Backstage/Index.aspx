<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Backstage_Index" EnableEventValidation="false" %>

<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<meta name="keywords" content="scclui框架">
	<meta name="description" content="scclui为轻量级的网站后台管理系统模版。">
    <title>首页</title>
	
	<link rel="stylesheet" href="../common/css/sccl.css">
	<link rel="stylesheet" type="text/css" href="../common/skin/qingxin/skin.css" id="layout-skin"/>
    
  </head>
  
  <body>
      <form id="form1" runat="server" >
	<div class="layout-admin">
		<header class="layout-header">
			<span class="header-logo">虎嗅网后台管理</span> 
			<a class="header-menu-btn" href="javascript:;"><i class="icon-font">&#xe600;</i></a>
			<ul class="header-bar">
                <li class="header-bar-role"><asp:LinkButton ID="lkbtnNickname" runat="server" OnClick="lkbtnSuperManager_Click"></asp:LinkButton></li>
                <li class="header-bar-role"><asp:Image ID="imgPhoto" runat="server" Height="30" Width="30" ImageUrl="../Images/t011f6933a23bb6faeb.png"/> </li>
				<li class="header-bar-role">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>   
                 <asp:LinkButton ID="lkbtnSuperManager" runat="server" Text="超级管理员" OnClick="lkbtnSuperManager_Click"></asp:LinkButton>
                  <asp:LinkButton Text="虎嗅首页" runat="server" OnClick="Unnamed_Click"></asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>
                   </li>
				<li class="header-bar-nav">
					<a href="javascript:;">admin<i class="icon-font" style="margin-left:5px;">&#xe60c;</i></a>
					<ul class="header-dropdown-menu">
						<li><a href="javascript:;">个人信息</a></li>
						<li><asp:LinkButton ID="lkbtnChangeManager" runat="server" Text="切换账户" PostBackUrl="~/Login/Login.aspx"></asp:LinkButton></li>
						<li><asp:LinkButton ID="lkbtnExit" runat="server" Text="退出" OnClick="lkbtnExit_Click"></asp:LinkButton></li>
					</ul>
				</li>
				<li class="header-bar-nav"> 
					<a href="javascript:;" title="换肤"><i class="icon-font">&#xe608;</i></a>
					<ul class="header-dropdown-menu right dropdown-skin">
						<li><a href="javascript:;" data-val="qingxin" title="清新">清新</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="molv" title="墨绿">墨绿</a></li>
						
					</ul>
				</li>
			</ul>
		</header>
		<aside class="layout-side">
			<ul class="side-menu">
			  
			</ul>
		</aside>
		
		<div class="layout-side-arrow"><div class="layout-side-arrow-icon"><i class="icon-font">&#xe60d;</i></div></div>
		
		<section class="layout-main">
			<div class="layout-main-tab">
				<button class="tab-btn btn-left"><i class="icon-font">&#xe60e;</i></button>
                <nav class="tab-nav">
                    <div class="tab-nav-content">
                        <a href="javascript:;" class="content-tab active" data-id="home.html">首页</a>
                    </div>
                </nav>
                <button class="tab-btn btn-right"><i class="icon-font">&#xe60f;</i></button>
			</div>
			<div class="layout-main-body">
				<%--<iframe class="body-iframe" name="iframe0" width="100%" height="99%" src="home.html" frameborder="0" data-id="home.html" seamless></iframe>--%>
                <iframe class="body-iframe" name="iframe0" width="100%" height="99%" src="Home.aspx" frameborder="0" data-id="Home.aspx" seamless></iframe>
			</div>
		</section>
		<div class="layout-footer">@2016 0.1 www.mycodes.net</div>
	</div>
	<script type="text/javascript" src="../common/lib/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="../common/js/sccl.js"></script>
	<script type="text/javascript" src="../common/js/sccl-util.js"></script>
      </form>
  </body>
</html>
