<?php
/**
 * @package    	Joomla Japoweb
 * @subpackage 	Component
 * @autor		Jose L. Rodríguez
 * @license    	GNU/GPL
*/
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.view');
 
class JapowebViewAddtermino extends JView {
    	
    function display()
    {
        $model =& $this->getModel();
		
		$terminos = $model->getTablaTerminos(JRequest::getVar('kana'));
		
		if(sizeof($terminos['terminos']) > 0){
			echo '<table class="terminos_parecidos_popup">';		
			echo '<tr><td>¿Tu palabra es alguna de estas?</tr></td>';
			foreach($terminos['terminos'] as $termino) {
				echo '<tr><td onclick="obtenerTermino('.$termino->id.')">';
				$imagen = ($terminos['imagenes'][$termino->id])?$terminos['imagenes'][$termino->id]:'NoPhoto.jpg';
				echo '<img src="images/img_vocabulario/peques/'.$imagen.'"> ';
				echo $termino->kana;
				if($termino->kanji) echo '(<strong>'.$termino->kanji.'</strong>)<br>';
				echo '</td></tr>';
			}
			echo '<tr><td onclick="SqueezeBox.close();">No es ninguna de estas, dejame continuar introduciendola.</td></tr>';
			echo '</table>';
		}
    }
}