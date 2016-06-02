<!DOCTYPE html>
<html lang="zh-CN">
<head lang="en">
	<meta charset="UTF-8">
  	<title>登录 | Book</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta name="format-detection" content="telephone=no">
  	<meta name="renderer" content="webkit">
  	<meta http-equiv="Cache-Control" content="no-siteapp"/>
  	<link rel="alternate icon" type="image/png" href="${request.contextPath}/images/favicon.png">
  	<link rel="stylesheet" href="${request.contextPath}/css/bootstrap.css"/>
  	<style>
  		contentbox {
		    width: 600px;
		    background-color: #fff;
		    border-radius: 15px;
		    box-shadow: 0 4px 10px 0 #ddd;
		    height: 430px;
		    margin: 60px auto 0;
		    min-height: 430px;
		    position: relative;
		    text-align: center;
		}
  	</style>
</head>
<body>
<div class="container">
	<div class="">
		<h1 class="text-center">登录</h1>
	</div>
	<hr />
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<form class="myform form-horizontal" id="login_form">
				<div class="form-group">
					<label for="email_inp">账号</label>
				    <input type="text" class="form-control" id="email_inp" name="email" placeholder="用户名/邮箱" data-required="true" />
				</div>
				<div class="form-group">
					<label for="psw_inp">密码</label>
				    <input type="password" class="form-control" id="psw_inp" name="password" placeholder="密码" data-required="true" />
				</div>
				<div class="form-group text-center">
					<button type="button" class="btn btn-primary btn-lg" onclick="login()">登录</button>
				</div>
				<p class="pull-right"><span>没有账号？</span><a href="register">现在注册</a></p>
			</form>
	  	</div>
	</div>
	<hr />
	<div class="text-center">
	    <p>由 <a href="http://weibo.com/378920717/" title="iHelin" target="_blank" class="">iHelin</a>提供技术支持 CopyRight©2016  iHelin Inc.</p>
	</div>
</div>
</body>
<script src="${request.contextPath}/js/jquery-2.2.1.min.js"></script>
<script src="${request.contextPath}/js/bootstrap.js"></script>
<script src="${request.contextPath}/plugins/parsley/parsley.min.js"></script>
<script src="${request.contextPath}/js/formvalidation.js"></script>
<script src="${request.contextPath}/plugins/layer/layer.js"></script>
<script>
	var from = "${from!}";
	if(from==null || from==""){
		from = '${request.contextPath}/index';
	}
	$(function(){
		
	});
	
	function login(){
		if ($('#login_form').parsley('validate')) {
			var index = layer.load(2, {
		    	shade: [0.3, '#000']
		    });
			$.post("login.do",$('#login_form').serialize(),function(data){
				layer.close(index);
				if (data.status == "success") {
					layer.msg('登录成功');
					setTimeout(function(){
						window.location.href = from;
					},600);
		    	}else if(data.error == 'failed'){
		    		layer.msg('登录失败，请检查您的用户名或密码是否匹配。');
		    	}else if(data.error == 'empty'){
		    		layer.msg('登录失败，用户名不存在。');
		    	}
			});
		}
	}
</script>
</html>