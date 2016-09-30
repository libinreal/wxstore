<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" /><meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta name="format-detection" content="telephone=no"/>
<title><?php echo ($metaTitle); ?></title>
<script src="<?php echo ($staticFilePath); ?>/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="<?php echo ($staticFilePath); ?>/js/jquery.lazyload.js" type="text/javascript"></script>
<script src="<?php echo ($staticFilePath); ?>/js/notification.js" type="text/javascript"></script>
<script src="<?php echo ($staticFilePath); ?>/js/swiper.min.js" type="text/javascript"></script>
<script src="<?php echo ($staticFilePath); ?>/js/main.js" type="text/javascript"></script>
<?php if(!empty($action_js)): ?><script src="<?php echo ($staticFilePath); ?>/js/<?php echo ($action_js); ?>.js" type="text/javascript"></script><?php endif; ?>
<link type="text/css" rel="stylesheet" href="<?php echo ($staticFilePath); ?>/css/style_touch.css">
<?php if(!empty($action_style)): ?><link type="text/css" rel="stylesheet" href="<?php echo ($staticFilePath); ?>/css/<?php echo ($action_style); ?>.css"><?php endif; ?>
<!-- link type="text/css" rel="stylesheet" href="/tpl/static/store/style/<?php echo ($productSet['headerid']); ?>}.css" -->
<script type="text/javascript">
$(document).ready(function(){
	$(".m-hd .cat").parent('div').click( function() {
	    var docH=$(document).height();
	  	$('.sub-menu-list').toggle();
	    $(".m-right-pop-bg2").addClass("on").css('min-height',docH);
	});
	$(".m-right-pop-bg2").click( function() {
	    $('.sub-menu-list').hide();
		$(".m-right-pop-bg2").removeClass("on").removeAttr("style");
	});
});
</script>



</head>

<body>
<div id="top"></div>
<div id="scnhtm5" class="m-body">
<div class="m-detail-mainout">



<div class="m-hd">
<div><a href="javascript:history.go(-1);" class="back">返回</a></div>
<div><a href="javascript:void(0);" class="cat">商品分类</a></div>
<div class="tit"><?php echo ($metaTitle); ?></div>
<div><a href="<?php echo U('Store/myinfo');?>" class="uc">用户中心</a></div>
<div><a href="<?php echo U('Store/cart');?>" class="cart">购物车<i class="cart_com"><?php if($totalProductCount != 0): echo ($totalProductCount); endif; ?></i></a></div>
</div>

<ul class="sub-menu-list">
<li><a href="<?php echo U('Store/select');?>">浏览店铺</a></li>
<li><a href="<?php echo U('Store/cats');?>">商城首页</a></li>
<?php if(is_array($cats)): $i = 0; $__LIST__ = $cats;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$hostlist): $mod = ($i % 2 );++$i; if($hostlist['isfinal'] == 1): ?><li><a href="<?php echo U('Store/products');?>"><?php echo ($hostlist["name"]); ?></a></li>
<?php else: ?>
<li><a href="<?php echo U('Store/cats');?>"><?php echo ($hostlist["name"]); ?></a></li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
</ul>


<form id="search_form" name="search_form" action="" method="post">
	<div class="m-l-search">
		<!-- input type="hidden" name="token" value="<?php echo ($token); ?>" /-->
		<input type="hidden" name="twid" value="<?php echo ($twid); ?>" />
		<input id="search_name" class="inp-search" name="search_name" type="search" value="<?php echo ($keyword); ?>" placeholder="输入关键字搜索" />
		<input class="btn-search" name="search-btn" type="submit" value="" />
	</div>
</form>

