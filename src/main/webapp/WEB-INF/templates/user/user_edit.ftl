<#import "../frame.ftl" as main>
<@main.page title="修改资料">

<div class="am-g am-g-fixed blog-g-fixed">
	<div class="am-u-md-12">
		<div class="am-cf am-padding am-padding-bottom-0">
        	<div class="am-fl am-cf">
        		<strong class="am-text-primary am-text-lg">修改资料</strong>
        	</div>
      	</div>
      	<hr />
      	<div class="am-container">
			<div class="am-panel am-panel-secondary">
				<header class="am-panel-hd">
		    		<strong class="am-panel-title">修改资料</strong>
		  		</header>
			  	<div class="am-panel-bd am-text-center">
			  		<div class="am-g">
			  			<div class="am-u-md-7 am-u-md-offset-2">
					  		<form class="myform am-form am-form-horizontal" id="edit_account_form" data-validate="parsley">
					  			<input type="hidden" name="id" value="${account.id!}">
					  			<div class="am-form-group">
						    		<label for="account_name" class="am-u-sm-4 am-form-label">用户名</label>
						    		<div class="am-u-sm-8">
						      			<input type="text" id="account_name" name="accountName" placeholder="输入你的用户名" value="${account.accountName!}" data-trigger="change" data-required="true" data-rangelength="[6,20]">
						    		</div>
						  		</div>
						  		<div class="am-form-group">
						    		<label for="real_name" class="am-u-sm-4 am-form-label">真实姓名</label>
						    		<div class="am-u-sm-8">
						      			<input type="text" id="real_name" name="realName" placeholder="输入你的真实姓名" value="${account.realName!}" data-rangelength="[1,10]">
						    		</div>
						  		</div>
						  		<div class="am-form-group">
						    		<label class="am-u-sm-4 am-form-label">性别</label>
						    		<div class="am-u-sm-8">
						      			<label class="am-radio-inline am-radio">
											<input type="radio"  value="true" name="gender" <#if (account.gender)?? && (account.gender)==true>checked="checked"</#if> /> 男
										</label>
									    <label class="am-radio-inline am-radio">
											<input type="radio" value="false" name="gender" <#if (account.gender)?? && (account.gender)==false>checked="checked"</#if> /> 女
									   	</label>
						    		</div>
						  		</div>
						  		<div class="am-form-group">
						    		<label for="doc-ipt-3" class="am-u-sm-4 am-form-label">出生日期</label>
						    		<div class="am-u-sm-8">
						    			<input type="text" class="am-form-field" id="account_birthday" name="birthday" placeholder="输入你的出生日期" <#if account.birthday??>value="${account.birthday?string("yyyy-MM-dd")}"</#if> data-am-datepicker />
						    		</div>
						  		</div>
						  		<div class="am-form-group">
						    		<label for="doc-ipt-3" class="am-u-sm-4 am-form-label">手机</label>
						    		<div class="am-u-sm-8">
						      			<input type="text" id="doc-ipt-3" name="phone" placeholder="输入你的手机号" value="${account.mobile!}" data-type="phone" data-required="true">
						    		</div>
						  		</div>
						  		<div class="am-form-group">
						    		<label for="doc-ipt-3" class="am-u-sm-4 am-form-label">邮箱</label>
						    		<div class="am-u-sm-8">
						      			<input type="email" id="doc-ipt-3" name="email" placeholder="输入你的邮箱号" value="${account.email!}">
						    		</div>
						  		</div>
						  		<div class="am-form-group">
						    		<button type="button" class="am-btn am-btn-primary" onclick="saveInfo();">保存</button>
						  		</div>
					  		</form>
				  		</div>
				  	</div>
			  	</div>
			</div>
		</div>
	</div>
</div>
</@main.page>
<script src="${request.contextPath}/js/formvalidation.js"></script>
<script src="${request.contextPath}/plugins/parsley/parsley.min.js"></script>
<script>
	function saveInfo(){
		if ($('#edit_account_form').parsley('validate')) {
			$.post("${request.contextPath}/user/change_account_info",$('#edit_account_form').serialize(),function(data){
				if(data.status=='success'){
					layer.msg('已保存！');
					window.location.reload();
				}
			});
		}
	}
</script>