<?php
/**
 * @package    Joomla.Tutorials
 * @subpackage Components
 * @link http://docs.joomla.org/Developing_a_Model-View-Controller_Component_-_Part_1
 * @license    GNU/GPL
 */
 
// No direct access
 
defined( '_JEXEC' ) or die( 'Restricted access' );
 
jimport('joomla.application.component.controller');
 
/**
 * Hello World Component Controller
 *
 * @package    Joomla.Tutorials
 * @subpackage Components
 */
class JapowebController extends JController
{
    /**
     * Method to display the view
     *
     * @access    public
     */
    function display() {
        parent::display();
    }
	
	function save() {
		$id = JRequest::getVar('id');
		if($id) {
			// Update
			$model = $this->getModel('addtermino');
		} else {
			// Create
			$model = $this->getModel('addtermino');
			
			// kana, kanji, significado, categorias, id_user
			$kana = JRequest::getVar('kana');
			$kanji = JRequest::getVar('kanji');
			$significado = JRequest::getVar('significado');
			$categorias = JRequest::getVar('categorias');
			$idUser = JRequest::getVar('id_user');
			
			$model->createTermino($kana, $kanji, $significado, $categorias, $idUser);
		}
	}
 
}