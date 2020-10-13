<#macro pageul pagination url extra...>
	<#if extra?size gt 0>
		<#if extra?keys?seq_contains("noCount")>
			<#assign noCount=extra['noCount'] />
		<#else>
			<#assign noCount="0" />
		</#if>
	<#else>
		<#assign noCount="0" />
	</#if>
	<div class="am-cf">
		<#if noCount=="0">
			<div class="am-fl">共 #{pagination.totalCount} 条记录，#{pagination.totalPageNum}页</div>
		</#if>
		<#if pagination.totalPageNum gt 0>
			<div class="am-fr">
				<ul class="am-pagination">
					<#if pagination.currentPage &gt; 1>
				  		<li><a href="${url}pageNum=1">&laquo;</a></li>
					<#else>
						<li class="am-disabled"><a href="#">&laquo;</a></li>
					</#if>
					<#if pagination.startPage &gt; 1>
						<li class="am-disabled"><span>...</span></li>
					</#if>
					<#list pagination.startPage..pagination.endPage as page>
						<#if page=pagination.currentPage>
							<li<#if page=pagination.currentPage> class="am-active"</#if>><a href="javascript:void(0);">#{page}</a></li>
						<#else>
							<li><a href="${url}pageNum=#{page}">#{page}</a></li>
						</#if>
					</#list>
					<#if pagination.endPage &lt; pagination.totalPageNum>
				  		<li class="am-disabled"><span>...</span></li>
					</#if>
					<#if pagination.currentPage &lt; pagination.totalPageNum>
				  		<li><a href="${url}pageNum=#{pagination.totalPageNum}">&raquo;</a></li>
					<#else>
						<li class="am-disabled"><a href="#">&raquo;</a></li>
					</#if>
				</ul>
			</div>
		</#if>
	</div>
</#macro>