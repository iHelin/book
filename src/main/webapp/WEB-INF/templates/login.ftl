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
			<form class="form-horizontal" id="login_form">
				<div class="form-group">
					<label for="email_inp">邮箱</label>
				    <input type="email" class="form-control" id="email_inp" name="email" placeholder="Email">
				</div>
				<div class="form-group">
					<label for="psw_inp">密码</label>
				    <input type="password" class="form-control" id="psw_inp" name="password" placeholder="Password">
				</div>
				<div class="form-group text-center">
					<button type="button" class="btn btn-primary btn-lg" onclick="login()">登录</button>
				</div>
				<p class="pull-right"><span>没有账号？</span><a href="register" >现在注册</a></p>
			</form>
	  	</div>
	</div>
	<hr />
	<p class="text-center bg-info">© 2016 <a href="#">iHelin</a>
	</p>
</div>
</body>

<script src="${request.contextPath}/js/jquery-2.2.1.min.js"></script>
<script src="${request.contextPath}/js/bootstrap.js"></script>
<script src="${request.contextPath}/plugins/parsley/parsley.min.js"></script>
<script src="${request.contextPath}/js/formvalidation.js"></script>
<script src="${request.contextPath}/plugins/layer/layer.js"></script>
<script>
	$(function(){
		
		
	});
	
	function login(){
		$.post("login.do",$('#login_form').serialize(),function(data){
			if (data.status == "success") {
				layer.msg('登录成功');
				setTimeout(function(){
					window.location.href = 'index';
				},2000);
	    	}else if(data.error == 'failed'){
	    		layer.msg('登录失败，请检查您的用户名或密码是否匹配。');
	    	}else if(data.error == 'empty'){
	    		layer.msg('登录失败，请检查您的用户名或密码是否填写正确。');
	    	}
		});
	}
</script>
</html>