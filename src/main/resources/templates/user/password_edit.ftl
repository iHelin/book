<#import "../frame.ftl" as main>
<@main.page title="密码修改">
<div class="am-g am-g-fixed blog-g-fixed">
	<div class="am-u-md-12">
		<div class="am-cf am-padding am-padding-bottom-0">
        	<div class="am-fl am-cf">
        		<strong class="am-text-primary am-text-lg">密码修改</strong>
        	</div>
      	</div>
      	<hr />
      	<div class="am-container">
			<div class="am-panel am-panel-secondary">
				<header class="am-panel-hd">
		    		<strong class="am-panel-title">密码修改</strong>
		  		</header>
			  	<div class="am-panel-bd am-text-center">
			  		<div class="am-g">
			  			<div class="am-u-md-7 am-u-md-offset-2">
					  		<form class="myform am-form am-form-horizontal" id="edit_psw_form" data-validate="parsley">
						  		<input type="hidden" name="id" value="${account.id!}">
						  		<div class="am-form-group">
						    		<label for="real_name" class="am-u-sm-4 am-form-label">旧密码</label>
						    		<div class="am-u-sm-8">
						      			<input type="password" id="old_psw" name="oldPsw" placeholder="旧密码" value="" data-required="true">
						    		</div>
						  		</div>
						  		<div class="am-form-group">
						    		<label for="real_name" class="am-u-sm-4 am-form-label">新密码</label>
						    		<div class="am-u-sm-8">
						      			<input type="password" id="new_psw" name="newPsw" placeholder="新密码" value="" data-rangelength="[6,20]" data-required="true">
						    		</div>
						  		</div>
						  		<div class="am-form-group">
						    		<label for="real_name" class="am-u-sm-4 am-form-label">确认密码</label>
						    		<div class="am-u-sm-8">
						      			<input type="password" id="new_psw2" name="newPsw2" placeholder="确认密码" value="" data-equalto="#new_psw" data-rangelength="[6,20]" data-required="true">
						    		</div>
						  		</div>
						  		<div class="am-form-group">
						    		<button type="button" class="am-btn am-btn-primary" onclick="savePassword();">保存</button>
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
	function savePassword(){
		if ($('#edit_psw_form').parsley('validate')) {
			$.post("${request.contextPath}/user/change_password",$('#edit_psw_form').serialize(),function(data){
				if(data.status=='success'){
					layer.msg('密码修改成功！');
				}else if(data.error=='old_psw_error'){
					layer.msg('旧密码错误！');
				}else if(data.error=='account_id_null'){
					layer.msg('用户id为空！');
				}else if(data.error=='same_psw'){
					layer.msg('新旧密码重复！');
				}else{
					layer.msg('未知错误！');
				}
			});
		}
	}
</script>