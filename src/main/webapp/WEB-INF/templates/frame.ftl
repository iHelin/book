<#macro page title>
<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
  	<title>${title!} | 图书商城</title>
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta name="format-detection" content="telephone=no">
  	<meta name="renderer" content="webkit">
  	<meta http-equiv="Cache-Control" content="no-siteapp"/>
  	<link rel="alternate icon" type="image/png" href="${request.contextPath}/images/favicon.png">
  	<link rel="stylesheet" href="${request.contextPath}/css/amazeui.min.css"/>
  	<link rel="stylesheet" href="${request.contextPath}/css/bootstrap.css"/>
</head>
<script src="${request.contextPath}/js/jquery-2.2.1.min.js"></script>
<script src="${request.contextPath}/js/amazeui.min.js"></script>
<script src="${request.contextPath}/plugins/layer/layer.js"></script>
<body>
	<header class="am-topbar am-topbar-fixed-top">
		<div class="am-container">
	    	<h1 class="am-topbar-brand">网上图书商城</h1>
	    	<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-secondary am-show-sm-only" data-am-collapse="{target: '#collapse-head'}">
	            <span class="am-sr-only">导航切换</span>
	            <span class="am-icon-bars"></span>
			</button>
	   	 	<div class="am-collapse am-topbar-collapse" id="collapse-head">
	      		<ul class="am-nav am-nav-pills am-topbar-nav">
	        		<li><a href="${request.contextPath}/index">首页</a></li>
	        		<li><a href="${request.contextPath}/books">Book</a></li>
	        		<li><a href="${request.contextPath}/music">音乐</a></li>
	        		<li><a href="${request.contextPath}/message">留言板</a></li>
	        		<li><a href="${request.contextPath}/contact">Contact</a></li>
	      		</ul>
	      		<#if account??>
	      			<div class="am-topbar-right">
		        		<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
			        		<li class="am-dropdown" data-am-dropdown>
				        		<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:void(0);">
				          			${account.email!?string} <span class="am-icon-caret-down"></span>
				        		</a>
				        		<ul class="am-dropdown-content">
				          			<li><a href="${request.contextPath}/user/user_info"><span class="am-icon-user"></span> 个人信息</a></li>
				          			<li><a href="${request.contextPath}/user/user_edit"><span class="am-icon-edit"></span> 资料设置</a></li>
				          			<li><a href="${request.contextPath}/user/password_edit"><span class="am-icon-cog"></span> 密码修改</a></li>
				          			<li><a href="javascript:void(0);" onclick="logout();"><span class="am-icon-sign-out"></span> 登出</a></li>
				        		</ul>
				        	</li>
			        	</ul>
		      		</div>
		      	<#else>
		      		<div class="am-topbar-right">
		        		<button onclick="javascript:location.href='${request.contextPath}/register'" class="am-btn am-btn-secondary am-topbar-btn am-btn-sm"><span class="am-icon-pencil"></span> 注册</button>
		      		</div>
			      	<div class="am-topbar-right">
			        	<button onclick="javascript:location.href='${request.contextPath}/login'" class="am-btn am-btn-primary am-topbar-btn am-btn-sm"><span class="am-icon-sign-in"></span> 登录</button>
			      	</div>
	      		</#if>
	    	</div>
	  	</div>
	</header>
	<#nested>
	<footer data-am-widget="footer" class="am-footer am-footer-default">
	<div class="am-footer-miscs ">
    	<p>由 <a href="http://weibo.com/378920717/" title="iHelin" target="_blank" class="">iHelin</a>提供技术支持</p>
        <p>CopyRight©2016  iHelin Inc.</p>
        <p></p>
    </div>
</footer>
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
	    $(targetAnchor).attr('href', 'javascript:void(0);');
	});
	
	function logout(){
		$.post("${request.contextPath}/logout",{},function(data){
			if(data.status == "success"){
				window.location.href="${request.contextPath}/index";
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