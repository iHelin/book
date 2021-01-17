<#import "../frame.ftl" as main>
<@main.page title="我的订单">
<div class="am-container">
	<div class="am-g am-g-fixed blog-g-fixed">
		<div class="am-cf am-padding am-padding-bottom-0">
        	<div class="am-fl am-cf">
        		<strong class="am-text-primary am-text-lg">我的订单</strong>
        	</div>
      	</div>
      	<hr />
      	<div class="am-container">
			<div class="am-panel am-panel-default">
				<header class="am-panel-hd">
		    		<strong class="am-panel-title">我的订单</strong>
		  		</header>
			  	<div class="am-panel-bd">
			    	<table class="am-table am-table-striped am-table-hover table-main">
	              		<thead>
	              			<tr>
		                		<th class="table-check am-text-center"><input type="checkbox" /></th>
						        <th class="table-id am-text-center">ID</th>
						        <th class="am-text-center">商品详情</th>
						        <th class="am-text-center">状态</th>
						        <th class="am-text-center">总价</th>
						        <th class="am-text-center">支付时间</th>
						        <th class="table-date am-text-center">创建日期</th>
						        <th class="table-set am-text-center">操作</th>
		              		</tr>
	              		</thead>
	              		<tbody class="am-text-center">
	              			<#if opgs??>
	              				<#list opgs as order>
	              					<#if order??>
				              			<tr <#if order.status?? && order.status==1>class="am-warning"<#elseif order.status?? && order.status==2>class="am-success"</#if>>
											<td><input type="checkbox" /></td>
											<td><span class="am-badge am-badge-primary am-radius">${order.id!}</span></td>
											<td>
												<#if orderItems??>
													<#list orderItems as oitem>
														<#if order.orderIds?contains(oitem.id?c)>
															${oitem.bookName}
															<small>${oitem.bookPrice?string.currency} x ${oitem.number}本</small>
														</#if>
													</#list>
												</#if>
											</td>
											<td>
												<#if order.status??>
													<#if order.status==1>
														<span class="am-badge am-badge-warning am-radius">未支付</span>
													<#elseif order.status==2>
														<span class="am-badge am-badge-success am-radius">已支付</span>
													</#if>
												</#if>
											</td>
											<td>${order.totalMoney?string.currency}</td>
											<td>
												<#if order.payTime??>
													${order.payTime?string("yyyy-MM-dd HH:mm:ss")}
												<#else>
													未支付
												</#if>
											</td>
											<td>
												<#if order.createTime??>
													${order.createTime?string("yyyy-MM-dd")}
												</#if>
											</td>
											<td>
										    	<div class="am-btn-toolbar">
										    		<div class="am-btn-group am-btn-group-xs">
										    			<#if order.status??>
															<#if order.status==1>
                                                                <button type="button"
                                                                        class="am-btn am-btn-default am-btn-xs am-text-secondary"
                                                                        onclick="location.href='${request.contextPath}/user/pay?oid=#{order.id!}'">
                                                                    <span class="am-icon-pencil-square-o"></span> 去支付
                                                                </button>
                                                            </#if>
														</#if>
											            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteOrder(#{order.id!})"><span class="am-icon-trash-o"></span> 删除</button>
										        	</div>
										        </div>
							                </td>
							        	</tr>
				        			</#if>
              					</#list>
              				</#if>
	              		</tbody>
			    	</table>
			  	</div>
			</div>
		</div>
	</div>
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
		$.post('delete_order',{id:id},function(data){
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