<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News_List.aspx.cs" Inherits="Front_end_Period_huxiu_News_List" EnableEventValidation="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>资讯页</title>
	 <link rel="stylesheet" type="text/css" media="all" href="css/style.css">
	<link rel="stylesheet" href="css/roll.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/information.css">	
	<script type="text/javascript"  src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/pagescroller.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
	<!--[if lte IE 8]>
	<link rel="stylesheet" href="css/ie8.css"><![endif]-->

</head>
<body><form runat="server">
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
								           
								       <input type="text" name="username" id="username" class="txtfield" tabindex="1" value="手机号/邮箱/虎嗅账号" onfocus="if(this.value=='手机号/邮箱/虎嗅账号'){this.value='';}">
								      <input type="password" name="password" id="password" class="txtfield" tabindex="2"  >
								      <div id="Lo">
								        <span></span><p id="remember">记住密码</p>
								        <p id="forget">忘记密码?</p>
								      </div>
								      <div class="center1">
								          <input type="submit" name="loginbtn" id="loginbtn" class="flatbtn-blu hidemodal" value="Log In" tabindex="3">
								          <input type="submit" name="zhubtn" id="zhubtn" class="flatbtn-blu hidemodal" value="注册" tabindex="3">
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
				<%--<li><a class="header-right-float" href="">	活动<br><span  >活动	</span></a></li>--%>
                <li class="clearfixHide"><asp:LinkButton CssClass="header-right-float" runat="server" PostBackUrl="~/Front-end/Period-huxiu/Activity_List.aspx"></asp:LinkButton></li>
				<li class="unfold-li"><a class="header-right-float unfold-a" href="" >资讯	<br><span  >资讯</span></a>
				<ul class=" unfold">
					<div class="clearfix">
                        <asp:Repeater ID="rptClass" runat="server">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtClass" runat="server" Text='<%# Eval("news_classname") %>'  PostBackUrl='<%#"News_List.aspx?news_classid="+ Eval("news_classid")%>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:Repeater>
					</div>	
				</ul>
				</li>
			</ul>
		</div>
	</div>
	<div id="wrapper">
	<div id="main" class="main">
		<div class="main-passage">
			<div class="left-div">
			<ul>
				<li><a class="left-div-first flatbtn" href="#sendMes" id="modalt">投稿</a></li>
				<li><a class="left-div-second" href="">客户端</a></li>
				<li><div class="floatCtro"><a class="left-div-last" href="#1">
            	返回顶部
          		</a></div></li>
			</ul>
			</div>
			<div class="center">
				<div class="main-passage-headline clearfix section">
					<h1 class="headline"><asp:Label ID="lbClass" runat="server"></asp:Label> - 热文</h1>
					<asp:LinkButton ID="lbtChange" runat="server" Text="换一换" OnClick="lbtChange_Click"></asp:LinkButton>
				</div>
				<div class="main-passage-content">
					<ul class="clearfix">
                        <asp:Repeater ID="rptHotNews" runat="server" OnItemDataBound="rptHotNews_ItemDataBound">
                            <ItemTemplate>
						<li><div class="image-large-border"><asp:Image CssClass="image-large" ImageUrl='<%#"../../Backstage/" + Eval("news_cover") %>' runat="server" /></div></li>
						<li><a class="passage-a"  href="	">
								<h2><asp:LinkButton Text=<%# Eval("news_title")%> PostBackUrl='<%#"~/Front-end/zixunCont-master/News_Content.aspx?news_id="+Eval("news_id")%>' runat="server"></asp:LinkButton></h2>
								<p><%--<span>Grace  03-24 16:00 收藏13 评论7	</span>--%>
                                <span><%# Eval("new_author") %></span>
                                <span><%# Eval("news_time") %></span>
                                <span> 收藏13 评论7	 </span></p>
								<p><asp:Label ID="lbHotNews" runat="server" Text=<%# Eval("news_content") %>></asp:Label></p>
						</a></li>
                            </ItemTemplate>
                        </asp:Repeater>
					</ul>
				</div>
			</div>
		</div>
		<div class="main-content">
			<div class="center">
				<div class="main-content-headline clearfix section">
					<h1 class="headline"><asp:Label ID="lbClass1" runat="server"></asp:Label> - 内容</h1>
				</div>
				<div class="main-content-content">
					<ul class="clearfix">

                            <asp:Repeater ID="rptNews" runat="server" OnItemDataBound="rptNews_ItemDataBound">
                                <ItemTemplate>
                                    <li>
                                        <div class="container-div container-left-div clearfix">
                                            <div class="image-large-border2">
                                                <a class="reward "></a>
                                                <asp:Image ImageUrl='<%#"../../Backstage/" + Eval("news_cover") %>' runat="server" CssClass="image-large" />
                                            </div>
                                            <asp:LinkButton Text=<%# Eval("news_title") %> PostBackUrl='<%#"~/Front-end/zixunCont-master/News_Content.aspx?news_id="+Eval("news_id")%>' runat="server"></asp:LinkButton>
                                            <span><%# Eval("new_author") %>  评论7	</span>
                                            <p><asp:Label ID="lbNews" runat="server" Text=<%# Eval("news_content") %>></asp:Label></p>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

					</ul>
					<ul class="clearfix">
				<%--		<li><a class="page-a page-a-red" href="	">转到</a></li>
						<li><span class="page-span">转到<input type="	">页</span></li>
						<li><a class="page-a page-a-width" href="	">下一页</a></li>
						<li><a class="page-a page-a-width" href="	">300</a></li>
						<li><span class="page-span page-span-narrow">...</span></li>
						<li><a class="page-a" href="	">6</a></li>
						<li><a class="page-a" href="	">5</a></li>
						<li><a class="page-a" href="	">4</a></li>
						<li><a class="page-a" href="	">3</a></li>
						<li><a class="page-a" href="	">2</a></li>
						<li><a class="page-a" href="	">1</a></li>
						<li><a class="page-a page-a-width" href="	">上一页</a></li>--%>
                                <asp:Button ID="btnUp" CssClass="page-a page-a-width" runat="server" Text="上一页" OnClick="btnUp_Click" />
                                &nbsp;<asp:Button ID="btnDrow" CssClass="page-a page-a-width" runat="server" Text="下一页" OnClick="btnDrow_Click" />
                                &nbsp;<asp:Button ID="btnFirst" CssClass="page-a page-a-width" runat="server" Text="首页" OnClick="btnFirst_Click" />
                                &nbsp;<asp:Button ID="btnLast" CssClass="page-a page-a-width" runat="server" Text="尾页" OnClick="btnLast_Click" />
                                &nbsp;页次：<asp:Label ID="lbNow" runat="server" Text="1"></asp:Label>
                                /<asp:Label ID="lbTotal" CssClass="page-a" runat="server" Text="1"></asp:Label>

                                &nbsp;

                                转<asp:TextBox ID="txtJump" Text="1" runat="server" Width="23px" onkeyup="this.value=this.value.replace(/\D/g,'')"></asp:TextBox>
                                &nbsp;<asp:Button ID="btnJump" runat="server" Text="Go" OnClick="btnJump_Click" />


                            </ul>
				</div>
			</div>
		</div>
		<div class="main-subject clearfix section">
			<div class="center">
				<div class="main-subject-left">
					<div class="main-subject-left-top clearfix ">
						<h1 class="headline">专题</h1>
						<a href="">全部内容</a>
					</div>
					<div class="main-subject-left-content clearfix">
						<a class="subject-image-a " href="	"><div class="image-large-border3"><img class="image-large" src="./images/hszg.jpg" alt="">

						</div></a>
						<ul >
							<li><a class="subject-top-a" href="	">快手的"钱"世今生<span>  今天</span></a></li>
							<li><a href="	">快手的"钱"世今生<span>1天前	</span></a></li>
							<li><a href="	">快手的"钱"世今生<span>1天前	</span></a></li>
							<li><a href="	">快手的"钱"世今生<span>1天前	</span></a></li>
							<li><a href="	">快手的"钱"世今生<span>1天前	</span></a></li>
							<li><a href="	">快手的"钱"世今生<span>1天前	</span></a></li>
							<li><a href="	">快手的"钱"世今生<span>1天前	</span></a></li>
							<li><a href="	">快手的"钱"世今生<span>1天前	</span></a></li>
							<li><a href="	">快手的"钱"世今生<span>1天前	</span></a></li>
						</ul>
					</div>
				</div>
				<div class="main-subject-right">
					<div class="main-subject-right-top clearfix">
						<h1 class="headline">专栏</h1>
					</div>
					<div class="main-subject-right-content clearfix">
					<div class="right-box clearfix">
					 <div class="main-subject-right-content-first-div right-content-div"><a class="main-subject-right-content-first-a  clearfix" href=""><img src="./images/sun.png" alt=""></a><h2>#早报#</h2></div><div class="right-content-div main-subject-right-content-second-a clearfix"><a class="dip" href=""><img src="./images/circle.png" alt=""></a><h2>#深度#</h2></div></div>
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
	<script>
	    $(function () {
	        $('.header-right-float').hover(function () {
	            $(this).css({ 'top': 0 + 'px' }).animate({ 'top': -50 }, 400);
	        }, function () {
	            $(this).stop(true).animate({ 'top': 0 }, 400);
	        })
	        $('.unfold-li').hover(function () {
	            $('.unfold').css({ 'display': 'block', 'top': 50 }).animate({ 'top': -50, 'left': 0, 'opacity': 1 }, 400);
	            50
	        }, function () {
	            $('.unfold').css({ 'display': 'none' }).animate({ 'top': 50, 'opacity': 0.3 }, 400);
	        })

	    })
		</script>
	<script type="text/javascript">
	    $(document).ready(function () {
	        var navLabel = new Array('热文', '全球热点', '专题专栏');
	        $('.main').pageScroller({ navigation: navLabel });
	    });

	</script>
	<script type="text/javascript">
	    $('div.floatCtro a').click(function () {
	        $('body,html').animate({ scrollTop: 0 }, 1000);
	        $('li.scrollNav.active').removeClass('active');
	    });

	</script>
	<script>
	    $(function () {

	        $('#loginform').submit(function (e) {

	            return false;

	        });

	        $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });

	    });
</script>
<script type="text/javascript">
    $(function () {

        $('#sentform').submit(function (e) {

            return false;

        });

        $('#modalt').leanModal({ top: 110, overlay: 0.45, closeButton: ".sentmodal" });

    });
    function disappear() {
        var a = document.getElementById("cont");
        if (a.value == "") {
            a.value = "内容";
        }
    }
    function disappearT() {
        var a = document.getElementById("tit");
        if (a.value == "") {
            a.value = "标题";
        }
    }
    function disappearC() {
        var a = document.getElementById("contect");
        if (a.value == "") {
            a.value = "联系方式";
        }
    }
    function disappearS() {
        var a = document.getElementById("sentImg");
        if (a.value == "") {
            a.value = "上传图片";
        }
    }

</script>
<script type="text/javascript">
    $(function () {

        $('#searchform').submit(function (e) {

            return false;

        });

        $('#modal').leanModal({ top: 110, overlay: 0.45, closeButton: ".hide" });

    });

</script>
	<script type="text/javascript">
	    $('.reward').click(function () {
	        if (!$(this).hasClass('disreward')) {
	            $(this).addClass('disreward');
	        }
	        else {
	            $(this).removeClass('disreward');
	        }
	    });

	</script>
</div>	</form>
</body>
</html>