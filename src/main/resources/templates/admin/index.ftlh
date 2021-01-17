<#import "admin_frame.ftlh" as main>
<@main.page title="首页">
<div class="admin-content">
    <div class="admin-content-body">
    	<div class="am-cf am-padding">
        	<div class="am-fl am-cf">
        		<strong class="am-text-primary am-text-lg">首页</strong> / <small>数据统计</small>
        	</div>
      	</div>
      	<ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
        	<li>
        		<a href="javascript:void(0);" class="am-text-success">
        			<span class="am-icon-btn am-icon-book"></span><br/>图书总计<br/>#{bookCount!}
        		</a>
        	</li>
        	<li>
        		<a href="javascript:void(0);" class="am-text-danger">
        			<span class="am-icon-btn am-icon-recycle"></span><br/>用户总计<br/>#{accountCount!}
        		</a>
        	</li>
        	<li>
        		<a href="javascript:void(0);" class="am-text-warning">
        			<span class="am-icon-btn am-icon-briefcase"></span><br/>成交订单<br/>#{opgList?size}
        		</a>
        	</li>
        	<li>
        		<a href="javascript:void(0);" class="am-text-secondary">
        			<span class="am-icon-btn am-icon-user-md"></span><br/>在线用户<br/>#{olCount!}
        		</a>
        	</li>
      	</ul>
    </div>
    <footer class="admin-content-footer">
    	<hr>
      	<p class="am-padding-left am-text-center">Copyright © iHelin.All Rights Reserved.皖ICP备16015099号</p>
    </footer>
</div>
</@main.page>