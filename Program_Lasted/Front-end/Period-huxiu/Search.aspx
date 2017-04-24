<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Front_end_Period_huxiu_Search" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>资讯页</title>
	 <link rel="stylesheet" type="text/css" media="all" href="css/style.css">
	<link rel="stylesheet" href="css/roll.css" type="text/css" media="all" />
	<link rel="stylesheet" type="text/css" href="css/search1.css">
	<script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/pagescroller.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>1
	<!--[if lte IE 8]>
	<link rel="stylesheet" href="css/ie8.css"><![endif]-->

</head>
<body>
    <form runat="server">
	<div class="container">
	<div class="header">
		<div class="center">
			<ul class="clearfix">
				<li class="header-left-float"><a  href="../homePage-master/Homepageaspx.aspx"></a></li>
				<li class="people" style="height:0px;"><a href="#loginmodal" class="flatbtn  header-right-float-people" id="modaltrigger"></a></li>
				<li><a href="#searchLo" class="flat header-right-float-search" id="modal"></a></li>
                <li class="header-right-float header-right-float-wide"><a  href="">会员专享<br><span class="span-width ">	会员专享</span></a></li>
				<li class="header-right-float header-right-float-wide"><a href="">创业白板<br><span class="span-width ">创业白板</span></a></li>
				<li class="header-right-float"><a href="" >热议<br><span  >热议</span></a>
				</li>
				<li class="clearfixHide"><a class="header-right-float" href="../Period-huxiu/Activity.aspx">	活动<br><span  >活动	</span></a></li>
				<li class="unfold-li"><a class="header-right-float unfold-a" href="" >资讯	<br><span  >资讯</span></a>
				<ul class=" unfold">
					<div class="clearfix">
                        <asp:Repeater ID="rptClass" runat="server">
                            <ItemTemplate>
                                <li><asp:LinkButton ID="lbtClass" runat="server" Text='<%# Eval("news_classname") %>'  PostBackUrl='<%#"News_List.aspx?news_classid="+ Eval("news_classid")%>'></asp:LinkButton>
                           </li> </ItemTemplate>
                        </asp:Repeater>
						
					</div>	
				</ul>
				</li>
			</ul>
							<div id="loginmodal" style="display:none;">
								    <div class="mainLeft">
								      <div class="mainLeftImg">
								            <img src="./images/blackHu.png" alt="">
								      </div>
								      <form id="loginform" name="loginform" method="post" action="index.html">
       			            <asp:TextBox ID="txtusername" runat="server" CssClass="txtfield" TabIndex="1" Text="邮箱/虎嗅账号" onfocus="if(this.value=='邮箱/虎嗅账号'){this.value='';}"></asp:TextBox>
                      <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="txtfield" TabIndex="2" Text="密码" onfocus="if(this.value=='密码'){this.value='';}"></asp:TextBox>
								      <div id="Lo">
								         <asp:LinkButton ID="lkbtnForget" runat="server" Text="忘记密码？" PostBackUrl="~/Backstage/Find_password.aspx"></asp:LinkButton>
								      </div>
								      <div class="center1">
								         
                                          <asp:Button ID="btnLogin" runat="server" CssClass="flatbtn-blu hidemodal" Text="Log In" TabIndex="3" OnClick="btnLogin_Click" />
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
       
           
        
            <asp:TextBox ID="txtSearch" runat="server" CssClass="txt" TabIndex="1"  onfocus="if(this.value=='关键字'){this.value='';}"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" CssClass="search-blu hide" Text="搜索" TabIndex="3" OnClick="btnSearch_Click" />
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

      
  </div>
   

				
				
		</div>
	</div>
	<div id="wrapper">
	<div id="main" class="main">
			<div class="left-div">
			<ul class="clearfix">
				<li class="left-div-first"><a class=" flatbtn" href="#sendMes" id="modalt">投稿</a></li>
				<li class="left-div-second"><a  href="">客户端</a></li>
				<li class="left-div-last"><div class="floatCtro"><a  href="#1">
            	返回顶部
          		</a></div></li>
			</ul>
			</div>
			<div class="center">
			<div class="message-box">
			<%--<input type="text"  hidefocus= true class="HideFocus" >--%>
                <asp:TextBox ID="txtAA" runat="server"></asp:TextBox>
			<%--<a class="HideFocus-search" href="">--%><asp:LinkButton ID="ltnAA" CssClass="HideFocus-search" runat="server" OnClick="ltnAA_Click"></asp:LinkButton><%--</a>--%>
			<div class="none-div"></div>
				<ul class="clearfix">
                    <asp:Repeater ID="rptResult" runat="server" OnItemDataBound="rptResult_ItemDataBound">
                        <ItemTemplate>
                            <li class=""><a href="#">
                                <div class="messageRightText">
                                    <div class="label">
                                        <img src="images/lab.png">
                                        <p><asp:Label ID="lbClass" runat="server">
                                           电商资讯
                                           </asp:Label></p>
                                    </div>
                                    <h2><a href='<%#"../zixunCont-master/News_Content.aspx?news_id="+Eval("news_id")%>'><%# Eval("news_title") %></a></h2>
                                    <div class="messageRightNote">
                                        <img src="images/tou.png">
                                        <p><%# Eval("new_author") %></p>
                                        <p><asp:Label ID="lbTime" runat="server" Text=<%# Eval("news_time") %>></asp:Label>
                                            <asp:Label ID="lbID" runat="server" Text=<%# Eval("news_id") %> Visible="false"></asp:Label>
                                        </p>
                                        <span id="email"></span>
                                        <span id="star" onclick="changeStar()"></span>
                                        
                                    </div>
                                    
                                    <p><a href='<%#"../zixunCont-master/News_Content.aspx?news_id="+Eval("news_id")%>'><asp:Label ID="lbContent" runat="server" Text=<%# Eval("news_content") %>></asp:Label></a></p>
                                </div>
                                <div class="messageRightImg">
                                    <a href='<%#"../zixunCont-master/News_Content.aspx?news_id="+Eval("news_id")%>'><img src='<%#"../../Backstage/"+ Eval("news_cover") %>' /></a>
                                </div>
                            </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
				</ul>
		
	</div>
	<ul class="clearfix">
        <asp:Panel ID="pnVi" runat="server" Visible="true">
            <ul class="clearfix">
                <li class="page page-red"><a href="	">
                    <asp:LinkButton ID="btnGo" runat="server" OnClick="btnGo_Click" Text="转到" /></a></li>
                <li class="turn-page"><span>转到<asp:TextBox ID="txtPage" runat="server" CssClass="page-span" Width="25px" onkeyup="this.value=this.value.replace(/\D/g,'')"></asp:TextBox>页</span></li>
                <li class="page page-width"><a href="	">
                    <asp:LinkButton ID="btnNext" runat="server" OnClick="btnNext_Click" Text="下一页" /></a></li>
                <li class="page">
                    <asp:Label ID="lbNows" runat="server" Text="1"></asp:Label>/<asp:Label ID="lbTotals" runat="server" Text="1"></asp:Label></li>
                <li class="page page-width"><a href="	">
                    <asp:LinkButton ID="btnLast" runat="server" OnClick="btnLast_Click" Text="上一页" /></a></li>
            </ul>
        </asp:Panel>
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
		var navLabel = new Array('热文','全球热点','专题专栏');
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
        </form>

</body>
</html>