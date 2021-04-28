<#import "../frame.ftlh" as main>
<@main.page title="我的资料">
<div class="am-g am-g-fixed blog-g-fixed">
	<div class="am-u-md-12">
		<div class="am-cf am-padding am-padding-bottom-0">
        	<div class="am-fl am-cf">
        		<strong class="am-text-primary am-text-lg">我的资料</strong>
        	</div>
      	</div>
      	<hr />
      	<div class="am-container">
			<div class="am-panel am-panel-secondary">
				<header class="am-panel-hd">
		    		<strong class="am-panel-title">我的资料</strong>
		    		<a class="am-text-right" href="${request.contextPath}/user/user_edit"><i class="am-icon-edit"></i></a>
		  		</header>
			  	<div class="am-panel-bd am-text-center">
			    	<ul class="am-list am-list-static">
				  		<li><strong>用户名 </strong>${account.accountName!"未填"}</li>
				  		<li><strong>性别 </strong><#if account.gender??><#if account.gender>男<#else>女</#if><#else>未填</#if></li>
				  		<li><strong>真实姓名 </strong>${account.realName!"未填"}</li>
				  		<li><strong>出生日期 </strong><#if account.birthday??>${account.birthday?string("yyyy-MM-dd")}<#else>未填</#if></li>
				  		<li><strong>手机号 </strong>${account.mobile!"未填"}</li>
				  		<li><strong>邮箱 </strong>${account.email!"未填"}</li>
				  		<li><strong>QQ </strong>${account.QQ!"未填"}</li>
				  		<li><strong>注册日期 </strong>${account.registerDate?string("yyyy-MM-dd")}</li>
					</ul>
			  	</div>
			</div>
		</div>
	</div>
</div>
</@main.page>
