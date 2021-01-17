<#import "frame.ftlh" as main>
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
	<br/>
	<div class="am-container" style="">

		<div class="am-g am-g-fixed blog-g-fixed">
			<#import "admin/pagination.ftlh" as pager />
			<#assign urlParam>type=<#if type??>${type}</#if>&bookName=<#if bookName??>${bookName}</#if>&</#assign>
			<div class="am-u-sm-12">
				<form class="am-form" action="books" class="form-horizontal" role="form">
					<div class="am-u-sm-12 am-u-md-3 am-fr">
						<div class="am-input-group am-input-group-sm">
							<input type="text" class="am-form-field" placeholder="书名" name="bookName"
								   value="${bookName!}"/>
							<span class="am-input-group-btn">
	            			<button class="am-btn am-btn-default" type="submit">搜索</button>
	          			</span>
						</div>
	        	</div>
	        	<div class="am-u-sm-12 am-u-md-3 am-fr">
	          		<div class="am-form-group">
				    	<select data-am-selected="{btnSize: 'sm'}" name="type">
				        	<option value=' '>所有类别</option>
				            <option value='1' <#if type?? && type==1>selected</#if>>小说</option>
							<option value='2' <#if type?? && type==2>selected</#if>>文学</option>
							<option value='3' <#if type?? && type==3>selected</#if>>艺术与摄影</option>
							<option value='4' <#if type?? && type==4>selected</#if>>传记</option>
							<option value='5' <#if type?? && type==5>selected</#if>>励志与成功</option>
							<option value='6' <#if type?? && type==6>selected</#if>>经济管理</option>
							<option value='7' <#if type?? && type==7>selected</#if>>计算机</option>
							<option value='8' <#if type?? && type==8>selected</#if>>少儿</option>
							<option value='9' <#if type?? && type==9>selected</#if>>时尚娱乐</option>
							<option value='10' <#if type?? && type==10>selected</#if>>法律</option>
							<option value='11' <#if type?? && type==11>selected</#if>>心理学</option>
							<option value='12' <#if type?? && type==12>selected</#if>>历史</option>
							<option value='13' <#if type?? && type==13>selected</#if>>政治与军事</option>
							<option value='14' <#if type?? && type==14>selected</#if>>哲学与宗教</option>
							<option value='15' <#if type?? && type==15>selected</#if>>社会科学</option>
							<option value='16' <#if type?? && type==16>selected</#if>>饮食</option>
							<option value='17' <#if type?? && type==17>selected</#if>>其他</option>
				         </select>
	          		</div>
	        	</div>
	        </form>
        </div>
		<#if books??>
			<#list books as book>
				<#if book??>
					<a href="${request.contextPath}/book/${book.id!}" target="_blank">
					  	<div class="am-u-sm-3" style="float:left;">
					  		<div class="am-thumbnail" style="height:330px">
					  			<div class="book-img am-vertical-align-middle" style="height:180px">
					      			<img class="am-center" src="${request.contextPath}${book.img!}" alt=""/>
					      		</div>
					      		<div class="am-thumbnail-caption">
					        		<p><strong>${book.bookName!}</strong></p>
					        		<#if book.isFreePostage?? && book.isFreePostage>
        								<span class="am-badge am-badge-danger am-fr">包邮</span>
        							</#if>
					        		<p>作者:${book.author!}</p>
					        		<p>原价:<del>${book.price!?string.currency}</del></p>
					        		<p><span style="font-size:20px;color:#ff4400"><strong>${book.promotionPrice!?string.currency}</strong></span></p>
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