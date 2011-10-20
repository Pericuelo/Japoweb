<?
/*
Google Images Query

http://images.google.com/images
	?hl=en		Idioma
	&biw=1680	Ancho (Opcional)
	&bih=827	Alto (Opcional)
	&gbv=2		???
	&tbas=0		???
	&tbs=isch:1,ic:gray,isz:l,itp:lineart,islt:qsvga
		isch		1 ???
		ic			color | gray (Opcional)
		isz			l | m | i (Opcional)
		itp			lineart | photo | face | (Opcional)
		islt:qsvga	(Mayor de 400*300)
	&q=perro
	&aq=f
	&aqi=g10
	&aql=
	&oq=
	&gs_rfai=
*/
function get_web_page( $url )
{
    $options = array(
        CURLOPT_RETURNTRANSFER => true,     // return web page
        CURLOPT_HEADER         => false,    // don't return headers
        CURLOPT_FOLLOWLOCATION => true,     // follow redirects
        CURLOPT_ENCODING       => "UTF-8",       // handle all encodings
        CURLOPT_USERAGENT      => "Neko", // who am i
        CURLOPT_AUTOREFERER    => true,     // set referer on redirect
        CURLOPT_CONNECTTIMEOUT => 120,      // timeout on connect
        CURLOPT_TIMEOUT        => 120,      // timeout on response
        CURLOPT_MAXREDIRS      => 10       // stop after 10 redirects
    );
	
    $ch      = curl_init( $url );
    curl_setopt_array( $ch, $options );
    $content = curl_exec( $ch );
    $err     = curl_errno( $ch );
    $errmsg  = curl_error( $ch );
    $header  = curl_getinfo( $ch );
    curl_close( $ch );

    $header['errno']   = $err;
    $header['errmsg']  = $errmsg;
    $header['content'] = $content;
    return $content;
}

function extractImgLinks($web_page){
	$links = array();
	while(1){
		$next = strpos($web_page,"imgurl")+7;
		if($next == 7) break; //No quedan imagenes
		$web_page = substr($web_page, $next);
		$link = substr($web_page, 0, strpos($web_page,"&amp"));
		$web_page = substr($web_page, strpos($web_page,"gstatic")-10);
		$link2 = substr($web_page, 0, strpos($web_page,"\" width"));
		array_push($links, array($link2, $link));
	}
	return $links;
}

function getGoogleImg($q, $min_imgs) {
	$q = '&q='.str_replace(" ", "%20", $q);
	$result = array();
	$img_start_num = 0;
	while($img_start_num < $min_imgs){
		$url = "http://images.google.com/images?hl=en&tbs=isch:1,itp:lineart,ic:gray&source=lnt&sa=X&start=".$img_start_num.$q;
		//$url = "http://www.google.com/images?hl=es&source=imghp&gbv=2&aq=f&aqi=&aql=&oq=&start=".$img_start_num.$q;
		//$url = "http://www.google.com/images?hl=es&source=imghp&gbv=2&tbs=isch%3A1%2Citp%3Alineart&sa=1&aq=f&aqi=&aql=&oq=".$q;
		$web_page = get_web_page($url);
		$links = extractImgLinks($web_page);
		$result = array_merge($result, $links);
		$img_start_num += 20;
	}
	return $result;
}
function getImagesDiv($img_array){
	$img_div = "";
	$img_id = 1;
	foreach($img_array as $im_src){
		$img_div .= '<div id="img'.$img_id.'" class="img_container" style="float:left; width:150px; height:150px">';
		$img_div .= '<a href="#" onclick="select_img('.$img_id.');return false;">';
		$img_div .= '<img src="'.$im_src[0].'">';
		$img_div .= '</a>';
		$img_div .= '<input type="hidden" id="goo_img'.$img_id.'" value="'.$im_src[0].'" />';
		$img_div .= '<input type="hidden" id="orig_img'.$img_id.'" value="'.$im_src[1].'" />';
		$img_div .= '</div>';
		$img_id++;
	}
	return $img_div;
}
?>