<div class="m-select c666 order_control">
<span><a href="javascript:" order="time" class="arrow-down">时间<i><em></em></i></a></span>
<span><a href="javascript:" order="salecount">销量<i><em></em></i></a></span>
<span><a href="javascript:" order="price">价格<i><em></em></i></a></span>
<span><a href="javascript:" order="discount">折扣<i><em></em></i></a></span>
<input type="hidden" id="view_list" value="">
<!-- <span class="filter"><a href="javascript:;" class="ary li">排列</a><a href="javascript:;" class="flt">筛选</a></span> -->
</div>
<style type="text/css">
	.m_recommend {
		position: relative;
		width:630px;
		height:123px;
		line-height: 1.5;
	}
	.m_recommend a img {
    width: 90px;
    height: 90px;
	}
	.m_recommend h5, .tabs h5{
		font-size: 15px;
	    text-align: left;
	    margin-left: 10px;
	    display: block;
	    height: 22px;
	    font-weight: 700;
	}
	.m_recommend .small-rect{
		position: absolute;
		top: 3px;
		left: 0;
		width: 5px;
		height: 17px;
		background-color: #fe7e01;
	}
	.menu-tab {
	    margin-top: 1px;
	    height: 22px;
	    border-bottom: 2px solid #f40;
	    line-height: 1.5;
	}
</style>
<?php if(!empty($recommands)): ?><div class="m_recommend">
	<h5>猜您喜欢</h5>
	<div class="small-rect"></div>
	<div class="als-container" id="demo3">
		<?php if(count($recommands) > 5): ?><span class="als-prev">
			<img src="<?php echo ($staticFilePath); ?>/images/thin_left_arrow_333.png" alt="prev" title="previous" />
		</span><?php endif; ?>
		<div class="als-viewport">
		  <ul class="als-wrapper">
		  	<?php if(is_array($recommands)): $i = 0; $__LIST__ = $recommands;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$recommandlist): $mod = ($i % 2 );++$i;?><li class="als-item">
		   	<a href="<?php echo U('Store/bdproduct',array('id' => $recommandlist['goods_id']));?>" target="blank"><img src="<?php echo ($recommandlist["logourl"]); ?>"/></a>
		   </li><?php endforeach; endif; else: echo "" ;endif; ?>
		  </ul>
	  	</div>
	  	<?php if(count($recommands) > 5): ?><span class="als-next">
	  		<img src="<?php echo ($staticFilePath); ?>/images/thin_right_arrow_333.png" alt="next" title="next" />
	  	</span><?php endif; ?>
	</div>
<!--
<?php if(is_array($recommands)): $i = 0; $__LIST__ = $recommands;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$recommandlist): $mod = ($i % 2 );++$i;?><span>
		<a href="javascript:">
			<img src="<?php echo ($recommandlist["logourl"]); ?>" data-original="<?php echo ($recommandlist["logourl"]); ?>">
		</a>
	</span><?php endforeach; endif; else: echo "" ;endif; ?>
-->
</div><?php endif; ?>

<!-- title -->
<div class="tab-title">
	<div class="menu-tab">
		<ul class="m-tabs">
			<li class="tabs">
				<h5>所有商品</h5>
			</li>
		</ul>
	</div>
</div>

<ul id="m_list" class="m-list ">
<?php if(is_array($products)): $i = 0; $__LIST__ = $products;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$hostlist): $mod = ($i % 2 );++$i;?><li>
		<span class="pic">
			<a href="<?php echo U('Store/bdproduct',array('id' => $hostlist['id']));?>">
			<img src="<?php echo ($hostlist["logourl"]); ?>" data-original="<?php echo ($hostlist["logourl"]); ?>">
		</a>
		</span>
		<span class="con">
			<a class="t" href="<?php echo U('Store/bdproduct',array('id' => $hostlist['id']));?>"><?php echo ($hostlist["name"]); ?></a>
			<b>￥<?php echo ($hostlist["price"]); ?></b><del>￥<?php echo ($hostlist["oprice"]); ?></del>
			<span style="color:#999;font-size:8px;margin-top:15px;"><?php echo ($hostlist['salecount'] + $hostlist['fakemembercount']); ?>人付款</span>
		</span>
	</li><?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<a class="more" id="show_more" page="2" style="display: none;" href="javascript:void(0);">加载更多</a>
