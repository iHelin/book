<#import "admin_frame.ftl" as main>
<@main.page title="用户管理">
<div class="admin-content">
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
        	<div class="am-fl am-cf">
        		<strong class="am-text-primary am-text-lg">用户管理</strong>
        	</div>
      	</div>
      	<hr />
      	<div class="am-g">
        	<div class="am-u-sm-12 am-u-md-6">
          		<div class="am-btn-toolbar">
            		<div class="am-btn-group am-btn-group-xs">
			            <button type="button" class="am-btn am-btn-default am-text-danger"><span class="am-icon-trash-o"></span> 删除</button>
			    	</div>
          		</div>
        	</div>
        	<#import "pagination.ftl" as pager />
            <#assign urlParam>accountType=<#if accountType??>${accountType}</#if>&</#assign>
          	<form class="am-form" action="user_manage" class="form-horizontal" role="form">
        		<div class="am-u-sm-12 am-u-md-3">
          			<div class="am-form-group">
			            <select data-am-selected="{btnSize: 'sm'}" id="account_type" name="accountType">
			              	<option value=' '>所有类别</option>
			              	<option value='0' <#if accountType?? && accountType==0>selected</#if>>普通用户</option>
			              	<option value='1' <#if accountType?? && accountType==1>selected</#if>>管理员</option>
			         	</select>
          			</div>
        		</div>
        		<div class="am-u-sm-12 am-u-md-3">
          			<div class="am-input-group am-input-group-sm">
            			<input type="text" class="am-form-field" placeholder="用户名" name="accountName" <#if accountName??>value="${accountName!}"</#if> />
          				<span class="am-input-group-btn">
            				<button class="am-btn am-btn-default" type="submit">搜索</button>
          				</span>
          			</div>
        		</div>
        	</form>
      	</div>
      	<div class="am-g">
        	<div class="am-u-sm-12">
            	<table class="am-table am-table-striped am-table-hover table-main ">
              		<thead>
              			<tr>
	                		<th class="table-check am-text-center"><input type="checkbox" /></th>
					        <th class="table-id am-text-center">ID</th>
					        <th class="table-title am-text-center">用户名</th>
					        <th class="table-author am-text-center">邮箱</th>
					        <th class="am-text-center">账号类型</th>
					        <th class="am-text-center">真实姓名</th>
					        <th class="am-text-center">性别</th>
					        <th class="table-date am-text-center">注册日期</th>
					        <th class="table-set am-text-center">操作</th>
	              		</tr>
              		</thead>
              		<tbody class="am-text-center">
              			<#if accounts??>
              				<#list accounts as account>
              					<#if account??>
			              			<tr>
								    	<td><input type="checkbox" /></td>
								        <td><span class="am-badge am-badge-primary am-radius">${account.id!}</span></td>
								        <td><span>${account.accountName!"未设置"}</span></td>
								        <td class="am-hide-sm-only">${account.email!"未设置"}</td>
								        <td class="am-hide-sm-only">
								        	<#if account.accountType==0>
								        		<span class="am-badge am-badge-secondary">普通用户</span>
								        	<#elseif account.accountType==1>
								        		<span class="am-badge am-badge-success">管理员</span>
								        	<#else>
								        		<span class="am-badge am-badge-warning">未知</span>
								        	</#if>
								        </td>
								        <td class="am-hide-sm-only">${account.realName!"未设置"}</td>
								        <td class="am-hide-sm-only"><#if account.gender??><#if account.gender>男<#else>女</#if><#else>未设置</#if></td>
								        <td class="am-hide-sm-only">${account.registerDate?string("yyyy-MM-dd")}</td>
								        <td>
							            	<div class="am-btn-toolbar">
							    				<div class="am-btn-group am-btn-group-xs">
								                    <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteAccount(#{account.id})"><span class="am-icon-trash-o"></span> 删除</button>
							        			</div>
							            	</div>
				                		</td>
				              		</tr>
	              				</#if>
              				</#list>
              			</#if>
	              	</tbody>
            	</table>
            	<#assign currentUrl>user_manage?${urlParam}</#assign>
				<@pager.pageul pagination=pagination url="${currentUrl}" />
        	</div>
      	</div>
    </div>

    <footer class="admin-content-footer">
      <hr />
      <p class="am-padding-left am-text-center">Copyright © iHelin.All Rights Reserved.皖ICP备16015099号</p>
    </footer>

</div>
</@main.page>
<script src="${request.contextPath}/js/formvalidation.js"></script>
<script src="${request.contextPath}/plugins/parsley/parsley.min.js"></script>
<script src="${request.contextPath}/plugins/layer/layer.js"></script>
<script>
	function deleteAccount(id){
		layer.confirm('确定要删除吗？', {
			btn: ['确定','取消'] //按钮
		}, function(){
			var index = layer.load(2, {
	            shade: [0.3, '#000']
	        });
			$.post('delete_account',{id:id},function(data){
				layer.close(index);
				if(data.status=='success'){
					window.location.reload();
				}else if(data.error=='id_is_null'){
					layer.msg('用户id为空，删除失败');
				}else{
					layer.msg('未知错误');
				}
			});
		}, function(){
		  layer.msg('您取消了删除');
		});
	}
</script>