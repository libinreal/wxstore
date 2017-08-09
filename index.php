<?php
define('APP_NAME', 'wxstore');
define('APP_PATH', './../wxstore/');
define('THINK_PATH', realpath('../tp31').'/');

define('DOCUMENT_ROOT', $_SERVER['DOCUMENT_ROOT']);

define('APP_DEBUG', true);

/*模板路径*/
define('TMPL_PATH', './Tpl/');

require THINK_PATH . 'ThinkPHP.php';
?>