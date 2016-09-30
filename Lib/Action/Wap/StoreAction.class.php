<?php
class StoreAction extends WapAction{
	//public $token;
	//public $wecha_id = '';
	public $product_model;
	public $product_cat_model;
	public $session_cart_name;
	public $_cid = 0;
	public $_set;
	public $_isgroup = 0;

	public $mainCompany = null;

	public $_twid = '';

	public $mytwid = '';

	private $randstr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

	public function _initialize()
	{
		/*
		parent::_initialize();
		$tpl = $this->wxuser;
		$tpl['color_id'] = intval($tpl['color_id']);
		$this->tpl = $tpl;
		$agent = $_SERVER['HTTP_USER_AGENT'];
		if (!strpos($agent, "MicroMessenger")) {
			//	echo '此功能只能在微信浏览器中使用';exit;
		}
		$this->assign('isFuwu', $this->isFuwu);
		$cid = isset($_REQUEST['cid']) ? intval($_REQUEST['cid']) : 0;
		if ($cid) {
			session("session_company_{$this->token}", $cid);
		}
		$this->_cid = session("session_company_{$this->token}");

		$this->session_cart_name = "session_cart_products_{$this->token}_{$this->_cid}";//'session_cart_products_' . $this->token;
		*/
		$this->product_model = M('Product');
		$this->product_cat_model = M('Product_cat');
		/*$this->mainCompany = M('Company')->where("`token`='{$this->token}' AND `isbranch`=0")->find();
		if (C('zhongshuai')) {
			$cid = $this->mainCompany['id'];
			$set = M("Product_setting")->where(array('token' => $this->token, 'cid' => $this->mainCompany['id']))->find();
			$this->_isgroup = isset($set['isgroup']) ? intval($set['isgroup']) : 0;
		}
		$twitter_set = null;
		if ($this->_cid) {
			$this->_set = M("Product_setting")->where(array('token' => $this->token, 'cid' => $this->_cid))->find();
			$this->assign('productSet', $this->_set);
			$cid = $this->_isgroup ? $this->mainCompany['id'] : $this->_cid;
			$cats = $this->product_cat_model->where(array('token' => $this->token, 'cid' => $cid, 'parentid' => 0))->order("sort ASC, id DESC")->select();
			$this->assign('cats', $cats);
			$twitter_set = M("Twitter_set")->where(array('token' => $this->token, 'cid' => $this->_cid))->find();
		} else {
			$this->_set = M("Product_setting")->where(array('token' => $this->token, 'cid' => $this->mainCompany['id']))->find();
			$this->assign('productSet', $this->_set);
		}


		$this->_twid = isset($_REQUEST['twid']) ? $_REQUEST['twid'] : '';//来自推广人的推广标示
		$this->mytwid = session('twid');//我自己的推广标示
		$login = session("login");
		if ($twitter_set && empty($this->wecha_id) && empty($this->mytwid) && empty($login) && !in_array(ACTION_NAME, array('register', 'login'))) {
			$callbackurl = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING'];
			session('callbackurl', $callbackurl);
			//点击链接时的推广记录
			session("login", 1);
			$this->redirect(U('Store/login', array('token' => $this->token, 'twid' => $this->_twid, 'rget' => 1)));
		}

		if (empty($this->wecha_id) && $this->mytwid) {
			$fansInfo = M('Userinfo')->where(array('token' => $this->token, 'twid' => $this->mytwid))->find();
			$this->fans = $fansInfo;
			$this->assign('fans', $fansInfo);
		}

		if ($this->fans && $this->fans['id'] && empty($this->fans['twid'])) {
			$twid = $this->randstr{rand(0, 51)} . $this->randstr{rand(0, 51)} . $this->randstr{rand(0, 51)} . $this->fans['id'];
			if (D('Userinfo')->where(array('id' => $this->fans['id']))->save(array('twid' => $twid))) {
				S('fans_'.$this->token.'_'.$this->wecha_id,null);
			}

			$this->fans['twid'] = $twid;
			$this->assign('fans', $this->fans);
		} elseif (empty($this->fans) && $this->wecha_id) { //TODO 没有用户信息时候的处理

		}
		$this->mytwid = $this->fans['twid'];

		$this->_cid || $this->_cid = $this->mainCompany['id'];
		$this->wecha_id || $this->wecha_id = $this->mytwid;
		*/
		session('callbackurl', U('Store/bdproducts'));
		$this->assign('staticFilePath', str_replace('./', '/', THEME_PATH . 'common/css/store'));
		/*
		$this->savelog(1, $this->_twid, $this->token, $this->_cid);
		session('twitter_save', 1);

		//购物车
		$calCartInfo = $this->calCartInfo();
		$this->assign('totalProductCount', $calCartInfo[0]);
		$this->assign('totalProductFee', $calCartInfo[1]);
		$this->assign('mytwid', $this->mytwid);
		$this->assign('twid', $this->_twid);
		$this->assign('cid', $this->_cid);
		*/
	}

