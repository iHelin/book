<div class="modal fade" id="img_upd_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="width:700px">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">图片管理</h4>
      </div>
	  <div class="col-sm-2 pull-left" style="border:0px;margin-right:40px;margin-top:10px;width:300px">
		<span style="display:block-inline;color:#4F8EDC" id="upd_img_size_hint_span"></span>
      </div>
      <div class="col-sm-2 pull-right" style="border:0px;margin-right:40px;margin-top:10px">
	      <form action="" class="" style="padding:0px;" method="post" id="img_slt_upload_img_form">
				<span  id="img_span" class="btn btn-primary fileinput-button col-sm-offset-2" multiImg="false">
					<i class="fa fa-picture-o"></i>
					<span>上传图片...</span>
					<input type="file" id="img_slt_upload_inp" name="imgFile" multiple="" accept=".jpg,.jpeg,.png"/>
				</span>
	       </form>
       </div>
       <div class="col-sm-12" id="img_selector_list" style="overflow:auto;height:400px;margin:5px 0px 5px 0px;padding:10px 0px 10px 10px;border:1px solid #f2f2f2;border-right:0;border-left:0">
	      	
       </div>
       <div class="col-sm-12" id="uploading_process_div" style="display:none;height:400px;margin:50px 0px 0px 0px;position:absolute">
       		<div style="width:100%;margin-top:120px;text-align:center">
       		<span style="font-weight:bold;color:#4F8EDC">正在上传...</span>
       		<div class="progress active progress-striped" style="height:30px;width:30%;margin-top:10px;margin-left:auto;margin-right:auto;">
	         <div class="progress-bar progress-bar-info" style="height:30px;width: 100%"></div>
	       </div>
	       </div>
       </div>
      <div class="modal-footer" style="border:0px">
        <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
        <button type="button" class="btn btn-primary" id="" onclick="sltImgDone();">确定</button>
      </div>
    </div>
  </div>
</div>
<link rel="stylesheet" href="${request.contextPath}/css/jquery.fileupload-ui.css">
<script type="text/javascript">

var modalHasLoadedImg = false;
var currentDom;
var total = -1;
var img_list_offset = 0;
var list_max_index = 0;
var currentSltUrl = "";
var isSingleMode = true;
var create_img_count=0;
var slt_img_category;
var changeCallFunc;

$(function() {
	$("#img_slt_upload_inp").change(function(){
		upload_img(this);
	});
	$("#img_selector_list").scroll(function(){
	    var $this =$(this),
	    viewH =$(this).height(),//可见高度
	    contentH =$(this).get(0).scrollHeight,//内容高度
	    scrollTop =$(this).scrollTop();//滚动高度
	    if(contentH - viewH - scrollTop <= 40) {
		list_img(list_max_index, 20);
	}
	/*if(scrollTop/(contentH -viewH)>=0.9){}*/
	});
});

function list_img(start, size){
	if(start < list_max_index) return;
	if(total > 0 && list_max_index >= total) return;
	var last_list_max_index = list_max_index;
	list_max_index = list_max_index + size;
	$.getJSON("list_image.do?start=" + start + "&size=" + size + "&category=" + slt_img_category + "&nocache=" + new Date(),function(data) {
		if(data && data.state == "SUCCESS"){
			total = data.total;
			list_max_index = last_list_max_index + data.list.length;
			for(var i=0;i<data.list.length;i++){
				var imgObj = data.list[i];
				addImgToList("img_selector_list", imgObj.url, false);
			}
		}
	});
}

