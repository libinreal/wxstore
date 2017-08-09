<?php
function get_goodsid_by_url( $goods_url ){
	// $goods_url = 'http://192.168.2.77:8062/index.php/Wap/Store/bdproduct/id/5';
	preg_match("/\/[\w|-]*id\/(\d+)/", $goods_url, $matches );
	return $matches[1];
}

function sort_by_score($a , $b){
	if( $a['score'] == $b['score'] )
		return 0;
	return ($a['score'] > $b['score']) ? -1 : 1;
}