	public function register()
	{
		if (IS_POST) {
			$tel = isset($_POST['tel']) ? htmlspecialchars($_POST['tel']) : '';
			$password = isset($_POST['password']) ? htmlspecialchars($_POST['password']) : '';
			$password2 = isset($_POST['password2']) ? htmlspecialchars($_POST['password2']) : '';
			$truename = isset($_POST['truename']) ? htmlspecialchars($_POST['truename']) : '';
			$address = isset($_POST['address']) ? htmlspecialchars($_POST['address']) : '';
			$wechaname = isset($_POST['wechaname']) ? htmlspecialchars($_POST['wechaname']) : '';
			$username = isset($_POST['username']) ? htmlspecialchars($_POST['username']) : '';
			//$wecha_id = md5($tel . time());
			$userInfo = M('Userinfo')->where(array('username' => $username))->find();
			if (empty($username)) {
				$this->error("帐号为必填信息!");
			}
			if ($userInfo) {
				$this->error("此账号已存在!");
			}
			// if (empty($tel)) {
			// 	$this->error("电话号码不能为空!");
			// }
			// if (empty($password)) {
			// 	$this->error("密码不能为空!");
			// }
			// if ($password != $password2) {
			// 	$this->error("密码不正确");
			// }

            if ($userInfo) {
                D("Userinfo")->save(array('id' => $userInfo['id'], 'truename' => $truename, 'address' => $address, 'password' => md5($password), 'tel' => $tel, 'username' => $username));
                $uid = $userInfo['id'];
            } else {
                $uid = D("Userinfo")->add(array('truename' => $truename, 'address' => $address, 'password' => md5($password), 'tel' => $tel, 'username' => $username));
            }
			if ($uid) {
				$twid = $this->randstr{rand(0, 51)} . $this->randstr{rand(0, 51)} . $this->randstr{rand(0, 51)} . $uid;
                $wecha_id = !empty($this->wecha_id) ? $this->wecha_id : $twid;
				D('Userinfo')->where(array('id' => $uid))->save(array('twid' => $twid, 'wecha_id' => $wecha_id));
				//$this->savelog(2, $this->_twid, $this->token, $this->_cid);
				cookies('userinfo', array('id'=>$uid, 'username'=>$userInfo['username']));
				$callbackurl = session('callbackurl');
				$this->success('注册成功', $callbackurl);
			} else {
				$this->error(D("Userinfo")->error());
			}
		} else {
			$this->assign('metaTitle', '商城会员注册');
			$this->display();
		}
	}

	public function login()
	{
		$userinfo = cookies('userinfo');

        if ($userinfo) {
            $this->redirect(U('Store/dbproducts'));
        }

		if (IS_POST) {
			$username = isset($_POST['username']) ? htmlspecialchars($_POST['username']) : '';
			// $password = isset($_POST['password']) ? htmlspecialchars($_POST['password']) : '';
			$userInfo = M('Userinfo')->where(array('username' => $username))->find();
			if (empty($userInfo)) {
				$this->error("用户不存在");
			}
			// elseif ($userInfo['password'] != md5($password)) {
			// 	$this->error("密码不正确");
			// }
			else {

                cookies('userinfo', array('id'=>$userInfo['id'], 'username'=>$userInfo['username']));
				$callbackurl = session('callbackurl');
				if ($callbackurl) {
					session('callbackurl', null);
					$this->success('登录成功', $callbackurl);
				} else {
					$this->success('登录成功', U('Store/dbproducts'));
				}
			}
		} else {
			$this->assign('metaTitle', '商城会员登录');
			$this->display();
		}
	}