function initImgSlt(inpEleId, initContent, isMulti, isTdShow, changeCall){
	isTdShow = isTdShow ? true : false;
	if(isMulti){
		addShowHtml(inpEleId, true, isTdShow);
		if(initContent){
			addImgToMultiShow(inpEleId, initContent, $("#"+inpEleId).attr("name"));
		}
	}else{
		addShowHtml(inpEleId, false, isTdShow);
		if(initContent){
			$("#single_img_show_dbg_" + inpEleId).css("backgroundImage","url(" + initContent + ")");
			var $showdiv = $("#single_img_show_div_" + inpEleId);
			$showdiv.css("display","block");
			$("#"+inpEleId)[0].value = initContent;
		}
	}
	if(changeCall){
		changeCallFunc = changeCall;
	}
}

function getEleAttr(id, attrName){
	var $obj = $("#"+id);
	if(!$obj) return "";
	var rs = $obj.attr(attrName);
	return rs ? rs : "";
}

function addShowHtml(inpEleId, isMulti, isTdShow){
	if(isMulti){
		$("#" + inpEleId).after("<div class='col-sm-9' id='multi_img_show_div_" + inpEleId + "' ><div id='multi_img_show_items_" + inpEleId + "' class='col-sm-12' style='padding:0px'></div>" +
								"<span sizeHint='" + getEleAttr(inpEleId,"sizeHint") + "' category='" + getEleAttr(inpEleId,"category") + "' title='" + inpEleId + "' id='multi_img_select_span_" + inpEleId + "' class='btn btn-primary fileinput-button'><i class='fa fa-picture-o'></i><span>添加图片...</span></span><span style='color:#999999;display:block-inline;margin:0px 0px 0px 10px'>" + getEleAttr(inpEleId,"sizeHint") + "</span></div>" );
		$("#multi_img_select_span_" + inpEleId).click(function(){
			slt_img_category = $(this).attr("category");
			$("#upd_img_size_hint_span").text( $(this).attr("sizeHint"));
			isSingleMode = false;
			resetAndLoadImgList();
			currentDom = $("#" + this.title)[0];
			$("#img_upd_modal").modal({
				keyboard: false,
				backdrop: false
			});
		});
	}else{
		if(isTdShow){
			$("#" + inpEleId).after("<div style='padding:0px'><div id='single_img_show_div_" + inpEleId + "' style='display:none;padding:0px'>" + 
			"<div id='single_img_show_dbg_" + inpEleId + "' style='padding:0px;border:2px solid #f2f2f2;margin-bottom:5px;display:inline-block;overflow:hidden;height:75px;width:94px;background-repeat:no-repeat;background-size: 100% auto;background-position:center center;'>" +
					"<input type='button' name='" + inpEleId + "' class='btn btn-danger btn-xs' value='删除' style='position:absolute;top:50px;left:65px' onclick='clearSingleSlt(this.name);' />" +
					"</div></div>" + "<span sizeHint='" + getEleAttr(inpEleId,"sizeHint") + "' category='" + getEleAttr(inpEleId,"category") + "' title='" + inpEleId + "' id='single_img_select_span_" + inpEleId + "' class='btn btn-sm btn-primary fileinput-button' multiImg='false'>"+
									"<i class='fa fa-picture-o'></i><span>选择图片...</span></span>" + getEleAttr(inpEleId,"sizeHint") + "</span></div>");
		}else {
			$("#" + inpEleId).after("<div class='col-sm-9' ><div class='col-sm-12' id='single_img_show_div_" + inpEleId + "' style='display:none;padding:0px'>" + 
				"<div id='single_img_show_dbg_" + inpEleId + "' style='padding:0px;border:3px solid #f2f2f2;margin-top:10px;margin-bottom:10px;float:left;overflow:hidden;height:100px;width:100px;background-repeat:no-repeat;background-size: 100% auto;background-position:center center;'>" +
				"<input type='button' name='" + inpEleId + "' class='btn btn-danger btn-xs' value='删除' style='position:absolute;top:15px;left:53px' onclick='clearSingleSlt(this.name);' />" +
				"</div></div>" + "<span sizeHint='" + getEleAttr(inpEleId,"sizeHint") + "' category='" + getEleAttr(inpEleId,"category") + "' title='" + inpEleId + "' id='single_img_select_span_" + inpEleId + "' class='btn btn-primary fileinput-button' multiImg='false'>"+
								"<i class='fa fa-picture-o'></i><span>选择图片...</span></span><span style='color:#999999;display:block-inline;margin:0px 0px 0px 10px'>" + getEleAttr(inpEleId,"sizeHint") + "</span></div>");
		}

		$("#single_img_select_span_" + inpEleId).click(function(){
			isSingleMode = true;
			slt_img_category = $(this).attr("category");
			$("#upd_img_size_hint_span").text( $(this).attr("sizeHint"));
			resetAndLoadImgList();
			currentDom = $("#" + this.title)[0];
			$("#img_upd_modal").modal({
				keyboard: false,
				backdrop: false
			});
		});
	}
}

