<#import "frame.ftl" as main>
<@main.page title="全部图书">
<style>
	
</style>
<br />
<div class="am-container" style="">
	<div class="am-g am-g-fixed blog-g-fixed">
		<#if books??>
			<#list books as book>
				<#if book??>
					<a href="${request.contextPath}/book_detail?id=${book.id!}" target="_blank">
					  	<div class="am-u-sm-3" style="float:left;">
					  		<div class="am-thumbnail" style="height:320px">
					      		<img src="images/BingWallpaper-2016-05-03.jpg" alt=""/>
					      		<div class="am-thumbnail-caption">
					        		<p><strong>${book.bookName!}</strong></p>
					        		<p>作者:${book.author!}</p>
					        		<p>原价:<del>${book.price!?string.currency}</del></p>
					        		<p><span style="font-size:20px;color:#ff4400"><strong>${book.promotionPrice!?string.currency}</strong></span></p>
					        		<p class="am-text-right">
					          			<button class="am-btn am-btn-primary am-btn-xs"><i class="am-icon-shopping-cart"></i></button>
					          			<button class="am-btn am-btn-default am-btn-xs"><i class="am-icon-money"></i></button>
					        		</p>
					      		</div>
					  		</div>
					  	</div>
				  	</a>
				</#if>
			</#list>
		</#if>
	</div>
</div>
</@main.page>