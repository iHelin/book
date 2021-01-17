<#import "admin_frame.ftlh" as main>
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
											<img class="am-img-circle am-img-thumbnail"
												 src="${request.contextPath}${admin.img!}"
												 onerror="this.src='${request.contextPath}/images/default/default_icon.jpg';"
												 alt=""/>
										</div>
										<div class="am-u-md-8">
											<p>推荐使用正方形图片。</p>
											<form class="am-form" id="myImg" action="${request.contextPath}/upload"
												  method="post" enctype="multipart/form-data">
												<div class="am-form-group">
													<input id="myfile" type="file" name="myfile" accept="image/*"/><br/>
													<button type="button" class="am-btn am-btn-primary am-btn-xs"
															onclick="commitImg();">保存
													</button>
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
					    	<form class="myform am-form am-form-horizontal" id="edit_admin_form">
					    		<input type="hidden" name="id" value="${admin.id!}">
					        	<div class="am-form-group">
					            	<label for="admin_name" class="am-u-sm-3 am-form-label">姓名</label>
					              	<div class="am-u-sm-9">
					                	<input type="text" id="admin_name" name="realName" placeholder="姓名" value="${admin.realName!}">
					              	</div>
					      		</div>
					            <div class="am-form-group">
					              	<label for="admin_email" class="am-u-sm-3 am-form-label">邮箱</label>
					              	<div class="am-u-sm-9">
					                	<input type="email" id="admin_email" name="email" placeholder="输入你的邮箱" value="${admin.email!}" data-required="true">
					              	</div>
					            </div>
					            <div class="am-form-group">
					              	<label for="admin_mobile" class="am-u-sm-3 am-form-label">电话</label>
					              	<div class="am-u-sm-9">
					                	<input type="text" id="admin_mobile" name="mobile" placeholder="输入你的电话号码" value="${admin.mobile!}">
					              	</div>
					            </div>
					            <div class="am-form-group">
					              	<label for="admin_QQ" class="am-u-sm-3 am-form-label">QQ</label>
					              	<div class="am-u-sm-9">
					                	<input type="text" id="admin_QQ" name="QQ" placeholder="输入你的QQ号码" value="${admin.QQ!}" data-type="number" data-rangelength="[5,10]">
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
					                	<button type="button" class="am-btn am-btn-primary" onclick="saveInfo()">保存修改</button>
					              	</div>
					            </div>
					     	</form>
						</div>
					</div>
			  	</div>
			</div>
		</div>
	</div>
	<hr />
	<footer class="admin-content-footer">
      <p class="am-padding-left am-text-center">Copyright © iHelin.All Rights Reserved.皖ICP备16015099号</p>
    </footer>
</div>
</@main.page>
<script src="${request.contextPath}/js/formvalidation.js"></script>
<script src="${request.contextPath}/plugins/parsley/parsley.min.js"></script>
<script>
	function saveInfo(){
		if ($('#edit_admin_form').parsley('validate')) {
			$.post("${request.contextPath}/admin/change_admin_info",$('#edit_admin_form').serialize(),function(data){
					if(data.status=='success'){
						layer.msg('已保存！');
						setTimeout(function(){
							window.location.reload();
						},500);
					}else if(data.error=='account_name_repeat'){
						layer.msg('用户名重复！');
					}else if(data.error=='account_id_null'){
						layer.msg('用户id为空！');
					}else{
						layer.msg('未知错误！');
					}
				});
			}
	}
	
	function commitImg(){
		$('#myImg').submit();
	}
</script>