function clearSingleSlt(eleId){
	$("#" + eleId).val("");
	if(changeCallFunc){
		changeCallFunc($("#" + eleId), "");
	}
	$("#single_img_show_dbg_" + eleId).css("backgroundImage","");
	$("#single_img_show_div_" + eleId).css("display","none");
}

function resetAndLoadImgList(){
	$("#img_selector_list").html("");
	total = -1;
	img_list_offset = 0;
	list_max_index = 0;
	list_img(0, 20);
}

function sltImgDone(){
	if(isSingleMode){
		if(currentSltUrl){
			$("#single_img_show_dbg_" + currentDom.id).css("backgroundImage","url(" + currentSltUrl + ")");
			$("#single_img_show_div_" + currentDom.id).css("display","block");
			currentDom.value = currentSltUrl;
			if(changeCallFunc){
				changeCallFunc(currentDom, currentSltUrl);
			}
		}
	}else{
		var imgArr = new Array();
		$(".select_list_img_div[isSlt='yes']").each(function(index, ele){
			imgArr[index] = ele.title;
		});
		if(imgArr.length > 0){
			addImgToMultiShow(currentDom.id, imgArr, currentDom.name);
		}
	}
	$("#img_upd_modal").modal("hide");
}

function addImgToMultiShow(inpEleId, imgArr, inpName){
	if(imgArr){
		for(var i=0;i<imgArr.length;i++){
			var url = imgArr[i];
			<#--
			if(changeCallFunc)
				changeCallFunc($("#"+inpEleId)[0], url);
			//循环回调暂时不支持
			-->
			addImgToList("multi_img_show_items_" + inpEleId, url, true, inpName);
		}
		$("#multi_img_show_div_" + inpEleId).css("display","block");
	}
}

function upload_img(fileObj){
	if($(fileObj).val()){
		var updUrl = "upload_image.do?category=" + slt_img_category;
		$("#uploading_process_div").show();
		$('#img_slt_upload_img_form').ajaxSubmit({
	        type: 'post',
	        url: updUrl,
	        success: function(data){
	        $("#uploading_process_div").hide();
			data = data.replace(/<.?[Pp][Rr][Ee]>/g,""); /* ie8中的data字符串中会有<pre>标签包围，转json格式会失败*/
			var uploadInfo = eval('(' + data + ')');
			if(uploadInfo.state == "SUCCESS"){
				addNewImgToList(uploadInfo.url);
				++total;
				++list_max_index;
			}else {
				alert("上传失败：" + uploadInfo.message);
			}
			replaceFileUploadObj(fileObj);
	        },
	        error: function(){
	        	$("#uploading_process_div").hide();
	            alert( "连接错误");
	            replaceFileUploadObj(fileObj);
	        }
		});
	}
};

