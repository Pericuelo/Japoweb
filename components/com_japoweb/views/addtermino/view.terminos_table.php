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
			foreach($terminos['terminos'] as $termino) {
				echo '<tr><td onclick="obtenerTermino('.$termino->id.')">';
				echo '<img src="images/img_vocabulario/peques/'.$terminos['imagenes'][$termino->id].'">';
				echo $termino->kana.'<br>';
				echo $termino->kanji.'<br>';
				echo '</td></tr>';
			}
			echo '<tr><td>No es ninguna de estas...</td></tr>';
			echo '</table>';
		}
    }
}