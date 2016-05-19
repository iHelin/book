<#import "frame.ftl" as main>
<@main.page title="首页">
<style>
    .get {
      background: #1E5B94;
      color: #fff;
      text-align: center;
      padding: 170px 0;
    }

    .get-title {
      font-size: 200%;
      border: 2px solid #fff;
      padding: 20px;
      display: inline-block;
    }

    .get-btn {
      background: #fff;
    }

    .footer p {
      color: #7f8c8d;
      margin: 0;
      padding: 15px 0;
      text-align: center;
      background: #2d3e50;
    }
    .am-container {
	  width: 980px !important;
	  max-width: none;
	}
</style>
<!--<a href="https://github.com/iHelin/iHelin">
	<img style="position: absolute; top: 0; right: 0; border: 0;z-index:1001" src="https://camo.githubusercontent.com/38ef81f8aca64bb9a64448d0d70f1308ef5341ab/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f6461726b626c75655f3132313632312e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png">
</a>-->
<div class="">
	<div class="am-slider am-slider-default" data-am-flexslider>
	  <ul class="am-slides">
	    <li><img src="images/BingWallpaper-2016-05-04.jpg" /></li>
	    <li><img src="images/BingWallpaper-2016-05-03.jpg" /></li>
	    <li><img src="images/BingWallpaper-2016-05-02.jpg" /></li>
	  </ul>
	</div>
</div>
<script>
	$(function() {
		$('#slider').flexslider({
			slideshowSpeed: 200,
			playText: 'Play',
			playAfterPaused:200,
			before: function(slider) {
			    if (slider._pausedTimer) {
			      window.clearTimeout(slider._pausedTimer);
			      slider._pausedTimer = null;
			    }
			  },
			  after: function(slider) {
			    var pauseTime = slider.vars.playAfterPaused;
			    if (pauseTime && !isNaN(pauseTime) && !slider.playing) {
			      if (!slider.manualPause && !slider.manualPlay && !slider.stopped) {
			        slider._pausedTimer = window.setTimeout(function() {
			          slider.play();
			        }, pauseTime);
			      }
			    }
			  }
		});
	});
</script>
</@main.page>
