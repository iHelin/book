<#import "frame.ftl" as main>
<@main.page title="${book.bookName!}">
<style>
    @media only screen and (min-width: 1200px) {
      .book-g-fixed {
        max-width: 1200px;
      }
    }

	.book-detail img,
    .book-content img {
      max-width: 100%;
      height: auto;
    }
    
  </style>

<div class="am-g am-g-fixed book-g-fixed">
	<div class="am-u-md-9">
    	<div class="am-panel am-panel-default" style="margin-top:20px">
      		<div class="am-g book-content">
        		<div class="am-u-lg-5">
        			<div class="am-panel am-panel-default am-vertical-align" style="height:345px;width:345px">
        				<div class="am-vertical-align-middle" style="width:100%">
        					<img src="${book.img!}" class="am-center">
        				</div>
        			</div>
        		</div>
        		<div class="am-u-lg-7">
        			<div>
        				<#if book.isFreePostage?? && book.isFreePostage>
        					<span class="am-badge am-badge-danger am-fr">包邮</span>
        				</#if>
        				<h2>${book.bookName!}</h2>
        			</div>
        			<div>
        				<p class="am-text-warning">${book.promo!}</p>
        				<p>作者：${book.author!}</p>
        				<p>价格：<del><strong>${book.price!?string.currency}</strong></del></p>
        			</div>
        			<div>
        				<p>促销价：<span style="font-size:30px;color:#ff4400"><strong>${book.promotionPrice!?string.currency}</strong></span></p>
        			</div>
        			<div>
        				<p>
        					<div class="am-g">
        						<div class="am-u-sm-3" style="margin-top:10px;">
        							<span>数量(本)：</span>
        						</div>
							  	<div class="am-u-sm-4 am-fl" style="float:left;">
							    	<div class="am-input-group">
							      		<span class="am-input-group-btn">
        									<button class="am-btn am-btn-default am-btn-xs input-num-down" id="book_down_btn" type="button" onclick="count(this);"><span class="am-icon-minus"></span> </button>
      									</span>
							      		<input type="text" value="1" class="am-form-field am-text-center" id="book_count" data-step="1" data-max="${book.number!}" data-min="1" onkeyup='this.value=this.value.replace(/\D/gi,"")' readOnly>
							      		<span class="am-input-group-btn">
        									<button class="am-btn am-btn-default am-btn-xs input-num-up" id="book_up_btn" type="button" onclick="count(this);"><span class="am-icon-plus"></span> </button>
      									</span>
							    	</div>
							  	</div>
							</div>
     					</p>
        			</div>
        			<hr data-am-widget="divider" style="" class="am-divider am-divider-dotted" />
        			<div class="am-text-center">
        				<button class="am-btn am-btn-danger" style="margin-right: 40px;" onclick="go(#{book.id!})">立即购买</button>
        				<button class="am-btn am-btn-danger" onclick="addCart(#{book.id!})">加入购物车</button>
        			</div>
        		</div>
      		</div>
      		<hr />
      		<div class="am-g">
        		<div class="am-u-sm-12">
        			<div class="am-container">
						<div class="am-tabs" data-am-tabs="{noSwipe: 1}" style="margin-top:20px">
							<ul class="am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="javascript: void(0)">商品详情</a></li>
								<li><a href="javascript: void(0)">商品评价</a></li>
							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-active">
									<div class="book-detail">
										${book.detail!}
									</div>
								</div>
								<div class="am-tab-panel">
									<div class="ds-thread" data-thread-key="book_${book.id!}" data-title="${book.bookName!}" data-url="${request.contextPath}/book/${book.id!}"></div>
								</div>
							</div>
						</div>
          			</div>
        		</div>
      		</div>
    	</div>
    	<hr class="am-article-divider book-hr">
  	</div>
  	<div class="am-u-md-3">
  		<div class="am-g">
	  		<div class="am-u-md-4">
	  			<hr data-am-widget="divider" style="" class="am-divider am-divider-dotted" />
	  		</div>
	  		<div class="am-u-md-4">
	  			<small>看了又看</small>
	  		</div>
	  		<div class="am-u-md-4">
	  			<hr data-am-widget="divider" style="" class="am-divider am-divider-dotted" />
	  		</div>
  		</div>
  	</div>
</div>
</@main.page>
<script>
	function go(id){
		var accountId = $('#login-tag').val();
		var count = $('#book_count').val();
		if(count==null || count=="")
			count=1;
		if(accountId == null){
			layer.confirm('当前操作需要登录才能进行，是否前往登录？', {
				btn: ['确定','取消']
			}, function(){
				window.location.href="${request.contextPath}/login?from=book/"+id;
			});
		}else{
			window.location.href="${request.contextPath}/user/buy_now?id="+id+"&number="+count;
		}
	}
	
	function addCart(id){
		var accountId = $('#login-tag').val();
		if(accountId == null){
			layer.confirm('当前操作需要登录才能进行，是否前往登录？', {
				btn: ['确定','取消']
			}, function(){
				window.location.href="${request.contextPath}/login?from=book/"+id;
			});
		}else{
			layer.msg('开发中。。。');
		}
	}
	
	function count(e){
			var thisBtn = $(e);
            var countInput = $('#book_count');
            var currentValue = countInput.val();
            var step = countInput.attr('data-step') || 1;
            if (thisBtn.hasClass('input-num-up'))
            {
                var newValue = parseInt(parseFloat(currentValue) + parseFloat(step)),
                    maxValue = countInput.attr('data-max'),
                    downBtn = $('#book_down_btn');
                //若执行‘加’操作且‘减’按钮存在class='disabled'的话，则移除‘减’操作按钮的class 'disabled'
                downBtn.hasClass('am-disabled') && downBtn.removeClass('am-disabled');
                if (maxValue && newValue >= maxValue) {
                    newValue = maxValue;
                    thisBtn.addClass('am-disabled');
                }
            } else {
                var newValue = parseInt( parseFloat(currentValue) - parseFloat(step) ),
                    minValue = countInput.attr('data-min') || false,
                    upBtn = $('#book_up_btn');
                //若执行‘减’操作且‘加’按钮存在class='disabled'的话，则移除‘加’操作按钮的class 'disabled'
                upBtn.hasClass('am-disabled') && upBtn.removeClass('am-disabled');
                if (minValue && newValue <= minValue) {
                    newValue = minValue;
                    thisBtn.addClass('am-disabled');
                }
            }
            countInput.val( newValue );
        }
	
	$(function() {
		$('#book_up_btn').click();
        $('#book_down_btn').click();
    });
</script>