<?php
/* 发送数据到收集平台 */
function send_usertag_data($data, $url)
{
	return local_curl($data, $url);
}

/**
 * 发送数据到其它服务器
 * @param  [type]  $post_data [description]
 * @param  [type]  $url       [description]
 * @param  integer $post      [description]
 * @return [type]             [description]
 */
function local_curl($post_data, $url, $post = 1)
{
    ob_start();

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);

    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_URL, $url);

    curl_setopt($ch, CURLOPT_POST, $post);
    if(!empty($post_data)){
      // $post_data = iconv('utf-8', 'gbk', $post_data);
      $post_data = http_build_query($post_data);
      curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
    }

    if(curl_exec($ch) === false) {
        return curl_error($ch);
    }
    curl_close($ch);
    $result = ob_get_contents();
    ob_end_clean();
    // $result = iconv('gbk', 'utf-8', $result);
    return $result;
}

function c_file_exists($url) {
  $curl = curl_init($url);
  // 不取回数据
  curl_setopt($curl, CURLOPT_NOBODY, true);
  // 发送请求
  $result = curl_exec($curl);
  $found = false;
  // 如果请求没有发送失败
  if ($result !== false) {
    // 再检查http响应码是否为200
    $httpCode = curl_getinfo($curl,CURLINFO_HTTP_CODE);
    if($httpCode !== 200)
      return false;
    else
      return true;
  }
}

/**
 * 获取页面的完整url
 * @return [type] [description]
 */
function cur_page_url()
{
	$pageURL = 'http';
	if($_SERVER["HTTPS"] == "on"){
		$pageURL .= "s";
	}
	$pageURL .= "://";

	$pageURL.=$_SERVER["HTTP_HOST"].$_SERVER["REQUEST_URI"];

	return $pageURL;
}

function cookies($name, $value='', $option=null) {
    // 默认设置
    $config = array(
        'prefix'    =>  C('COOKIE_PREFIX'), // cookie 名称前缀
        'expire'    =>  C('COOKIE_EXPIRE'), // cookie 保存时间
        'path'      =>  C('COOKIE_PATH'), // cookie 保存路径
        'domain'    =>  C('COOKIE_DOMAIN'), // cookie 有效域名
    );
    // 参数设置(会覆盖黙认设置)
    if (!empty($option)) {
        if (is_numeric($option))
            $option = array('expire' => $option);
        elseif (is_string($option))
            parse_str($option, $option);
        $config     = array_merge($config, array_change_key_case($option));
    }
    // 清除指定前缀的所有cookie
    if (is_null($name)) {
        if (empty($_COOKIE))
            return;
        // 要删除的cookie前缀，不指定则删除config设置的指定前缀
        $prefix = empty($value) ? $config['prefix'] : $value;
        if (!empty($prefix)) {// 如果前缀为空字符串将不作处理直接返回
            foreach ($_COOKIE as $key => $val) {
                if (0 === stripos($key, $prefix)) {
                    setcookie($key, '', time() - 3600, $config['path'], $config['domain']);
                    unset($_COOKIE[$key]);
                }
            }
        }
        return;
    }
    $name = $config['prefix'] . $name;
    if ('' === $value) {
        return isset($_COOKIE[$name]) ? json_decode(MAGIC_QUOTES_GPC?stripslashes($_COOKIE[$name]):$_COOKIE[$name] , true) : null; // 获取指定Cookie
    } else {
        if (is_null($value)) {
            setcookie($name, '', time() - 3600, $config['path'], $config['domain']);
            unset($_COOKIE[$name]); // 删除指定cookie
        } else {
            // 设置cookie
            $value  = json_encode($value);
            $expire = !empty($config['expire']) ? time() + intval($config['expire']) : 0;
            setcookie($name, $value, $expire, $config['path'], $config['domain']);
            $_COOKIE[$name] = $value;
        }
    }
}