    //*************************************下面为测试代码***************************************************************


    public function bdproducts()
	{
		if(!$this->islogin())
		{
			$this->error('请登录', U('Store/login'));
		}
		$userInfo = cookies('userinfo');

		$catid = isset($_GET['catid']) ? intval($_GET['catid']) : 0;
		if ($catid) {
			$where['catid'] = $catid;
			$thisCat = $this->product_cat_model->where(array('id'=>$catid))->find();
			$where['cid'] = $thisCat['cid'];

			$this->assign('thisCat', $thisCat);
		}
		if (IS_POST){
			$key = $this->_post('search_name');
            $this->redirect('/index.php?g=Wap&m=Store&a=bdproducts&keyword=' . $key);
		}
		if (isset($_GET['keyword']) && $_GET['keyword']){
            $where['name|keyword'] = array('like', "%".$_GET['keyword']."%");
            $this->assign('isSearch', 1);
            $this->assign('keyword', $_GET['keyword']);
		}
		$count = $this->product_model->where($where)->count();
		$this->assign('count', $count);
		//排序方式
		$method = isset($_GET['method']) && ($_GET['method']=='DESC' || $_GET['method']=='ASC') ? $_GET['method'] : 'ASC';
		$orders = array('time', 'discount', 'price', 'salecount');
		$order = isset($_GET['order']) && in_array($_GET['order'], $orders) ? $_GET['order'] : 'sort';
		$this->assign('order', $order);
		$this->assign('method', $method);

		if ($order == 'salecount') $order = '(salecount+fakemembercount)';
		$products = $this->product_model->where($where)->order($order . ' ' . $method)->limit('0, 10')->select();

		$this->assign('products', $products);
		$name = isset($thisCat['name']) ? $thisCat['name'] . '列表' : "商品列表";
		$this->assign('metaTitle', $name);


		$recommands = local_curl(array(), C('BD_RECOMMAND_URL') . $userInfo['id'] , 0);
/*
		if( empty( $recommands ) )*/
			// $recommands = '[{"itemid":"http://192.168.2.77:8062/index.php/Wap/Store/bdproduct/id/8","score":"2.8088317","userid":"1"},{"itemid":"http://192.168.2.77:8062/index.php/Wap/Store/bdproduct/id/9","score":"2.5748677","userid":"1"},{"itemid":"http://192.168.2.77:8062/index.php/Wap/Store/bdproduct/id/10","score":"2.5915816","userid":"1"},{"itemid":"http://192.168.2.77:8062/index.php/Wap/Store/bdproduct/id/8","score":"2.8088317","userid":"1"},{"itemid":"http://192.168.2.77:8062/index.php/Wap/Store/bdproduct/id/9","score":"2.5748677","userid":"1"}]';
		// var_dump($recommands);exit;
		$recommands = is_array( json_decode($recommands, true) ) ? json_decode($recommands, true) : array();
		if( !empty($recommands) ){
			$good_ids = array();
			foreach ($recommands as &$rv) {
				$rv['goods_id'] = $good_ids[] = get_goodsid_by_url( $rv['itemid'] );
			}
			unset( $rv );
			$goods_logos = M('product')->where( array( 'id' => array( 'in', $good_ids ) ) )->getField('id,logourl');

			foreach ($recommands as &$rv) {
				$old_pic = $goods_logos[ $rv['goods_id'] ];

				$new_pic = preg_replace('/^(.+)\.(jpeg|jpg|png|gif)/', '\1_tuijian.\2', $old_pic);
				preg_match('/https?:\/\/[^\/]*((\/.*)\.(jpeg|jpg|png|gif))/', $old_pic ,$mathes_path);

				// echo APP_PATH;exit;
				$new_path = DOCUMENT_ROOT . $mathes_path[2] . '_tuijian.' . $mathes_path[3];
				if( !is_file( $new_path ) ){
					//test
					// unset( $matches );
					// preg_match("/^(.+)\.(jpeg|jpg|png|gif)/" , $old_pic, $matches);
					// var_dump($matches, $old_pic, $new_pic);exit;
					setWater( $goods_logos[ $rv['goods_id'] ] , './Public/Wap_store_tuijian1.png' , '荐', '0xB0,0xC4,0xDE', '3', './Tpl/Wap/default/common/black/fontawesome-webfont.ttf', 'img' , $new_path);
				}
				$rv['logourl'] = $new_pic;

			}
			unset( $mathes_path );
		}
		usort($recommands, 'sort_by_score');
		$recommands = array_slice($recommands, 0, 3);

		$this->assign('action_style', 'bdproduts');
		$this->assign('action_js', 'bdproduts');
		$this->assign('recommands', $recommands);
		$this->display();
	}