<input type="hidden" value="1" id="pageid" />
<input type="hidden" id="canScroll" value="1" />
<script type="text/javascript">
$(function() {
	$('#search_form').submit(function() {
		var search_name = $('#search_name').val();
		if (search_name == '') {
			return false;
		}
	});
	var keyword = '<?php echo ($keyword); ?>';
	//点击排序
	var base_url = '<?php echo U('Store/bdproducts');?>';
	var b_url = '<?php if($isSearch != 1): echo U('Store/ajaxProducts'); else: echo U('Store/ajaxProducts'); endif; ?>'
		method = 'DESC',
		_get_method = '<?php echo ($method); ?>',
		order = '<?php echo ($order); ?>',
		_get_order  = '';
	if (_get_order != '') {
		order = _get_order;
	}
	$('.order_control a').removeClass('arrow-down');
	if (_get_method == 'DESC')  {
		method = 'ASC';
		$('.order_control a[order="' + order + '"]').addClass('arrow-up');
	} else {
		$('.order_control a[order="' + order + '"]').addClass('arrow-down');
	}
	$('.order_control a').click(function() {
		var order = $(this).attr('order');
		var url = base_url + '&order=' + order+'&method='+method+'&keyword='+keyword;
		location.href = url;
	});

	/*---------------------加载更多--------------------*/
	var total = <?php echo ($count); ?>,
		pagesize = 8,
		pages = Math.ceil(total / pagesize);
	var com_link = '<?php echo U('Store/bdproduct');?>';
	var label_arr = ["\u8bf7\u9009\u62e9\u6807\u7b7e","\u70ed\u5356","\u7206\u6b3e"];
	if (pages > 1) {
		var _page = $('#show_more').attr('page');
		$(window).bind("scroll",function() {
			if ($(document).scrollTop() + $(window).height() >= $(document).height()) {
				$('#show_more').show().html('加载中...');
				if (_page > pages) {
					$('#show_more').show().html('没有更多了').delay(2300).slideUp(1600);
					return;
				}
				if($('#canScroll').val()==0){//不要重复加载
					return;
				}
				$('#canScroll').attr('value',0);
				$.ajax({
					type : "GET",
					data : {'page' : _page, 'inajax' : 1, 'keyword' : keyword},
					url :  b_url + '&order=' + order + '&method=' + _get_method + '&pagesize='+pagesize,
					dataType : "json",
					success : function(RES) {
						$('#canScroll').attr('value',1);
						$('#show_more').hide().html('加载更多');
						data = RES.products;
						if(data.length){
							$('#show_more').attr('page',parseInt(_page)+1);
						}
						_page = $('#show_more').attr('page');
						var _tmp_html = '';
						$.each(data, function(x, y) {
							_tmp_html +=    '<li><span class="pic">' +
							'<a href="' + com_link + '&id=' + y.id + '">' +
							'<img src="' +y.logourl + '" />' +
							'</a></span><span class="con"><a class="t" href="' + com_link + '&id=' + y.id + '">' + y.name + '</a><b>￥'+ y.price +'&nbsp;</b><del>￥' + y.oprice + '</del>' +
							'<span style="color:#999;font-size:8px;margin-top:15px;">' + (parseInt(y.salecount) + parseInt(y.fakemembercount)) + '人付款</span></span></li>';
						});
						$('#m_list').append(_tmp_html);
					}
				});
			}
		});
	}
});
</script>
<script type="text/javascript">
window.shareData = {
            "moduleName":"Store",
            "moduleID":"<?php echo ($products[0]['id']); ?>",
            "imgUrl": "<?php echo ($products[0]['logourl']); ?>",
            "timeLineLink": "<?php echo ($f_siteUrl); echo U('Store/bdproducts');?>",
            "sendFriendLink": "<?php echo ($f_siteUrl); echo U('Store/bdproducts');?>",
            "weiboLink": "<?php echo ($f_siteUrl); echo U('Store/bdproducts');?>",
            "tTitle": "<?php echo ($metaTitle); ?>",
            "tContent": "<?php echo ($metaTitle); ?>"
        };

<?php if(count($recommands) > 5): ?>/************************图片滚动**********************/
$($('head')[0]).append("<script src='<?php echo ($staticFilePath); ?>/js/jquery.als-1.7.min.js' type='text/javascript'></"+"script>");
$("#demo3").als({
				visible_items: 5,
				scrolling_items: 1,
				orientation: "horizontal",
				circular: "yes",
				autoscroll: "yes",
				interval: 4000
});
<?php else: ?>
	$('.als-viewport').css('height', 98).css('width', 618);
	$('.als-wrapper').css('height', 98).css('width', 618);<?php endif; ?>
</script>
</body>
<?php echo ($shareScript); ?>
</html>