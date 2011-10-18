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
		//Comprobamos que se ha enviado el form con javascript tras validar
		$jAp=& JFactory::getApplication();
		if ($_POST['check']!=JUtility::getToken()) {
		   // First verify (by a Javascript error or other methods) that the form has not been submitted without the validation
		   if ($_POST['check']=='post'){
		   	//$jAp->enqueueMessage('Please check all the fields of the form, aub.<br/>
			//If your browser blocks Javascript, then this form will never be successful. This is a security measure.','error');
		   
		   	// If the check still isn't a valid token, do nothing. This might be a spoof attack or other invalid form submission
			JError::raiseWarning( 100, 'Este formulario necesita Javascript para funcionar.' );
			JFactory::getApplication()->redirect('index.php?option=com_japoweb&view=addtermino&Itemid=3');
			}
		}
		//Es update?
		$model = $this->getModel('addtermino');

		$kana = JRequest::getVar('kana');
		$kanji = JRequest::getVar('kanji');
		$significado = JRequest::getVar('significado');
		$categorias = JRequest::getVar('categorias');
		$categorias_nombres = JRequest::getVar('categorias_nombres');
		$google_image = JRequest::getVar('google_image');
		$original_image = JRequest::getVar('original_image');
		$idUser = JRequest::getVar('id_user');

		$id = JRequest::getVar('old');
		if($id != 0) {
			// Update
			$termino = $model->getTermino($id);
			
			$model->updateTermino($kana, $kanji, $significado, $categorias, $categorias_nombres, $google_image, $original_image, $idUser, $termino);
		} else {
			// Create			
			$model->createTermino($kana, $kanji, $significado, $categorias, $categorias_nombres, $google_image, $original_image, $idUser);
		}
	}
 
}
