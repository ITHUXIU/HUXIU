<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activity.aspx.cs" Inherits="Front_end_Period_huxiu1_js_Activity" %>

<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="UTF-8">
	<title>活动页</title>
	<link rel="stylesheet" type="text/css" media="all" href="css/style.css">
	<link rel="stylesheet" href="css/roll.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/activity.css">
	<script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/pagescroller.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
	<!--[if lte IE 8]>
	<link rel="stylesheet" href="css/ie8.css"><![endif]-->
</head>
<body>
    <form id="form1" runat="server" >
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
				  <div id="sendMes" style="display:none;">
       
			      <div class="titleHu">
			        <img src="images/blackHu.png">
			      </div>
			      <div class="sendText">
			        <form id="sentform" name="sentform" method="post" action="index.html">
			           <input type="text" name="tit" id="tit" class="titl" tabindex="1" value="标题" onblur="disappearT()" onfocus="if(this.value=='标题'){this.value='';}">
			           <textarea name="cont" id="cont" class="contText" tabindex="2" value="内容" onblur="disappear()" onfocus="if(this.value=='内容'){this.value='';}"  rows="10" cols="30">内容</textarea>
			          <input type="text" name="contect" id="contect" class="contectL" tabindex="3" value="联系方式" onblur="disappearC()" onfocus="if(this.value=='联系方式'){this.value='';}">
			           <textarea name="sentImg" id="sentImg" class="sentImgL" tabindex="3" onblur="disappearS()" onfocus="if(this.value=='上传图片'){this.value='';}"  rows="10" cols="30">上传图片</textarea>
			          <div class="sentNote">
			            <div class="hide"><span></span><p>匿名投稿</p></div>
			            <div class="addition"><span></span><p>允许虎嗅将您的原创稿件授权于虎嗅有关合作关系的第三方平台</p></div>
			            
			            <p class="care">请您放心，授权会严格满足转载规范，标明您的姓名及来源等信息</p>
			          </div>

			         
			      
			        <div class="sendBut">
			          <input type="submit" name="sentAct" id="sentAct" class="sentActicle sentmodal" value="我要投稿" tabindex="4">
			          <input type="submit" name="save" id="save" class="save-blu sentmodal" value="存草稿" tabindex="5">

			        </div>

			      </form>
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
				<ul class=" unfold clearfix">
					<div class="clearfix">
						<li><a href="">电商消费</a></li>
						<li><a href="">娱乐淘金</a></li>
						<li><a href="">雪花一代</a></li>
						<li><a href="">人工智能</a></li>
						<li><a href="">车与出行</a></li>
						<li><a href="">智能终端</a></li>
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
	<div id="wrapper">
	<div id="main" class="main">
		<div class="main-channel">
		<div class="left-div">
		<ul>
				<li><a class="left-div-first flatbtn" href="#sendMes" id="modalt">投稿</a></li>
				
			  
				<li><a class="left-div-second" href="">客户端</a></li>
				<li><div class="floatCtro"><a class="left-div-last" href="#1">
            	返回顶部
          		</a></div></li>
			</ul>
			</div>
			<div class="center clearfix">
				<div class="main-channel-left">
				<h1 class="section"></h1>
						<h1 class="headline dif-headline ">活动频道</h1>

					<div class="main-channel-left-content clearfix">
						<ul class="clearfix">
							<li>
								<div class="main-channel-left-content-content"><div class="image-large-border1"><img class="image-large" src="./images/1.jpg" alt=""></img></div><a href="">销售凭什么拿5万</a></div>
							</li>
							<li>
								<div class="main-channel-left-content-content"><div class="image-large-border1"><img class="image-large" src="./images/2.jpg" alt=""></img></div><a href="">圆桌专享笔记</a></div>
							</li>
							<li>
								<div class="main-channel-left-content-content"><div class="image-large-border1"><img class="image-large" src="./images/3.jpg" alt=""></img></div><a href="">昨天没上榜的朋友们</a></div>
							</li>
							<li>
								<div class="main-channel-left-content-content"><div class="image-large-border1"><img class="image-large" src="./images/1.jpg" alt=""></img></div><a href="">销售凭什么拿5万月薪</a></div>
							</li>
							
							<a class="more  more-different" href=""> >>>更多</a>
						</ul>
						
					</div>
				</div>
				<div class="main-channel-right">
					<div class="main-channel-right-top clearfix">
						<span></span>
						<h1 class="headline section">虎嗅活动</h1>

					</div>
					<div class="main-channel-right-content clearfix">
					<ul class="clearfix">
						<li>
							<div class="channel-right-large"><div class="image-large-border3"><img class="image-large" src="./images/4.jpg" alt=""><a class="label" href="	"><p>第六期</p></a></div><h1>虎嗅微访谈</h1><span>进行中</span><p>虎嗅微访谈，是虎嗅不定期举办的线上轻型访谈分享交流活动，跟随商业热点与创业热宠</p></div>
						</li>
						<li>
							<div class="channel-right-small"><a class="label" href="	"><p>第六期</p></a><div class="image-large-border2"><img class="image-large" src="./images/5.jpg" alt=""></div><h1>WOW!新媒体</h1><span>进行中</span><p>虎嗅微访谈，是虎嗅不定期举办的线上轻型访谈分享交流活动。</p></div>
						</li>
						<li>
							<div class="channel-right-small"><a class="label" href="	"><p>第六期</p></a><div class="image-large-border2"><img class="image-large" src="./images/6.jpg" alt=""></div><h1>虎嗅微访谈</h1><span>进行中</span><p>虎嗅微访谈，是虎嗅不定期举办的线上轻型访谈分享交流活动。</p></div>
						</li>
						<li>
							<div class="channel-right-small"><a class="label" href="	"><p>第六期</p></a><div class="image-large-border2"><img class="image-large" src="./images/7.jpg" alt=""></div><h1>虎嗅微访谈</h1><span>进行中</span><p>虎嗅微访谈，是虎嗅不定期举办的线上轻型访谈分享交流活动。</p></div>
						</li>
						<li>
							<div class="channel-right-small channel-right-small-last"><a class="label" href="	"><p>第六期</p></a><div class="image-large-border2"><img class="image-large" src="./images/8.jpg" alt=""></div><h1>虎嗅微访谈</h1><span>进行中</span><p>虎嗅微访谈，是虎嗅不定期举办的线上轻型访谈分享交流活动。</p></div>
						</li>
					</ul>
					<a class="more" href=""> >>>更多</a>
					</div>
				</div>
			</div>
		</div>
		<div class="main-outer">
		<div class="center-dif">
			<div class="main-outer-top clearfix">
				<h1 class="headline section">外部活动</h1>
				<span></span>
				<a class="more  more-different2" href=""> >>>提交活动</a>
			</div>
		
			<div class="main-outer-bottom">
				<ul class="clearfix">
						<li><div class="image-large-border"><img class="image-large" src="./images/9.jpg" alt=""></div></li>
						<li><div class="passage-a"  href="	">
								<h2>2017宁波锦州 “创业锦州：精英引领计划...
								</h2>
								<div class="clearfix">
								<span class="red-span">进行中</span>
								</div>
								<a class="gray" href="">默默直播<span class="clock-span" >2017-03-29</span></a>
						</div ></li>
						<li><div class="image-large-border"><img class="image-large" src="./images/10.jpg" alt=""></div></li>
						<li><div class="passage-a" href="	">
							<h2>2017宁波锦州 “创业锦州：精英引领计划...
								</h2>
								<div class="clearfix">
								<span class="red-span">进行中</span>
								</div>
								<a class="gray" href="">默默直播<span class="clock-span" >2017-03-29</span></a>

						</div ></li>
						<li><div class="image-large-border"><img class="image-large" src="./images/9.jpg" alt=""></div></li>
						<li><div  class="passage-a" href="	">
							<h2>2017宁波锦州 “创业锦州：精英引领计划...
								</h2>
								<div class="clearfix">
								<span class="red-span">进行中</span>
								</div>
								<a  class="gray" href="">默默直播<span class="clock-span" >2017-03-29</span></a>

						</div ></li>	
					</ul>
			</div>
			</div>
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
<script type="text/javascript">
	$(document).ready(function(){
		var navLabel = new Array('虎嗅活动','活动频道','外部活动');
		$('.main').pageScroller({ navigation: navLabel });
	});	

	</script>
	<script type="text/javascript">
		$('div.floatCtro a').click(function(){
			$('body,html').animate({scrollTop:0},1000);
			$('li.scrollNav.active').removeClass('active');
			});	

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

  $('#sentform').submit(function(e){

    return false;

  });
  
  $('#modalt').leanModal({ top: 110, overlay: 0.45, closeButton: ".sentmodal" });

});
  function disappear(){
    var a =document.getElementById("cont");
    if(a.value == ""){
      a.value ="内容";
    }
  }
   function disappearT(){
    var a =document.getElementById("tit");
    if(a.value == ""){
      a.value ="标题";
    }
  }
   function disappearC(){
    var a =document.getElementById("contect");
    if(a.value == ""){
      a.value ="联系方式";
    }
  }
   function disappearS(){
    var a =document.getElementById("sentImg");
    if(a.value == ""){
      a.value ="上传图片";
    }
  }

</script>
<script type="text/javascript">
$(function(){

  $('#searchform').submit(function(e){

    return false;

  });
  
  $('#modal').leanModal({ top: 110, overlay: 0.45, closeButton: ".hide" });

});

</script>

</div>	
        </form>
</body>
</html>
