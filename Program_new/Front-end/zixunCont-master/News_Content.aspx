<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News_Content.aspx.cs" Inherits="Front_end_zixunCont_master_News_Content" %>

<!DOCTYPE html>
<html>
<head>
	<title>资讯内容</title>
	<meta charset ="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/zixunContCss.css">
	 <link rel="stylesheet" type="text/css" media="all" href="css/load.css">
	 <link rel="stylesheet" type="text/css" media="all" href="css/search.css">
	 <link rel="stylesheet" type="text/css" href="css/sendCss.css">
	 <link rel="stylesheet" type="text/css" href="css/roll.css">
	<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
	<script type="text/javascript" src="js/pagescroller.min.js"></script>
	<!-- 	/*<script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>*/ -->
</head>
<body><form runat="server">
	<div class="content">
		<div class="header">
			<div class="centera">
			<ul class="clearfix">
				<li><a class="header-left-float "  href=""></a></li>
				<li><a class=" header-right-float-people flatbtn" id="modaltrigger" href="#loginmodal"></a></li>
				<li><a class="header-right-float-search flat" id="modal" href="#searchLo"></a></li>
				<li><a class="header-right-float header-right-float-wide" href="">会员专享<br><span class="span-width ">	会员专享</span></a></li>
				<li><a class="header-right-float header-right-float-wide" href="">创业白板<br><span class="span-width ">创业白板</span></a></li>
				<li><a class="header-right-float" href="" >热议<br><span  >热议</span></a>
				</li>
				 <li class="clearfixHide"><asp:LinkButton CssClass="header-right-float" runat="server" PostBackUrl="~/Front-end/Period-huxiu/Activity_List.aspx"></asp:LinkButton></li>
				<li class="unfold-li"><a class="header-right-float unfold-a" href="" >资讯	<br><span  >资讯</span></a>
				<ul class=" unfold">
					<div>
                        <asp:Repeater ID="rptClass" runat="server">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtClass" runat="server" Text='<%# Eval("news_classname") %>' PostBackUrl='<%#"News_List.aspx?news_classid="+ Eval("news_classid")%>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
					</div>	
				</ul>
				</li>

			</ul>

		</div>
		<!-- 登录 -->
		<div id="loginmodal" style="display:none;">
       
    		<div class="mainLeft">
     		<!-- 	<div class="mainLeftImg">
            		<img src="images/logohx.png">
      			</div> -->
      			<form id="loginform" name="loginform" method="post" action="index.html">
       				<input type="text" name="username" id="username" class="txtfield" tabindex="1" value="手机号/邮箱/虎嗅账号" onfocus="if(this.value=='手机号/邮箱/虎嗅账号'){this.value='';}">
     	 			<input type="password" name="password" id="password" class="txtfield" tabindex="2"  >
      				<div id="Lo">
        				<span></span>
        				<p id="remember">记住密码</p>
        				<p id="forget">忘记密码?</p>
      				</div>
      				<div class="center">
          				<input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="Log In" tabindex="3">
          				<input type="submit" name="zhubtn" id="zhubtn" class="flatbtn-blu hidemodal" value="注册" tabindex="3">

      				</div>

    			</form>
    		</div>
   		 	<div class="mainRight">
     	 		<p class="white">第三方快速登录</p>
      			<div>
        			<ul>
          				<li><img src="images/QQ2.png"></li>
          				<li><img src="images/wechart2.png"></li>
          				<li><img src="images/weibo.png"></li>
          				<li><img src="images/buy.png"></li>
        			</ul>
      			</div>
      			<p class="red">短信快捷登录</p>
      			<p class="red">扫一扫下载客户端</p>
    			</div>
  			</div>
		</div>
		<!-- 搜索 -->
		<div id="searchLo" style="display:none;">
       
      		<form id="searchform" name="searchform" method="post" action="indexsearch.html">
           
       		<input type="text" name="sear" id="sear" class="txt" tabindex="1" value="关键字" onfocus="if(this.value=='关键字'){this.value='';}" >
        	<button name="searc" id="searc" class="search-blu hide" tabindex="3">搜索</button>
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
  		<!-- 投稿 -->
  		<div id="sendMes" style="display:none;">
       
      		<div class="titleHu">
        		<img src="images/blackHu.png">
      		</div>
      		<div class="sendText">
       	 		<form id="sentform" name="sentform" method="post" action="index.html">
           			<input type="text" name="tit" id="tit" class="titl" tabindex="1" value="标题" onblur="disappearT()" onfocus="if(this.value=='标题'){this.value='';}">
           			<textarea name="cont" id="cont" class="contText" tabindex="2" value="内容" onblur="disappear()" onfocus="if(this.value=='内容'){this.value='';}"  rows="10" cols="30">内容</textarea>
          			<input type="text" name="contect" id="contect" class="contectL" tabindex="3" value="联系方式" onblur="disappearC()" onfocus="if(this.value=='联系方式'){this.value='';}">
           			<textarea name="sentImg" id="sentImg" 	class="	sentImgL" tabindex="3" onblur="disappearS()" onfocus="if(this.value=='上传图片'){this.value='';}"  rows="10" cols="30">上传图片</textarea>
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




		<div  class="zhou">
			<div class="left-div">
			<ul>
				<li><a class="left-div-first flatbtn" id="modalt" href="#sendMes"><span></span>投稿</a></li>
				<li><a class="left-div-second" href=""><span></span>客户端</a></li>
				<!-- <li><a class="left-div-third" href="#pageScroll0">热文</a></li>
				<li><a class="left-div-forth" href="#pageScroll1">热门标签</a></li> -->
				<li><div class="floatCtro"><a class="left-div-last" href="#1">
            	返回顶部
          		</a></div></li>
			</ul>
			</div>
		</div>
		<div class="main">
			<h1><asp:Label ID="lbTitle" runat="server"></asp:Label></h1>
			<div class="name">
				<span id = "touxiang"></span><p>界面</p>
			</div>
			<div class="infor">
				<span id="time"><asp:Label ID="lbTime" runat="server"></asp:Label></span>
				<img src="images/whiteStar.png"><span id="like">16</span>
				<img src="images/whiteEmail.png"><span id="message">5</span>
				<span id="exllect"></span><span>76</span>
			</div>
			<div class="from">
				<p>转载自界面</p>
				<span><asp:Label ID="lbNewsClass" runat="server"></asp:Label></span>
                <%--<img src="images/people.jpg">--%>
			</div>
			
			<div class="mainText">
				<asp:Label ID="lbContent" runat="server"></asp:Label>
			</div>
			<div class="hotLogo">
				<div class="hotLogoTitle main-passage-headline clearfix section ">
				
					<img src="images/sanjiao.png"><h2>热门标签</h2>
					<a href="#">全部</a>
				</div>
				<div class="hotLogoCont">
					<ul>
						<li><a href="#">阿里巴巴</a></li>
						<li><a href="#">阿里巴巴</a></li>
						<li><a href="#">阿里巴巴</a></li>
						<li><a href="#">阿里巴巴</a></li>
						<li><a href="#">阿里巴巴</a></li>
						<li><a href="#">阿里巴巴</a></li>
						<li><a href="#">阿里巴巴</a></li>
					</ul>
				</div>
			</div>
			<div class="hotAct">
				<div class="hotActTitle main-passage-headline clearfix section">
					<img src="images/sanjiao.png "><h2>热文</h2>
				</div>
				<div class="hotActCont">
					<ul>
						<li><a href="#">
							<img src="images/claw.jpg">
							<p>如果一座城市连理想都够不上，还谈什么中心？</p>
						</a></li>
						<li><a href="#">
							<img src="images/claw.jpg">
							<p>如果一座城市连理想都够不上，还谈什么中心？</p>
						</a></li>
						<li id="no"><a href="#">
							<img src="images/claw.jpg">
							<p>如果一座城市连理想都够不上，还谈什么中心？</p>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="foot">
			<div class="others">
				<ul>
					<li><a href="#">关于我们</a></li>
					<li><a href="#">合作伙伴</a></li>
					<li><a href="#">常见问题解答</a></li>
					<li><a href="#">联系我们</a></li>
					<li><a href="#">加入我们</a></li>
					<li><a href="#">广告及服务</a></li>
					<li><a href="#">防网络诈骗问题</a></li>
					<li class="Link">	
						<a href="#"><img src="images/wechart.png"></a>
						<a href="#"><img src="images/qq.png"></a>
						<a  id = "email" href="#"><img src="images/email.png"></a>
					</li>
				</ul>
			</div>
			<div class="footNote">
				<p>Copyright © 虎嗅网 京IPC备12013432号-1<img src="images/police.png">京公网安备11010102001402 本站由<a href="#"><img src="images/ali.png"></a>提供计算与安全服务</p>
			</div>	
		</div>
	</div>
	<!-- 导航栏 -->
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

		$(function(){

  			$('#loginform').submit(function(e){

    		return false;

  		});
  
  		$('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });

			});

			/*搜索*/
		$(function(){
  			$('#searchform').submit(function(e){
    		return false;
  		});
  		$('#modal').leanModal({ top: 110, overlay: 0.45, closeButton: ".hide" });
		});

	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			var navLabel = new Array('热门标签','热文');
			$('.content').pageScroller({ navigation: navLabel });
		});	

	</script>
	<script type="text/javascript">
		$('div.floatCtro a').click(function(){
			$('body,html').animate({scrollTop:0},1000);
			$('li.scrollNav.active').removeClass('active');
			});	

	</script>
	<!-- 投稿 -->
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

</script></form>
</body> 
</html>