	public function bdproduct()
	{
		if(!$this->islogin())
		{
			$this->error('请登录', U('Store/login'));
		}
		$userInfo = cookies('userinfo');

		$usertag['itemid'] = cur_page_url();//$this->_get('id', 'intval', 0);
		$usertag['action'] = 1;
		$usertag['userid'] = $userInfo['id'];

		//发送到大数据平台
		$send_tag_ret = local_curl($usertag, C('BD_SEND_URL') );

		$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
		$where = array('id' => $id);
		$product = $this->product_model->where($where)->find();
		if (empty($product)) {
			$this->redirect(U('Store/bdproducts'));
		}

		// $this->_cid = $cid = $this->_isgroup ? $this->mainCompany['id'] : $product['cid'];
		// session("session_company_{$this->token}", $this->_cid);
		$product['intro'] = isset($product['intro']) ? htmlspecialchars_decode($product['intro']) : '';
		$this->assign('product', $product);
		if ($product['endtime']){
			$leftSeconds = intval($product['endtime'] - time());
			$this->assign('leftSeconds', $leftSeconds);
		}
        $normsData = M("Norms")->where(array('catid' => $product['catid']))->select();
        foreach ($normsData as $row) {
        	$normsList[$row['id']] = $row['value'];
        }
        if($productCatData = M('Product_cat')->where(array('id' => $product['catid'], 'token' => $this->token, 'cid' => $product['cid']))->find()) {
        	$this->assign('catData', $productCatData);
        }
		$colorDetail = $normsDeatail = $productDetail = array();
		$attributeData = M("Product_attribute")->where(array('pid' => $product['id']))->select();

		$productDetailData = M("Product_detail")->where(array('pid' => $product['id']))->order('id asc')->select();
		foreach ($productDetailData as $p) {
			$p['formatName'] = $normsList[$p['format']];
			$p['colorName'] = $normsList[$p['color']];

			$formatData[$p['format']] = $colorData[$p['color']] = $productDetail[] = $p;

			$colorDetail[$p['color']][] = $p;
			$normsDetail[$p['format']][] = $p;
		}
		$productimage = M("Product_image")->where(array('pid' => $product['id']))->select();

		$this->assign('imageList', $productimage);
		$this->assign('productDetail', $productDetail);
		$this->assign('attributeData', $attributeData);
		$this->assign('normsDetail', $normsDetail);
		$this->assign('colorDetail', $colorDetail);
		$this->assign('formatData', $formatData);
		$this->assign('colorData', $colorData);
		$this->assign('metaTitle', $product['name']);

		$where = array('isdelete' => 0);
		$product_model = M("Product_comment");
		$score      = $product_model->where($where)->sum('score');
		$count      = $product_model->where($where)->count();
		$comment = $product_model->where($where)->order('id desc')->limit("0, 10")->select();
		foreach ($comment as &$com) {
			$com['wecha_id'] = $com['truename'];
		}

		$percent = "100%";
		if ($count) {
			$score = number_format($score / $count, 1);
			$percent =  number_format($score / 5, 2) * 100 . "%";
		}
		$totalPage = ceil($count / 10);
		$page = $totalPage > 1 ? 2 : 0;

		$this->assign('score', $score);
		$this->assign('num', $count);
		$this->assign('page', $page);
		$this->assign('comment', $comment);
		$this->assign('percent', $percent);
		$this->display();
	}

	public function islogin()
	{
		return cookies('userinfo');
	}

	public function logout()
	{
		return cookies('userinfo', null);
	}
}

?>