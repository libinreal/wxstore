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

<link href="<?php echo ($staticPath); ?>/tpl/static/store/css/eve.css" rel="stylesheet"/>
<link href="<?php echo ($staticPath); ?>/tpl/static/store/css/other.css" rel="stylesheet"/>

<div id="login" class="body account">
    <div class="wrapper">
        <div id="login-panel" class="panel" data-tab="normal">
            <div id="normal-panel" class="active-panel normal-panel">
                <form id="normal-login-form" action="<?php echo U('Store/login');?>" autocomplete="off" method="post">
                    <p><input id="username" class="input-common" type="text" placeholder="账号" name="username" value="" ></p>
                    <p><input id="password" class="input-common" type="password" placeholder="请输入您的密码" name="password" ></p>
					<button type="submit" class="btn-large btn-large mj-submit mj-submit">登录</button>
                </form>
            </div>
        </div>
    </div>
</div>
<p class="sub-action"><a href="<?php echo U('Store/register');?>">还没有账号，现在注册</a> <!-- <a href="">找回密码</a> --></p>
<div id="meituan_check" style="margin:0 0 55px 0"><br><br><br></div>
</body>
<script type="text/javascript">
window.shareData = {
            "moduleName":"Store",
            "moduleID":"",
            "imgUrl": "",
            "timeLineLink": "<?php echo ($f_siteUrl); echo U('Store/products');?>",
            "sendFriendLink": "<?php echo ($f_siteUrl); echo U('Store/products');?>",
            "weiboLink": "<?php echo ($f_siteUrl); echo U('Store/products');?>",
            "tTitle": "<?php echo ($metaTitle); ?>",
            "tContent": "<?php echo ($metaTitle); ?>"
        };
</script>
<?php echo ($shareScript); ?>
</html>