<?php
return array(
	'APP_STATUS'            => 'debug',
	'LOAD_EXT_CONFIG' 		=> 'db,info',
	'APP_GROUP_LIST'        => 'Home,System,User,Wap,Chat,Fuwu',
	'DEFAULT_GROUP'         => 'Home',  // 默认分组
    'DEFAULT_MODULE'        => 'Index', // 默认模块名称
    'DEFAULT_ACTION'        => 'index', // 默认操作名称
    /*Cookie配置*/
	'COOKIE_PATH'           => '/',     		// Cookie路径
    'COOKIE_PREFIX'         => '',      		// Cookie前缀 避免冲突
    /*模板命名规范*/
    'TMPL_FILE_DEPR'=>'_',
	'DEFAULT_THEME'=>'default',
    /*定义模版标签*/
	'TMPL_L_DELIM'   		=>'<!--{',			//模板引擎普通标签开始标记
	'TMPL_R_DELIM'			=>'}-->',				//模板引擎普通标签结束标记
	/*cookie*/
	'COOKIE_PREFIX'			=>'cms_bd_', // cookie 名称前缀
    'COOKIE_EXPIRE'			=>3600, // cookie 保存时间
    'COOKIE_PATH'			=>'/', // cookie 保存路径
    // 'COOKIE_DOMAIN'			=>'', // cookie 有效域名
    'SHOW_PAGE_TRACE' 		=>false,
);
?>