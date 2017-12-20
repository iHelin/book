<#import "frame.ftl" as main>
<@main.page title="音乐">
  <style>
    @media only screen and (min-width: 1200px) {
      .blog-g-fixed {
        max-width: 1200px;
      }
    }

    @media only screen and (min-width: 641px) {
      .blog-sidebar {
        font-size: 1.4rem;
      }
    }

    .blog-main {
      padding: 20px 0;
    }

    .blog-title {
      margin: 10px 0 20px 0;
    }

    .blog-meta {
      font-size: 14px;
      margin: 10px 0 20px 0;
      color: #222;
    }

    .blog-meta a {
      color: #27ae60;
    }

    .blog-pagination a {
      font-size: 1.4rem;
    }

    .blog-team li {
      padding: 4px;
    }

    .blog-team img {
      margin-bottom: 0;
    }

    .blog-content img,
    .blog-team img {
      max-width: 100%;
      height: auto;
    }

    .blog-footer {
      padding: 10px 0;
      text-align: center;
    }
</style>

<div class="am-g am-g-fixed blog-g-fixed">
	<div class="am-u-md-12">
		<article class="blog-main">
      		<div style="margin:0 auto;text-align:center;">
				<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width="530" height="450" src="http://music.163.com/outchain/player?type=0&amp;id=321809155&amp;auto=1&amp;height=430"></iframe>
			</div>
    	</article>
	</div>
</div>

<div class="am-g am-g-fixed blog-g-fixed">
	<div class="am-u-md-12">
    	<article class="blog-main">
            <div id="SOHUCS"></div>
		</article>
	</div>
</div>
</@main.page>