function addImgToList(elementId, url, isDeletable, inpName){
	var count = create_img_count++;
//	var img = $("<img style='display:block;width:100px;' src='" + url +"'/>");
	var div = $("<div class='select_list_img_div' title='" + url + "' isSlt='' id='show_div_" + count + 
				"' style='position:relative;border:3px solid #f2f2f2;margin-right:30px;margin-top:10px;margin-bottom:10px;float:left;overflow:hidden;height:100px;width:100px;" +
				"background-image:url(\"" + url + "\");background-repeat:no-repeat;background-size: 100% auto;background-position:center center;'>");

	if(isDeletable){
		var delButton = $("<input type='button' name='" + count + "' class='btn btn-danger btn-xs' value='删除' style='position:absolute;top:5px;left:53px'/>");
		$(delButton).click(function (){
			delImgInput(this.name);
		});
		$(div).append(delButton);
		
		var hiddenInput =$("<input type='hidden' id='img_select_hidden_inp_" + count + "' name='" + inpName + "' value='" + url + "'/>");
		$("#"+elementId).append(hiddenInput);
	}else{
		$(div).click(function(){
			if(isSingleMode){
				$(".select_list_img_div").css("border","3px solid #f2f2f2").attr("isSlt","");
			}
			if($(this).attr("isSlt")){
				$(this).attr("isSlt", "");
				$(this).css("border","3px solid #f2f2f2");
				currentSltUrl = ""
			}else{
				$(this).attr("isSlt", "yes");
				currentSltUrl = this.title;
				$(this).css("border","4px solid #8EB7E9");
			}
		});
	}
//	$(div).append(img);
	$("#"+elementId).append(div);
};

function addNewImgToList(url){
	var count = create_img_count++;
	var div = $("<div class='select_list_img_div' title='" + url + "' isSlt='' id='show_div_" + count + 
			"' style='position:relative;border:3px solid #f2f2f2;margin-right:30px;margin-top:10px;margin-bottom:10px;float:left;overflow:hidden;height:100px;width:100px;" +
			"background-image:url(\"" + url + "\");background-repeat:no-repeat;background-size: 100% auto;background-position:center center;'>");
	$(div).click(function(){
		if(isSingleMode){
			$(".select_list_img_div").css("border","3px solid #f2f2f2").attr("isSlt","");
		}
		if($(this).attr("isSlt")){
			$(this).attr("isSlt", "");
			$(this).css("border","3px solid #f2f2f2");
			currentSltUrl = ""
		}else{
			$(this).attr("isSlt", "yes");
			currentSltUrl = this.title;
			$(this).css("border","4px solid #8EB7E9");
		}
	});
	$("#img_selector_list").prepend(div);
}

function addInputAfterInput(name){
	var input = $("<input type='hidden' name='" + name + "'>");
}

function addInputToForm(){
	var input = $("<input type='hidden' name=''>");
	input = document.createElement("input");
	input.type = "hidden";
	input.name="images";
	input.id = "img_"+count++;
	input.value=url;
	$("#product_form").append(input);
}

function delImgInput(numId){
	$("#show_div_"+numId).remove();
	$("#img_select_hidden_inp_"+numId).remove();
};

function replaceFileUploadObj(fileObj){
	var inputFile = document.createElement("input"); 
	inputFile.type = 'file';
	inputFile.name = 'imgFile';
	inputFile.id = fileObj.id;
	inputFile.accept = ".jpg,.jpeg,.png";
	inputFile.onchange=function(){
		upload_img(this);
	}
	fileObj.parentNode.appendChild(inputFile);
	$(fileObj).remove();
};
</script>

<#-- 宏函数-start-->
<#macro imgTypeHint imgType>
<#if imgType??><#if imgType =="slide">建议尺寸：1000px * 400px<#elseif imgType=="icon">建议尺寸：100px * 100px<#elseif imgType=="intro-logo">建议尺寸：600px * 360px<#elseif imgType=="product">建议尺寸：430px * 430px<#elseif imgType=="activity">建议尺寸：选择高度大约为85px的图片<#elseif imgType=="logo">建议尺寸：165px * 75px<#elseif imgType=="shop">建议尺寸：450px * 450px<#else></#if></#if>
</#macro>
<#-- 宏函数-end---->