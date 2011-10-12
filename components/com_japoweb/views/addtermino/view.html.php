<?php
/**
 * @package    Joomla.Tutorials
 * @subpackage Components
 * @link http://docs.joomla.org/Developing_a_Model-View-Controller_Component_-_Part_1
 * @license    GNU/GPL
*/
 
// no direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport( 'joomla.application.component.view');
 
class JapowebViewAddtermino extends JView {
    	
    function display()
    {
        $model =& $this->getModel();
		
		$categorias = $model->getCategorias();
		$this->assignRef('categorias', $categorias);
 
        parent::display($tpl);
    }
}

