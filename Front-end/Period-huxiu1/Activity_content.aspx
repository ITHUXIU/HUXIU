﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activity_content.aspx.cs" Inherits="Front_end_Period_huxiu1_Activity_content" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" media="all" href="css/style.css">
	<link rel="stylesheet" href="css/activityContent.css">
	<script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
	<!--[if lte IE 8]>
	<link rel="stylesheet" href="css/ie8.css"><![endif]-->
</head>
<body>
    <form id="form2" runat="server" >
<div class="container">
<div class="header">
		<div class="center">
			<ul class="clearfix">
				<li><a class="header-left-float" href=""></a></li>
				<li class="people" style="height:0px;"><a href="#loginmodal" class="flatbtn  header-right-float-people" id="modaltrigger"></a></li>
				<li><a href="#searchLo" class="flat header-right-float-search" id="modal"></a></li>
							<div id="loginmodal" style="display:none;">
								    <div class="mainLeft">
								      <div class="mainLeftImg">
								            <img src="./images/blackHu.png" alt="">
								      </div>
								         <form id="loginform" name="loginform" method="post" action="index.html">
								        <asp:TextBox ID="txtusername" runat="server" CssClass="txtfield" TabIndex="1" Text="邮箱/虎嗅账号" onfocus="if(this.value=='邮箱/虎嗅账号'){this.value='';}"></asp:TextBox>
                      <asp:TextBox ID="txtpassword" runat="server" CssClass="txtfield" TabIndex="2" Text="密码" onfocus="if(this.value=='密码'){this.value='';}"></asp:TextBox>
								      <div id="Lo">
								         <asp:LinkButton ID="lkbtnForget" runat="server" Text="忘记密码？" PostBackUrl="~/Backstage/Find_password.aspx"></asp:LinkButton>
								      </div>
								      <div class="center1">
								          <input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="Log In" tabindex="3">
							
								      </div>
				   	 				</form>
				    			</div>
				    <div class="mainRight">
				      <p class="white">第三方快速登录</p>
				      <div>
				        <ul>
				          <li><img src="images/QQ-red.png"></li>
				          <li><img src="images/wechart.png"></li>
				          <li><img src="images/weibo.png"></li>
				          <li><img src="images/buy.png"></li>
				        </ul>
				      </div>
				      <p class="red">短信快捷登录</p>
				      <p class="red">扫一扫下载客户端</p>
				    </div>
				  </div>
			  <div id="searchLo" style="display:none;">
       
      <form id="searchform" name="searchform" method="post" action="indexsearch.html">
           
        <input type="text" name="sear" id="sear" class="txt" tabindex="1" value="关键字" onfocus="if(this.value=='关键字'){this.value='';}" >
        <button id="searc" class="search-blu hide">搜索</button>
        <div class="kayWords">
          <ul>
            <li><a href="#">数码</a></li>
            <li><a href="#">数码</a></li>
            <li><a href="#">数码</a></li>
            <li><a href="#">数码</a></li>
            <li><a href="#">数码</a></li>
            <li><a href="#">数码</a></li>
            <li><a href="#">数码</a></li>
            <li><a href="#">数码</a></li>
            <li><a href="#">数码</a></li>
            <li><a href="#">数码</a></li>
            <li><a href="#">数码</a></li>
          </ul>
        </div>

      </form>
  </div>
   

				
				<li><a class="header-right-float header-right-float-wide" href="">会员专享<br><span class="span-width ">	会员专享</span></a></li>
				<li><a class="header-right-float header-right-float-wide" href="">创业白板<br><span class="span-width ">创业白板</span></a></li>
				<li><a class="header-right-float" href="" >热议<br><span  >热议</span></a>
				</li>
				<li><a class="header-right-float" href="">	活动<br><span  >活动	</span></a></li>
				<li class="unfold-li"><a class="header-right-float unfold-a" href="" >资讯	<br><span  >资讯</span></a>
				<ul class=" unfold">
					<div class="clearfix">
						<li><a href="">电商消费</a></li>
						<li><a href="">娱乐淘金</a></li>
						<li><a href="">雪花一代</a></li>
						<li><a href="">人工智能</a></li>
						<li><a href="">车与出行</a></li>
						<li><a href="">智能终端</a></li>
						
					</div>	
				</ul>
				</li>
			</ul>
		</div>
	</div>
	<div class="main">
		<div class="center">
			<div class="img-div">
				<img  class="image-large" src="./images/big.png" alt="">
			</div>
			<div class="buy">
				<h1 class="headline"><%#Eval("activity_name") %></h1>
				<a href="">立即购票</a>
				<p>活动地点：北京<br>活动时间：<%#Eval("activity_start").ToString().Substring(0,10) %> <br>
				活动费用：早早市票 ￥188 <br>
				优惠信息：<span>加入会员，即享八折优惠</span><br>
				<span>2016-12-03:53 至 2017-12-03 00:00 APP下单享优惠 </span>下载虎嗅APP>></p>
			</div>
			<div class="active">
				<h1 class="headline">活动介绍</h1>
				<br>
				<span>【大会介绍】</span>
				<br>
				<asp:Label ID="lbActivityContent" runat="server" ></asp:Label>
			</div>
			<div class="stystem">
				<h1 class="headline">专题介绍</h1>
				<div class="narrowcenter">
					<ul class="clearfix">
						<%--	<li>
								<div class="stystem-content stystem-content-left"><div class="image-large-border1"><img class="image-large" src="./images/11.jpg" alt=""></img></div><a href="">联想之量刘伟揭露人工智能的残酷...</a></div>
							</li>
							<li>
								<div class="stystem-content"><div class="image-large-border1"><img class="image-large" src="./images/11.jpg" alt=""></img></div><a href="">联想之量刘伟揭露人工智能的残酷...</a></div>
							</li>
							<li>
								<div class="stystem-content stystem-content-left"><div class="image-large-border1"><img class="image-large" src="./images/11.jpg" alt=""></img></div><a href="">联想之量刘伟揭露人工智能的残酷...</a></div>
							</li>
							<li>
								<div class="stystem-content "><div class="image-large-border1"><img class="image-large" src="./images/11.jpg" alt=""></img></div><a href="">联想之量刘伟揭露人工智能的残酷...</a></div>
							</li>--%>
                        <asp:Repeater ID="rptTopic" runat="server" OnItemCommand="rptTopic_ItemCommand" OnItemDataBound="rptTopic_ItemDataBound">
                            <ItemTemplate>
                                <li>
                                    <asp:Panel ID="pnActivitiy" runat="server" CssClass="stystem-content stystem-content-left"><div id="div2" class="image-large-border1"><img class="image-large" src='<%#"../"+Eval("topic_cover") %>' alt=""></img></div><asp:LinkButton ID="lkbtnTopic" runat="server" Text='<%#Eval("topic_content") %>'></asp:LinkButton></asp:Panel>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>

					</ul>
					<span>分享到：</span>
					<ul class="clearfix">	
					<div class="circle cirle-qq"><a href="	"></a></div>
					<div class="circle cirle-blog"><a href="	"></a></div>
					<div class="circle cirle-pay"><a href="	"></a></div>
					<div class="circle cirle-wc"><a href="	"></a></div>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="footer-narrow-center">
			<div class="footer-left clearfix">
				<ul>
					<li><a class="footer-left-top" href="">关于我们</a></li>
					<li><a class="footer-left-top" href="">合作伙伴</a></li>
					<li><a class="footer-left-top" href="">常见问题解答</a></li>
					<li><a href="">加入我们</a></li>
					<li><a href="">广告及服务</a></li>
					<li><a href="">防网络诈骗专题</a></li>
				</ul>
			</div>
			<div class="footer-right">
				<ul>
					<li><a class="footer-right-width" href="">联系我们</a></li>
					<li><a class="footer-right-wchat" href=""></a></li>
					<li><a class="footer-right-qq" href=""></a></li>
					<li><a class="footer-right-massage" href=""></a></li>
				</ul>
			</div>
			<div class="footer-bottom">
				<p>Copyright © 虎嗅网 京ICP备12013432号-1 <img src="./images/plice.png" alt=""> 京公网安备 11010102001402号 本站由 <img src="./images/al.png" alt=""> 提供计算与安全服务</p>
			</div>
		</div>
	</div>	
</div>
<script>
	$(function(){
	$('.header-right-float').hover(function(){
		$(this).css({'top':0+'px'}).animate({'top':-50},400);
	},function(){
		$(this).stop(true).animate({'top': 0}, 400); 
	})
	$('.unfold-li').hover(function(){
		$('.unfold').css({'display':'block','top':50}).animate({'top':-50,'left':0,'opacity':1}, 400);
	50},function(){
		$('.unfold').css({'display':'none'}).animate({'top':50,'opacity':0.3}, 400);
	})

})
</script>
<script>
		$(function(){

  $('#loginform').submit(function(e){

    return false;

  });
  
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });

});
</script>
<script type="text/javascript">
$(function(){

  $('#searchform').submit(function(e){

    return false;

  });
  
  $('#modal').leanModal({ top: 110, overlay: 0.45, closeButton: ".hide" });

});

</script>
    </form>
</body>
</html>