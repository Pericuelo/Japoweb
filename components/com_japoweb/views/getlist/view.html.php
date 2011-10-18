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
 
class JapowebViewGetlist extends JView {
    	
    function display($tpl = null)
    {
        $model =& $this->getModel();
		
		$categorias = $model->getCategorias();
		$this->assign('categorias', $categorias);
 
        parent::display($tpl);
    }
}

