<#import "admin_frame.ftl" as main>
<@main.page title="订单管理">
<div class="admin-content">
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
        	<div class="am-fl am-cf">
        		<strong class="am-text-primary am-text-lg">订单管理</strong>
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
      	</div>
      	<div class="am-g">
        	<div class="am-u-sm-12">
            	<table class="am-table am-table-striped am-table-hover table-main ">
              		<thead>
              			<tr>
	                		<th class="am-text-center"><input type="checkbox" /></th>
					        <th class="am-text-center">ID</th>
					        <th class="am-text-center">商品详情</th>
					        <th class="am-text-center">状态</th>
					        <th class="am-text-center">总价</th>
					        <th class="am-text-center">支付时间</th>
					        <th class="am-text-center">创建日期</th>
					        <th class="am-text-center">操作</th>
	              		</tr>
              		</thead>
              		<tbody class="am-text-center">
              			<#if orderGroups??>
              				<#list orderGroups as orderGroup>
              					<#if orderGroup??>
              						<tr class="am-text-center">
              							<td><input type="checkbox" /></td>
              							<td><span class="am-badge am-badge-primary am-radius">${orderGroup.id!}</span</td>
              							<td>
              								<#if subOrders??>
												<#list subOrders as subOrder>
													<#if orderGroup.orderIds?contains(subOrder.id?c)>
														${subOrder.bookName}
														<small>${subOrder.number}本 ${subOrder.bookPrice?string.currency}</small>
													</#if>
												</#list>
											</#if>
              							</td>
              							<td>
              								<#if orderGroup.status??>
												<#if orderGroup.status==1>
													<span class="am-badge am-badge-warning am-radius">未支付</span>
												<#elseif orderGroup.status==2>
													<span class="am-badge am-badge-success am-radius">已支付</span>
												</#if>
											</#if>
              							</td>
              							<td>${orderGroup.totalMoney?string.currency}</td>
              							<td>
											<#if orderGroup.payTime??>
												${orderGroup.payTime?string("yyyy-MM-dd HH:mm:ss")}
											<#else>
												未支付
											</#if>
										</td>
              							<td>
              								<#if orderGroup.createTime??>
												${orderGroup.createTime?string("yyyy-MM-dd")}
											</#if>
              							</td>
              							<td><button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteOrder(#{orderGroup.id!})"><span class="am-icon-trash-o"></span> 删除</button></td>
              						</tr>
              					</#if>
							</#list>
						</#if>
	              	</tbody>
            	</table>
            	<#import "pagination.ftl" as pager />
            	<#assign currentUrl>order_manage?</#assign>
				<@pager.pageul pagination=pagination url="${currentUrl}" />
        	</div>
      	</div>
    </div>

    <footer class="admin-content-footer">
      <hr>
      <p class="am-padding-left am-text-center">Copyright © iHelin.All Rights Reserved.皖ICP备16015099号</p>
    </footer>
</div>
</@main.page>
<script>
function deleteOrder(id){
	layer.confirm('确定要删除吗？', {
		btn: ['确定','取消'] //按钮
	}, function(){
		var index = layer.load(2, {
	    	shade: [0.3, '#000']
	    });
		$.post('${request.contextPath}/admin/delete_order',{id:id},function(data){
			layer.close(index);
			if(data.status == 'success'){
				window.location.reload();
			}else{
				layer.msg("未知错误！");
			}
		});
	}, function(){
		layer.msg('您取消了删除');
	});
}
</script>