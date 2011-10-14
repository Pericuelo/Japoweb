<?
if(is_numeric($_GET['cuantas'])){
	include ('getGoogleImages.php');
	
	$result = getGoogleImg($_GET['q'], $_GET['cuantas']);
	echo getImagesDiv($result);
}
?>