function setWater($imgSrc,$markImg,$markText,$TextColor,$markPos,$fontType,$markType,$newPic)
{

  $srcInfo = /*@*/getimagesize($imgSrc);
  $srcImg_w  = $srcInfo[0];
  $srcImg_h  = $srcInfo[1];

  switch ($srcInfo[2])
  {
    case 1:
        // header("content-type:image/gif");
        $srcim=imagecreatefromgif($imgSrc);
      break;
    case 2:
      // header("content-type:image/jpeg");
      $srcim =imagecreatefromjpeg($imgSrc);
      break;
    case 3:
      // header("content-type:image/png");
      $srcim =imagecreatefrompng($imgSrc);
      break;
    default:
      die('不支持的图片文件类型');
      exit;
  }

  if(!strcmp($markType,"img"))
  {
    if(!file_exists($markImg) || empty($markImg))
    {
      return;
    }

    $markImgInfo = /*@*/getimagesize($markImg);
    $markImg_w  = $markImgInfo[0];
    $markImg_h  = $markImgInfo[1];

    if($srcImg_w < $markImg_w || $srcImg_h < $markImg_h)
    {
      return;
    }

    switch ($markImgInfo[2])
    {
      case 1:
        $markim =imagecreatefromgif($markImg);
        break;
      case 2:
        $markim =imagecreatefromjpeg($markImg);
        break;
      case 3:
        $markim =imagecreatefrompng($markImg);
        break;
      default:
        die('不支持水印图片文件类型');
        exit;
    }

    $logow = $markImg_w;
    $logoh = $markImg_h;
  }

  if(!strcmp($markType,"text"))
  {
    $fontSize = 16;
    if(!empty($markText))
    {
      if(!file_exists($fontType))
      {
        return;
      }
    }
    else {
      return;
    }

    $box = /*@*/imagettfbbox($fontSize, 0, $fontType,$markText);
    $logow = max($box[2], $box[4]) - min($box[0], $box[6]);
    $logoh = max($box[1], $box[3]) - min($box[5], $box[7]);
  }

  if($markPos == 0)
  {
    $markPos = rand(1, 9);
  }

  switch($markPos)
  {
    case 1:
      $x = +5;
      $y = +5;
      break;
    case 2:
      $x = ($srcImg_w - $logow) / 2;
      $y = +5;
      break;
    case 3:
      $x = $srcImg_w - $logow - 5;
      $y = +15;
      break;
    case 4:
      $x = +5;
      $y = ($srcImg_h - $logoh) / 2;
      break;
    case 5:
      $x = ($srcImg_w - $logow) / 2;
      $y = ($srcImg_h - $logoh) / 2;
      break;
    case 6:
      $x = $srcImg_w - $logow - 5;
      $y = ($srcImg_h - $logoh) / 2;
      break;
    case 7:
      $x = +5;
      $y = $srcImg_h - $logoh - 5;
      break;
    case 8:
      $x = ($srcImg_w - $logow) / 2;
      $y = $srcImg_h - $logoh - 5;
      break;
    case 9:
      $x = $srcImg_w - $logow - 5;
      $y = $srcImg_h - $logoh -5;
      break;
    default:
      die('此位置不支持');
      exit;
  }

  $dst_img = /*@*/imagecreatetruecolor($srcImg_w, $srcImg_h);

  imagecopy ( $dst_img, $srcim, 0, 0, 0, 0, $srcImg_w, $srcImg_h);

  if(!strcmp($markType,"img"))
  {
    imagecopy($dst_img, $markim, $x, $y, 0, 0, $logow, $logoh);
    imagedestroy($markim);
  }

  if(!strcmp($markType,"text"))
  {
    $rgb = explode(',', $TextColor);

    $color = imagecolorallocate($dst_img, $rgb[0], $rgb[1], $rgb[2]);
    imagettftext($dst_img, $fontSize, 0, $x, $y, $color, $fontType,$markText);
  }

  switch ($srcInfo[2])
  {
    case 1:
      // header('content-type:image/gif');
      imagegif($dst_img, $newPic);
      break;
    case 2:
      // header('content-type:image/jpeg');
      imagejpeg($dst_img, $newPic);
      break;
    case 3:
      // header('content-type:image/png');
      imagepng($dst_img, $newPic);
      break;
    default:
      die('不支持水印图片文件类型');
      exit;
  }

  imagedestroy($dst_img);
  imagedestroy($srcim);
}

?>