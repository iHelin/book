<#macro page title>
<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
  	<title>${title!} | Book</title>
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta name="format-detection" content="telephone=no">
  	<meta name="renderer" content="webkit">
  	<meta http-equiv="Cache-Control" content="no-siteapp"/>
  	<link rel="alternate icon" type="image/png" href="${request.contextPath}/images/favicon.png">
  	<link rel="stylesheet" href="${request.contextPath}/css/amazeui.min.css"/>
</head>
<script src="${request.contextPath}/js/jquery-2.2.1.min.js"></script>
<script src="${request.contextPath}/js/amazeui.min.js"></script>
<body>
	<header class="am-topbar am-topbar-fixed-top">
		<div class="am-container">
	    	<h1 class="am-topbar-brand">
	     		<a href="#">Home</a>
	    	</h1>
	    	<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-secondary am-show-sm-only" data-am-collapse="{target: '#collapse-head'}">
	            <span class="am-sr-only">导航切换</span>
	            <span class="am-icon-bars"></span>
			</button>
	   	 	<div class="am-collapse am-topbar-collapse" id="collapse-head">
	      		<ul class="am-nav am-nav-pills am-topbar-nav">
	        		<li><a href="index">首页</a></li>
	        		<li><a href="book">Book</a></li>
	        		<li><a href="music">音乐</a></li>
	        		<li><a href="message">留言板</a></li>
	        		<li><a href="contact">Contact</a></li>
	      		</ul>
	      		<#if account??>
	      			<div class="am-topbar-right">
		        		<small>欢迎，${account.email!?string} </small><button class="am-btn am-btn-primary am-topbar-btn am-btn-sm" onclick="logout();">注销</button>
		      		</div>
		      	<#else>
		      		<div class="am-topbar-right">
		        		<button onclick="javascript:location.href='register'" class="am-btn am-btn-secondary am-topbar-btn am-btn-sm"><span class="am-icon-pencil"></span> 注册</button>
		      		</div>
			      	<div class="am-topbar-right">
			        	<button onclick="javascript:location.href='login'" class="am-btn am-btn-primary am-topbar-btn am-btn-sm"><span class="am-icon-user"></span> 登录</button>
			      	</div>
	      		</#if>
	    	</div>
	  	</div>
	</header>
	<#nested>
</body>
</html>
<script>
	$(function() {
	    var targetAnchor;
	    $.each($('ul.am-nav li a'), function() {
	        //console.log(this.href);
	        if (window.location.href === this.href) {
	            targetAnchor = this;
	            return false;
	        }
	    });
	    var parent = $(targetAnchor).closest('li');
	    parent.addClass('am-active');
	    $(targetAnchor).attr('href', '#');
	});
	
	function logout(){
		$.post("logout",{},function(data){
			if(data.status == "success"){
				window.location.reload();
			}
		});
	}
</script>

<!-- 多说公共JS代码 start (一个网页只需插入一次) -->
<script type="text/javascript">
	var duoshuoQuery = {short_name:"book-abc"};
	(function() {
		var ds = document.createElement('script');
		ds.type = 'text/javascript';ds.async = true;
		ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
		ds.charset = 'UTF-8';
		(document.getElementsByTagName('head')[0] 
		 || document.getElementsByTagName('body')[0]).appendChild(ds);
	})();
</script>
<!-- 多说公共JS代码 end -->
</#macro>