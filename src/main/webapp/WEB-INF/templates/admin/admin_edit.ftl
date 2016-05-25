<#import "admin_frame.ftl" as main>
<@main.page title="管理员资料">
<div class="admin-content">
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
        	<div class="am-fl am-cf">
        		<strong class="am-text-primary am-text-lg">管理员资料</strong>
        	</div>
      	</div>
      	<hr />
      	<div class="am-container">
			<div class="am-panel am-panel-default">
			  	<div class="am-panel-bd">
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
					   		<div class="am-panel am-panel-default">
					        	<div class="am-panel-bd">
					            	<div class="am-g">
					            		<p class="am-u-md-12">头像</p>
					                	<div class="am-u-md-4">
					                  		<img class="am-img-circle am-img-thumbnail" src="http://s.amazeui.org/media/i/demos/bw-2014-06-19.jpg?imageView/1/w/200/h/200/q/80" alt=""/>
					                	</div>
					                	<div class="am-u-md-8">
					                  		<form class="am-form">
					                    		<div class="am-form-group">
					                     		 	<input type="file" id="user-pic">
					                      			<p class="am-form-help">请选择要上传的文件...</p>
					                      			<button type="button" class="am-btn am-btn-primary am-btn-xs">保存</button>
					                    		</div>
					                  		</form>
					                	</div>
					              	</div>
					        	</div>
					  		</div>
					        <div class="am-panel am-panel-default">
					        	<div class="am-panel-bd">
					            	<div class="user-info">
					                	<p>等级信息</p>
					                	<div class="am-progress am-progress-sm">
					                  		<div class="am-progress-bar" style="width: 60%"></div>
					                	</div>
					                	<p class="user-info-order">当前等级：<strong>LV8</strong> 活跃天数：<strong>587</strong> 距离下一级别：<strong>160</strong></p>
					          		</div>
					              	<div class="user-info">
					                	<p>信用信息</p>
					                	<div class="am-progress am-progress-sm">
					                  		<div class="am-progress-bar am-progress-bar-success" style="width: 80%"></div>
					                	</div>
					                	<p class="user-info-order">信用等级：正常当前 信用积分：<strong>80</strong></p>
					              	</div>
					      		</div>
							</div>
						</div>
					    <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
					    	<form class="am-form am-form-horizontal">
					        	<div class="am-form-group">
					            	<label for="user-name" class="am-u-sm-3 am-form-label">姓名</label>
					              	<div class="am-u-sm-9">
					                	<input type="text" id="user-name" placeholder="姓名">
					              	</div>
					      		</div>
					            <div class="am-form-group">
					              	<label for="user-email" class="am-u-sm-3 am-form-label">电子邮件</label>
					              	<div class="am-u-sm-9">
					                	<input type="email" id="user-email" placeholder="输入你的电子邮件">
					              	</div>
					            </div>
					            <div class="am-form-group">
					              	<label for="user-phone" class="am-u-sm-3 am-form-label">电话</label>
					              	<div class="am-u-sm-9">
					                	<input type="tel" id="user-phone" placeholder="输入你的电话号码">
					              	</div>
					            </div>
					            <div class="am-form-group">
					              	<label for="user-QQ" class="am-u-sm-3 am-form-label">QQ</label>
					              	<div class="am-u-sm-9">
					                	<input type="number" pattern="[0-9]*" id="user-QQ" placeholder="输入你的QQ号码">
					              	</div>
					            </div>
					            <div class="am-form-group">
					              	<label for="user-intro" class="am-u-sm-3 am-form-label">简介</label>
					              	<div class="am-u-sm-9">
					                	<textarea class="" rows="5" id="user-intro" placeholder="输入个人简介"></textarea>
					              	</div>
					            </div>
					            <div class="am-form-group">
					              	<div class="am-u-sm-9 am-u-sm-push-3">
					                	<button type="button" class="am-btn am-btn-primary">保存修改</button>
					              	</div>
					            </div>
					     	</form>
						</div>
					</div>
			  	</div>
			</div>
		</div>
	</div>
	<footer class="admin-content-footer">
      <hr />
      <p class="am-padding-left">© 2016 iHelin, Inc.</p>
    </footer>
</div>
</@main.page>