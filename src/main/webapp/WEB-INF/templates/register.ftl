<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
  	<title>注册 | Book</title>
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta name="format-detection" content="telephone=no">
  	<meta name="renderer" content="webkit">
  	<meta http-equiv="Cache-Control" content="no-siteapp"/>
  	<link rel="alternate icon" type="image/png" href="${request.contextPath}/images/favicon.png">
  	<link rel="stylesheet" href="${request.contextPath}/css/amazeui.min.css"/>
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
    
    .footer p {
      color: #7f8c8d;
      margin: 0;
      padding: 15px 0;
      text-align: center;
      background: #2d3e50;
    }
    
    #vld-tooltip {
    position: absolute;
    z-index: 1000;
    padding: 5px 10px;
    background: #F37B1D;
    min-width: 150px;
    color: #fff;
    transition: all 0.15s;
    box-shadow: 0 0 5px rgba(0,0,0,.15);
    display: none;
  }

  #vld-tooltip:before {
    position: absolute;
    top: -8px;
    left: 50%;
    width: 0;
    height: 0;
    margin-left: -8px;
    content: "";
    border-width: 0 8px 8px;
    border-color: transparent transparent #F37B1D;
    border-style: none inset solid;
  }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>注册</h1>
  </div>
  <hr />
</div>
<div class="am-g">
	<div class="am-u-lg-4 am-u-md-6 am-u-sm-centered" style="height:442px">
	    <form method="post" class="am-form validate-form" id="register_form">
	    	<div class="am-form-group">
		      <label for="doc-vld-name-2-0">用户名：</label>
		      <input type="text" id="doc-vld-name-2-0" minlength="3"
		             placeholder="输入用户名（至少 3 个字符）" required/>
		    </div>
	    
	    
	    	<label for="email" />邮箱</label>
	      	<input type="email" name="" id="email" value="">
	      	<br />
	      	<label for="password">密码</label>
	      	<input type="password" name="" id="password" value="">
	     	 <br />
	      	<div class="am-cf">
	        	<input type="button" onclick="register()" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
	      	</div>
	    </form>
  	</div>
</div>
<footer class="footer">
	<p>© 2016 <a href="#">iHelin Inc.</a></p>
</footer>
</body>

<script src="${request.contextPath}/js/jquery-2.2.1.min.js"></script>
<script src="${request.contextPath}/js/amazeui.min.js"></script>
<script src="${request.contextPath}/js/parsley.min.js"></script>
<script src="${request.contextPath}/js/formvalidation.js"></script>
<script>
	$(function(){
		
		
	});
	
	function register(){
		if ($('#register_form').parsley('validate')) {
			alert("haha");
		}
	
	}
</script>
</html>