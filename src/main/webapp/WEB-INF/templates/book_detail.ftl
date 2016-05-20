<#import "frame.ftl" as main>
<@main.page title="${book.bookName!}">
<style>
    @media only screen and (min-width: 1200px) {
      .book-g-fixed {
        max-width: 1200px;
      }
    }

    .book-main {
      padding: 20px 0;
    }

    .book-title {
      margin: 10px 0 20px 0;
    }

    .book-meta {
      font-size: 14px;
      margin: 10px 0 20px 0;
      color: #222;
    }

    .book-meta a {
      color: #27ae60;
    }

    .book-pagination a {
      font-size: 1.4rem;
    }

    .book-team li {
      padding: 4px;
    }

    .book-team img {
      margin-bottom: 0;
    }

	.book-detail img,
    .book-content img,
    .book-team img {
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
        				<div class="am-vertical-align-middle">
        					<img src="http://f.cl.ly/items/451O3X0g47320D203D1B/不夠活潑.jpg">
        				</div>
        			</div>
        		</div>
        		<div class="am-u-lg-7">
        			<div>
        				<h2>${book.bookName!}</h2>
        			</div>
        			<div>
        				<p>作者：${book.author!}</p>
        				<p>出版社：${book.press!}</p>
        				<p>库存：${book.number!}</p>
        				<p>价格：<del><strong>${book.price!?string.currency}</strong></del></p>
        			</div>
        			<div>
        				<p>促销价：<span style="font-size:30px;color:#ff4400"><strong>${book.promotionPrice!?string.currency}</strong></span></p>
        			</div>
        			<hr data-am-widget="divider" style="" class="am-divider am-divider-dotted" />
        			<div class="am-text-center">
        				<button class="am-btn am-btn-danger" style="margin-right: 40px;">立即购买</button>
        				<button class="am-btn am-btn-danger">加入购物车</button>
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
									<div class="ds-thread" data-thread-key="book_${book.id!}" data-title="${book.bookName!}" data-url="${request.contextPath}/book_detail?id=${book.id!}"></div>
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