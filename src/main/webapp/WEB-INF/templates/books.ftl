<#import "frame.ftl" as main>
<@main.page title="全部图书">
<style>
	.book-img img {
		width: auto;
		height:auto;
      	max-height: 180px;
      	max-width: 100%;
    }
    
    .book-img {
		display: block;
		margin-left: auto;
		margin-right: auto;
    }
</style>
<br />
<div class="am-container" style="">
	<div class="am-g am-g-fixed blog-g-fixed">
	<#import "admin/pagination.ftl" as pager />
    <#assign urlParam></#assign>
		<#if books??>
			<#list books as book>
				<#if book??>
					<a href="${request.contextPath}/book/${book.id!}" target="_blank">
					  	<div class="am-u-sm-3" style="float:left;">
					  		<div class="am-thumbnail" style="height:370px">
					  			<div class="book-img am-vertical-align-middle" >
					      			<img class="am-center" src="<#if book.img??>${book.img!}<#else>images/default.jpg</#if>" alt=""/>
					      		</div>
					      		<div class="am-thumbnail-caption">
					        		<p><strong>${book.bookName!}</strong></p>
					        		<#if book.isFreePostage?? && book.isFreePostage>
        								<span class="am-badge am-badge-danger am-fr">包邮</span>
        							</#if>
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
		<div class="am-u-sm-12" style="float:left;">
			<#assign currentUrl>books?${urlParam}</#assign>
			<@pager.pageul pagination=pagination url="${currentUrl}" />
		</div>
	</div>
</div>
</@main.page>