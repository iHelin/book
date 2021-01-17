<#macro page title>
<!doctype html>
<html class="no-js fixed-layout">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<title>${title!} | 图书商城后台管理系统</title>
  	<meta name="description" content="图书商城后台管理系统">
  	<meta name="keywords" content="index">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta name="renderer" content="webkit">
  	<meta http-equiv="Cache-Control" content="no-siteapp" />
  	<meta name="apple-mobile-web-app-title" content="" />
  	<link rel="icon" type="image/png" href="${request.contextPath}/images/favicon.png">
  	<link rel="stylesheet" href="${request.contextPath}/css/amazeui.min.css"/>
  	<link rel="stylesheet" href="${request.contextPath}/plugins/amazeui/admin.css">
</head>
<body>
	<header class="am-topbar am-topbar-inverse admin-header">
  		<div class="am-topbar-brand">
    		<strong>图书商城</strong> <small>后台管理系统</small>
  		</div>
  		<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>
  		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    		<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      			<li class="am-dropdown" data-am-dropdown>
        			<a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          				<span class="am-icon-users"></span> ${admin.email!} <span class="am-icon-caret-down"></span>
        			</a>
	        		<ul class="am-dropdown-content">
	          			<li><a href="admin_edit"><span class="am-icon-user"></span> 资料</a></li>
	          			<li><a href="javascript:void(0);" onclick="logout();"><span class="am-icon-power-off"></span> 退出</a></li>
	        		</ul>
	      		</li>
      			<li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    		</ul>
  		</div>
	</header>
	
	<div class="am-cf admin-main">
	  	<!-- sidebar start -->
		<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
	    	<div class="am-offcanvas-bar admin-offcanvas-bar">
	      		<ul class="am-list admin-sidebar-list">
	        		<li><a href="index"><span class="am-icon-home"></span> 首页</a></li>
	        		<li class="admin-parent">
	          			<a class="am-cf" data-am-collapse="{target: '#collapse-nav'}">
	          				<span class="am-icon-file"></span> 商城管理 <span class="am-icon-angle-down am-fr am-margin-right"></span>
	          			</a>
	          			<ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
	            			<li><a href="books" class="am-cf"><span class="am-icon-check"></span> 图书管理</a></li>
	            			<li><a href="user_manage"><span class="am-icon-puzzle-piece"></span> 用户管理</a></li>
	            			<li><a href="order_manage"><span class="am-icon-th"></span> 订单管理</a></li>
	          			</ul>
	        		</li>
	        		<li><a href="admin_edit"><span class="am-icon-table"></span> 管理员资料</a></li>
	        		<li><a href="javascript:void(0);" onclick="logout();"><span class="am-icon-sign-out"></span> 注销</a></li>
	      		</ul>
	
	      		<div class="am-panel am-panel-default admin-sidebar-panel">
	        		<div class="am-panel-bd">
	          			<p><span class="am-icon-bookmark"></span> 公告</p>
	          			<p>细心在任何时候都不会是多余的。—— iHelin</p>
	        		</div>
	      		</div>
	    	</div>
		</div>
	  	<!-- sidebar end -->

	  	<!-- content start -->
	  		<#nested>
	  	<!-- content end -->
	</div>

	<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<script src="${request.contextPath}/js/jquery-2.2.1.min.js"></script>
	<script src="${request.contextPath}/js/amazeui.min.js"></script>
	<script src="${request.contextPath}/plugins/amazeui/app.js"></script>
	<script src="${request.contextPath}/plugins/layer/layer.js"></script>
	<script>
		function logout(){
			layer.confirm('确定要退出吗？', {
				btn: ['确定','取消'] //按钮
			}, function(){
				$.post("${request.contextPath}/admin/logout",{},function(data){
					if(data.status == "success"){
						window.location.href="${request.contextPath}/admin/login";
					}
				});
			}, function(){
				
			});
		}
	</script>
</body>
</html>
</#macro>