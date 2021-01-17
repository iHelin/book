<#import "admin_frame.ftlh" as main>
<@main.page title="图书管理">
<link rel="stylesheet" type="text/css" href="${request.contextPath}/plugins/simditor/simditor.css" />
<style>
	.book-detail img {
		max-width: 100%;
      	height: auto;
    }
</style>
<div class="admin-content">
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
        	<div class="am-fl am-cf">
        		<strong class="am-text-primary am-text-lg">图书管理</strong>
        	</div>
      	</div>
		<hr/>
		<div class="am-g">
			<div class="am-u-sm-12 am-u-md-6">
				<div class="am-btn-toolbar">
					<div class="am-btn-group am-btn-group-xs">
						<button type="button" class="am-btn am-btn-default" onclick="addBookModal();"><span
									class="am-icon-plus"></span> 添加
						</button>
						<button type="button" class="am-btn am-btn-default am-text-danger"><span
									class="am-icon-trash-o"></span> 删除
						</button>
					</div>
				</div>
			</div>
			<#import "pagination.ftlh" as pager />
			<#assign urlParam>type=<#if type??>${type}</#if>&</#assign>
			<form class="am-form" action="books" class="form-horizontal" role="form">
				<div class="am-u-sm-12 am-u-md-3">
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
        		<div class="am-u-sm-12 am-u-md-3">
          			<div class="am-input-group am-input-group-sm">
            			<input type="text" class="am-form-field" placeholder="书名" name="bookName" value="${bookName!}" />
          				<span class="am-input-group-btn">
            				<button class="am-btn am-btn-default" type="submit">搜索</button>
          				</span>
          			</div>
        		</div>
        	</form>
      	</div>
      	<div class="am-g">
        	<div class="am-u-sm-12">
            	<table class="am-table am-table-striped am-table-hover table-main">
              		<thead>
              			<tr>
	                		<th class="table-check am-text-center"><input type="checkbox" /></th>
					        <th class="table-id am-text-center">ID</th>
					        <th class="table-title am-text-center">书名</th>
					        <th class="table-author am-text-center">作者</th>
					        <th class="am-text-center">库存</th>
					        <th class="am-text-center">原价</th>
					        <th class="am-text-center">折扣价</th>
					        <th class="table-date am-text-center">添加日期</th>
					        <th class="table-set am-text-center">操作</th>
	              		</tr>
              		</thead>
              		<tbody class="am-text-center">
              			<#if books??>
              				<#list books as book>
              					<#if book??>
			              			<tr>
								    	<td><input type="checkbox" /></td>
								        <td><span class="am-badge am-badge-primary am-radius">${book.id!}</span></td>
								        <td><a href="#">${book.bookName!}</a></td>
								        <td>${book.author!"未知"}</td>
								        <td>${book.number!}</td>
								        <td><del>${book.price!?string.currency}</del></td>
								        <td>${book.promotionPrice!?string.currency}</td>
								        <td>${book.createTime?string("yyyy-MM-dd HH:mm")}</td>
								        <td>
							            	<div class="am-btn-toolbar">
							    				<div class="am-btn-group am-btn-group-xs">
								                	<button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="editBook(#{book.id!})"><span class="am-icon-pencil-square-o"></span> 编辑</button>
								                	<button type="button" class="am-btn am-btn-default am-btn-xs am-text-warning" onclick="addImgModal(#{book.id!})"><span class="am-icon-images"></span> 图片</button>
								                    <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteBook(#{book.id!})"><span class="am-icon-trash-o"></span> 删除</button>
							        			</div>
							            	</div>
				                		</td>
				              		</tr>
	              				</#if>
              				</#list>
              			</#if>
	              	</tbody>
            	</table>
            	<#assign currentUrl>books?${urlParam}</#assign>
				<@pager.pageul pagination=pagination url="${currentUrl}" />
        	</div>
      	</div>
    </div>

    <footer class="admin-content-footer">
      <hr />
      <p class="am-padding-left am-text-center">Copyright © iHelin.All Rights Reserved.皖ICP备16015099号</p>
    </footer>

</div>
</@main.page>
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="add-book-modal">
		<div class="am-modal-dialog" style="min-width:700px">
	    	<div class="am-modal-hd">
	    		<strong class="am-text-xl" id="add_book_title">添加图书</strong>
	      		<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close><i class="am-icon-times"></i></a>
	    	</div>
	    	<hr />
	    	<div class="am-modal-bd">
	      		<form class="myform am-form am-form-horizontal" id="add_book_form" data-validate="parsley">
	      			<input type="hidden" id="book_id_inp" name="id" value="" />
					<div class="am-form-group">
				    	<label for="book-name" class="am-u-sm-2 am-form-label">图书名称</label>
				    	<div class="am-u-sm-10">
				      		<input type="text" id="book-name" name="bookName" placeholder="图书名称" required />
				    	</div>
				  	</div>
				  	<div class="am-form-group">
				    	<label for="book-promo" class="am-u-sm-2 am-form-label">描述信息</label>
				    	<div class="am-u-sm-10">
				      		<input type="text" id="book-promo" name="promo" placeholder="描述信息" />
				    	</div>
				  	</div>
				  	<div class="am-form-group">
				    	<label for="book-press" class="am-u-sm-2 am-form-label">出版社</label>
				    	<div class="am-u-sm-10">
				      		<input type="text" id="book-press" name="press" placeholder="出版社">
				    	</div>
				  	</div>
				  	<div class="am-form-group">
				    	<label for="book-author" class="am-u-sm-2 am-form-label">作者</label>
				    	<div class="am-u-sm-4">
				      		<input type="text" id="book-author" name="author" placeholder="作者" />
				    	</div>
				    	<label for="book-isbn" class="am-u-sm-2 am-form-label">ISBN</label>
				    	<div class="am-u-sm-4">
				      		<input type="text" id="book-isbn" name="isbn" placeholder="ISBN" data-type="number">
				    	</div>
				  	</div>
				  	<div class="am-form-group">
				    	<label for="book-type" class="am-u-sm-2 am-form-label">类别</label>
				    	<div class="am-u-sm-4">
				    		<select id="book-type" name="bookType" data-required="true">
				    			<option value="">选择分类</option>
				    			<option value="1">小说</option>
				    			<option value="2">文学</option>
				    			<option value="3">艺术与摄影</option>
				    			<option value="4">传记</option>
				    			<option value="5">励志与成功</option>
				    			<option value="6">经济管理</option>
				    			<option value="7">计算机</option>
				    			<option value="8">少儿</option>
				    			<option value="9">时尚娱乐</option>
				    			<option value="10">法律</option>
				    			<option value="11">心理学</option>
				    			<option value="12">历史</option>
				    			<option value="13">政治与军事</option>
				    			<option value="14">哲学与宗教</option>
				    			<option value="15">社会科学</option>
				    			<option value="16">饮食</option>
				    			<option value="17">其他</option>
				    		</select>
				    	</div>
				    	<label for="book-number" class="am-u-sm-2 am-form-label">库存数量</label>
				    	<div class="am-u-sm-4">
				      		<input type="text" id="book-number" name="number" placeholder="库存数量" required data-type="number">
				    	</div>
				  	</div>
				  	<div class="am-form-group">
				    	<label for="book-price" class="am-u-sm-2 am-form-label">原价</label>
				    	<div class="am-u-sm-4">
				      		<input type="text" id="book-price" name="price" placeholder="原价" required data-regexp="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$">
				    	</div>
				    	<label for="book-promotion-price" class="am-u-sm-2 am-form-label">促销价</label>
				    	<div class="am-u-sm-4">
				      		<input type="text" id="book-promotion-price" name="promotionPrice" placeholder="促销价" required data-regexp="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$">
				    	</div>
				  	</div>
				  	<div class="am-form-group">
				    	<label for="free-postage" class="am-u-sm-2 am-form-label">是否包邮</label>
				    	<div class="am-u-sm-4">
				      		<label class="am-checkbox am-checkbox-inline">
						    	<input type="checkbox" id="isfreepostage" value="1" name="postage" data-am-ucheck> 包邮
						  	</label>
				    	</div>
				    	<div class="am-u-sm-6"></div>
				  	</div>
				  	<div class="am-form-group">
				    	<label for="book-detail" class="am-u-sm-2 am-form-label">图书详情</label>
				    	<div class="am-u-sm-10 am-text-left book-detail">
				      		<textarea id="book-detail" name="detail" placeholder="图书详情"></textarea>
				    	</div>
				  	</div>
				</form>
	    	</div>
	    	<hr />
	    	<div class="">
				<div class="am-u-sm-10 am-u-sm-offset-5"  style="padding-bottom:12px;">
					<button type="button" class="am-btn am-btn-default" data-am-modal-close>取消</button>
					<button type="button" class="am-btn am-btn-primary" onclick="addBook()">提交</button>
				</div>
			</div>
	  	</div>
	</div>
	<div class="am-modal am-modal-no-btn" tabindex="-1" id="add-book-img-modal">
		<div class="am-modal-dialog" style="min-width:700px">
	    	<div class="am-modal-hd">
	    		<strong class="am-text-xl" id="add_img_title">添加图片</strong>
	      		<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close><i class="am-icon-times"></i></a>
	    	</div>
	    	<hr />
	    	<div class="am-modal-bd" style="height: 200px">
	      		<div class="am-form-group">
					<label for="book-name" class="am-u-sm-2 am-form-label">图片</label>
				   	<div class="am-u-sm-10">
				    	<div class="am-g">
					    	<div class="am-u-md-4">
					        	<img class="am-img-circle am-img-thumbnail" id="book_img_id" src="/" alt=""/>
					   		</div>
					        <div class="am-u-md-8">
					        	<form class="am-form" id="bookImg" action="${request.contextPath}/uploadBookImg" method="post" enctype="multipart/form-data">
					            	<div class="am-form-group">
					                	<input id="myfile" type="file" name="myfile" accept="image/*" />
					                </div>
					        	</form>
					        </div>
					    </div>
				    </div>
				</div>
	    	</div>
	    	<hr />
	    	<div class="">
				<div class="am-u-sm-10 am-u-sm-offset-5"  style="padding-bottom:12px;">
					<button type="button" class="am-btn am-btn-default" data-am-modal-close>取消</button>
					<button type="button" class="am-btn am-btn-primary" onclick="commitImg();">保存</button>
				</div>
			</div>
	  	</div>
	</div>
<script src="${request.contextPath}/js/formvalidation.js"></script>
<script src="${request.contextPath}/plugins/parsley/parsley.min.js"></script>
<script src="${request.contextPath}/plugins/layer/layer.js"></script>
<script type="text/javascript" src="${request.contextPath}/plugins/simditor/module.js"></script>
<script type="text/javascript" src="${request.contextPath}/plugins/simditor/hotkeys.js"></script>
<script type="text/javascript" src="${request.contextPath}/plugins/simditor/uploader.js"></script>
<script type="text/javascript" src="${request.contextPath}/plugins/simditor/simditor.js"></script>
<script>
	//编辑器
	var simditor;
	
	$(function(){
		simditor();
	});
	
	function simditor(){
		//编辑器初始化
	    simditor = new Simditor({
	        textarea: $('#book-detail'),
	        toolbar:['title','bold','fontScale','italic','link','underline','color','blockquote','image'],
	        upload: {
	            url: '${request.contextPath}/imgupload.do',
	            params: null,
	            fileKey: 'fileDataFileName',
	            connectionCount: 3,
	            leaveConfirm: '正在上传文件'
	        },
	        defaultImage: '${request.contextPath}/images/defaultimage.png',
	        pasteImage: true,
	        imageButton: ['upload']
	    });
	}

	function addImgModal(id){
		$('#add_img_title').text("添加图片");
		var index = layer.load(2, {
	    	shade: [0.3, '#000']
	    });
		$.post('${request.contextPath}/select_book_by_id',{id:id},function(data){
			layer.close(index);
			if(data.status=="success"){
				var src = data.book.img;
				$('#book_img_id').attr("src",src);
				$('#bookImg').attr("action","${request.contextPath}/uploadBookImg/"+id);
				$('#add-book-img-modal').modal('open');
			}
		});
		
	}
	
	function commitImg(){
		$('#bookImg').submit();
	}
	
	function addBookModal(){
		$('#add_book_form')[0].reset();
		$('#add_book_title').text("添加图书");
		$('#book-price').removeAttr('readonly');
		$('#book_id_inp').val('');
		$('#add-book-modal').modal('open');
	}
	
	function addBook(){
		if ($('#add_book_form').parsley('validate')) {
			var index = layer.load(2, {
	            shade: [0.3, '#000']
	        });
			var id = $('#book_id_inp').val();
			if(id==null || id==""){
				$.post('add_book_commit',$('#add_book_form').serialize(),function(data){
					layer.close(index);
					if(data.status='success'){
						window.location.reload();
					}else{
						layer.msg('未知错误');
					}
				});
			}else{
				$.post('edit_book_commit',$('#add_book_form').serialize(),function(data){
					layer.close(index);
					if(data.status='success'){
						window.location.reload();
					}else{
						layer.msg('未知错误');
					}
				});
			}
			
		}
	}
	
	function editBook(id){
		var index = layer.load(2, {
	    	shade: [0.3, '#000']
	    });
		$.post("selete_book",{id:id},function(data){
			layer.close(index);
			if(data.status=='success'){
				var book = data.book;
				$('#add_book_form')[0].reset();
				$('#book_id_inp').val(id);
				$('#book-name').val(book.bookName);
				$('#book-promo').val(book.promo);
				$('#book-author').val(book.author);
				$('#book-isbn').val(book.isbn);
				$('#book-press').val(book.press);
				$('#book-type').val(book.type);
				$('#book-number').val(book.number);
				$('#book-price').val(book.price.toFixed(2));
				$('#book-price').attr('readonly','true');
				$('#add_book_title').text("编辑图书");
				simditor.setValue(book.detail);//编辑器方式赋值
				if(book.isFreePostage)
					$('#isfreepostage').attr("checked",true);
				else
					$('#isfreepostage').attr("checked",false);
				$('#book-promotion-price').val(book.promotionPrice.toFixed(2));
				$('#add-book-modal').modal('open');
			}
		});
		
	}
	
	function deleteBook(id){
		layer.confirm('确定要删除吗？', {
			btn: ['确定','取消'] //按钮
		}, function(){
			var index = layer.load(2, {
	            shade: [0.3, '#000']
	        });
			$.post('delete_book',{id:id},function(data){
				layer.close(index);
				if(data.status=='success'){
					window.location.reload();
				}else if(data.error=='id_is_null'){
					layer.msg('图书编号为空，删除失败');
				}else{
					layer.msg('未知错误');
				}
			});
		}, function(){
		  layer.msg('您取消了删除');
		});
	}
	
</script>