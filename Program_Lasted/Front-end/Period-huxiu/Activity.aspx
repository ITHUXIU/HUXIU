 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activity.aspx.cs" Inherits="Front_end_Period_huxiu1_js_Activity" EnableEventValidation="false" %>

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
				<li class="header-left-float"><a  href="../homePage-master/Homepageaspx.aspx"></a></li>
				<li class="people" style="height:0px;"><a href="#loginmodal" class="flatbtn  header-right-float-people" id="modaltrigger"></a></li>
				<li><a href="#searchLo" class="flat header-right-float-search" id="modal"></a></li>
										<div id="loginmodal" style="display:none;">
								    <div class="mainLeft">
								      <div class="mainLeftImg">
								            <img src="./images/blackHu.png" alt="">
								      </div>
								      <form id="loginform" name="loginform" method="post" action="index.html">
								           
								       <asp:TextBox ID="txtusername" runat="server" CssClass="txtfield" TabIndex="1" Text="邮箱/虎嗅账号" onfocus="if(this.value=='邮箱/虎嗅账号'){this.value='';}"></asp:TextBox>
                      <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="txtfield" TabIndex="2" Text="密码" onfocus="if(this.value=='密码'){this.value='';}"></asp:TextBox>
								      <div id="Lo">
								      
								        <p id="forget">忘记密码?</p>
								      </div>
								      <div class="center1">
								         <asp:Button ID="btnLogin" runat="server" CssClass="flatbtn-blu hidemodal" Text="Log In" TabIndex="3" OnClick="btnLogin_Click" />
								     <%--     <input type="submit" name="zhubtn" id="zhubtn" class="flatbtn-blu hidemodal" value="注册" tabindex="3">--%>
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
   

				
				<li class="header-right-float header-right-float-wide"><a  href="">会员专享<br><span class="span-width ">	会员专享</span></a></li>
				<li class="header-right-float header-right-float-wide"><a href="">创业白板<br><span class="span-width ">创业白板</span></a></li>
				<li class="header-right-float"><a href="" >热议<br><span  >热议</span></a>
				</li>
				<li class="header-right-float"><a  href="~/Front-end/Period-huxiu/Activity_List.aspx">	活动<br><span  >活动	</span></a></li>
				<li class="unfold-li"><a class="header-right-float unfold-a" href="" >资讯	<br><span  >资讯</span></a>
				<ul class=" unfold">
					<div class="clearfix">

                        <asp:Repeater ID="rptClass" runat="server">
                            <ItemTemplate>
                                <li><a href="<%#"News_List.aspx?news_classid="+ Eval("news_classid")%>"><%# Eval("news_classname") %></a></li>
                                <%--<asp:LinkButton ID="lbtClass" runat="server" Text='<%# Eval("news_classname") %>' PostBackUrl='<%#"~/Front-end/Period-huxiu/News_List.aspx?news_classid="+ Eval("news_classid")%>'></asp:LinkButton>
                           --%> </ItemTemplate>
                        </asp:Repeater>
						
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
			<ul class="clearfix">
				<li class="left-div-first"><a class=" flatbtn" href="#sendMes" id="modalt">投稿</a></li>
				<li class="left-div-second"><a  href="">客户端</a></li>
				<li class="left-div-last"><div class="floatCtro"><a  href="#1">
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
                            <asp:Repeater ID="rptActivityItem" runat="server" OnItemCommand="rptActivityItem_ItemCommand" OnItemDataBound="rptActivityItem_ItemDataBound">
                                <ItemTemplate>
                                    	<li class="<%# Container.ItemIndex!=3 ?"main-channel-left-content-content":"main-channel-left-content-content main-channel-left-content-content-last"%>">
								<div class="image-large-border1"><img class="image-large" src='<%#"../"+Eval("activity_cover") %>' alt=""></img></div><%--<a href="">--%><asp:LinkButton ID="lkbtnItemActivityName" runat="server" Text='<%#Eval("activity_name") %>' CommandArgument='<%#Eval("activity_id") %>' CommandName="ActivityContent"></asp:LinkButton><%--</a>--%>
							</li>
                                </ItemTemplate>
                            </asp:Repeater>
				
							
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
						<li class="channel-right-large">
							<div class="image-large-border4"><img class="image-large" src='<%=activity_cover %>'<%--"./images/4.jpg"--%> alt=""><a class="label" href="	"><p><%=activity_coverlabel %></p></a></div><h1><asp:LinkButton ID="lkbtnActivityHot" runat="server" OnClick="lkbtnActivityHot_Click"></asp:LinkButton></h1><asp:Label ID="lbActivityState" CssClass="main-channel-right-content-span " runat="server"></asp:Label><p><%=activity_content %></p>
						</li>
                        <asp:Repeater ID="rptHuxiuActivity" runat="server" OnItemCommand="rptHuxiuActivity_ItemCommand" OnItemDataBound="rptHuxiuActivity_ItemDataBound">
                            <ItemTemplate>
                               <li class="<%# Container.ItemIndex!=3 ?"channel-right-small":"channel-right-small channel-right-small-last"%>">
							<a class="label" href="	"><p><%#Eval("activity_coverlable") %></p></a><div class="image-large-border2"><img class="image-large" src='<%#"../"+Eval("activity_cover") %>' alt=""></div><div class="right-content"><h1><asp:LinkButton ID="lkbtnActivityName" runat="server" Text='<%#Eval("activity_name") %>' CommandArgument='<%#Eval("activity_id") %>' CommandName="ActivityContent"></asp:LinkButton></h1><%--<span>进行中</span>--%><asp:Label ID="lbActivityState" CssClass="main-channel-right-content-span " runat="server"></asp:Label><p><asp:Label ID="lbActivityContent" runat="server" Text='<%#Eval("activity_content") %>' ></asp:Label></p></div>
						<asp:Label ID="beginTime" runat="server" Visible="false" Text='<%#Eval("activity_start") %>' ></asp:Label>
						<asp:Label ID="endTime" runat="server" Visible="false" Text='<%#Eval("activity_end") %>' ></asp:Label>

                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
						
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
                    <asp:Repeater ID="rptOutActivity" runat="server" OnItemCommand="rptOutActivity_ItemCommand" OnItemDataBound="rptOutActivity_ItemDataBound">
                        <ItemTemplate>
                            <li class="image-large-border">
						 <asp:Image ID="img1" CssClass="image-large" runat="server" ImageUrl='<%#"../"+Eval("activity_cover") %>' /><div class="passage-a"  href="	">
								<h2><asp:LinkButton ID="lkbtnActivityTitle" runat="server" Text='<%#Eval("activity_name")%>' CommandArgument='<%#Eval("activity_id") %>' CommandName="ActivityContent"></asp:LinkButton></h2>
								
								<div class="clearfix">
                                    <asp:Label ID="lbState" runat="server" CssClass="main-channel-right-content-span"></asp:Label>

                                    <asp:Label ID="beginTime" runat="server" Visible="false" Text='<%#Eval("activity_start") %>' ></asp:Label>
						<asp:Label ID="endTime" runat="server" Visible="false" Text='<%#Eval("activity_end") %>' ></asp:Label>
							<%--<span class="red-span">进行中</span>--%>
								</div>
                         
								<a class="gray" href="">默默直播<span class="clock-span" ><%#Eval("activity_start").ToString().Substring(0,10) %></span></a>
						</div><%--<img class="image-large" src="./images/10.jpg" alt="">--%>
                                <asp:Image ID="img2" CssClass="image-large" runat="server" ImageUrl='<%#"../"+Eval("activity_cover") %>' />
						</li>
                        </ItemTemplate>
                    </asp:Repeater>
					
					</ul>
			</div>
			</div>
		</div>
	</div>
	</div>
		</div>

	<div class="footer">
		<div class="footer-narrow-center clearfix">
			<div class="footer-left clearfix">
				<ul class="clearfix">
					<li class="footer-left-top"><a  href="">关于我们</a></li>
					<li class="footer-left-top"><a href="">合作伙伴</a></li>
					<li class="footer-left-top"><a href="">常见问题解答</a></li>
					<li><a href="">加入我们</a></li>
					<li><a href="">广告及服务</a></li>
					<li><a href="">防网络诈骗专题</a></li>
				</ul>
			</div>
			<div class="footer-right">
				<ul class="clearfix">
					<li class="footer-right-width"><a href="">联系我们</a></li>
					<li class="footer-right-wchat"><a  href=""></a></li>
					<li class="footer-right-qq"><a href=""></a></li>
					<li class="footer-right-massage"><a href=""></a></li>
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
