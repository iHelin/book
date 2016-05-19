<!DOCTYPE html>
<html lang="zh-CN">
<head lang="en">
	<meta charset="UTF-8">
  	<title>注册 | Book</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta name="format-detection" content="telephone=no">
  	<meta name="renderer" content="webkit">
  	<link rel="alternate icon" type="image/png" href="${request.contextPath}/images/favicon.png">
  	<link rel="stylesheet" href="${request.contextPath}/css/bootstrap.css"/>
  	<style>
  	</style>
</head>
<body>
<div class="container">
	<div class="">
		<h1 class="text-center">注册</h1>
		<p class="text-right">已有账号？<a href="login">登录</a></p>
	</div>
	<hr />
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<form class="myform form-horizontal" id="register_form" data-validate="parsley">
				<div class="form-group">
					<label for="email_inp">邮箱</label>
				    <input type="email" class="form-control" id="email_inp" name="email" placeholder="请输入您的真实有效邮箱" data-trigger="change" data-required="true" data-type="email">
				</div>
				<div class="form-group">
					<label for="psw_inp">密码</label>
				    <input type="password" class="form-control" id="psw_inp" name="password" placeholder="密码" data-required="true" data-trigger="keyup" data-rangelength="[6,20]">
				</div>
				<div class="form-group">
					<label for="psw_inp2">确认密码</label>
				    <input type="password" class="form-control" id="psw_inp2" placeholder="确认密码" data-required="true" data-equalto="#psw_inp">
				</div>
				<div class="form-group text-center">
					<button type="button" class="btn btn-info btn-lg" onclick="register()">注册</button>
				</div>
			</form>
	  	</div>
	  	<div class="col-md-12">
	  		
	  	</div>
	</div>
	<hr />
	<p class="text-center bg-info">
		© 2016 <a href="#">iHelin</a>
	</p>
</div>

</body>

<script src="${request.contextPath}/js/jquery-2.2.1.min.js"></script>
<script src="${request.contextPath}/js/bootstrap.js"></script>
<script src="${request.contextPath}/js/formvalidation.js"></script>
<script src="${request.contextPath}/plugins/parsley/parsley.min.js"></script>
<script src="${request.contextPath}/plugins/layer/layer.js"></script>
<script>
	$(function(){
		console.log($('#register_form').parsley());
	});
	
	function register(){
		if ($('#register_form').parsley('validate')) {
			var index = layer.load(2, {
	            shade: [0.3, '#000']
	        });
			$.post("general_register",$('#register_form').serialize(),function(data){
				layer.close(index);
				if (data.status == "success") {
					/*layer.msg('注册成功！');
					setTimeout(function(){
						window.location.reload();
					},3000);*/
					layer.confirm('注册成功，请先完善您的资料', {
						btn: ['确定','取消'] //按钮
					}, function(){
						window.location.href="${request.contextPath}/user/user_edit";
					}, function(){
					  layer.msg('您取消了删除');
					});
	            }else if(data.error == "exist"){
	            	layer.msg('该邮箱已被注册！');
	            }else if(data.error == "blank"){
	            	layer.msg('邮箱和密码不能为空！');
	            }
			});
		}
	
	}
</script>
</html>