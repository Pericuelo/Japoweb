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
 
class JapowebViewOrdencategorias extends JView {
    	
    function display()
    {
        $model =& $this->getModel();
		
		$terminos = $model->getPalabrasCategoria(JRequest::getVar('id'));
		
		$order = array();	
		echo '<form>';
		echo '<ul id="sortable-list">';
		foreach($terminos as $termino) {
			echo '<li title="'.$termino->id_termino.'">';
			echo $termino->significado.' - '.$termino->kanji.' - '.$termino->kana;
			echo '</li>';
			$order[] = $termino->id_termino;
		}
		echo '</ul>';
		echo '<input type="hidden" name="sort_order" id="sort_order" value="'.implode(',',$order).'" />';
		echo '<input type="hidden" name="cat_id" id="cat_id" value="'.JRequest::getVar('id').'" />';
		echo '</form>';
    }
}