<?php
function salvar_http_a_local($url_origen, $fichero_destino){
	$ch = curl_init ($url_origen);
	$fp = fopen ($fichero_destino, "w");
	curl_setopt ($ch, CURLOPT_FILE, $fp);
	curl_setopt ($ch, CURLOPT_HEADER, 0);
	$result = curl_exec ($ch);
	curl_close ($ch);
	fclose ($fp);
	return $result;
}
?>