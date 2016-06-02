<#import "../frame.ftl" as main>
<@main.page title="支付">
<div class="am-g am-g-fixed book-g-fixed">
	<div class="am-u-md-12">
		<div class="am-text-center">
			<img src="${request.contextPath}/images/pay/pay.jpg" alt="扫一扫支付" class=""  style="max-height:600px;" />
		</div>
		<div class="am-text-center">
			<button class="am-btn am-btn-xl" style="margin-top: -240px;" onclick="pay(#{oid!});">支付</button>
		</div>
	</div>
</div>
</@main.page>
<script>
function pay(oid){
	var index = layer.load(2, {
		shade: [0.3, '#000']
	});
	$.post('payed',{oid,oid},function(data){
		layer.close(index);
		if(data.status == 'success'){
			window.location.href="${request.contextPath}/user/pay_success";
		}else{
			layer.msg('未知错误！');
		}
	});
}
</script>