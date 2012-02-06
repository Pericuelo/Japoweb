<?php
defined('_JEXEC') or die('Direct Access to this location is not allowed.');
 
class ModNuevosterminosHelper
{
    /**
     * Returns a list of post items
    */
    public function getTerminos($termCount)
    {
        // get a reference to the database
        $db = &JFactory::getDBO();
 
        // get a list of $userCount randomly ordered users 
        $query = 'SELECT id, kanji, kana, significado FROM `#__jw_termino` ORDER BY fecha DESC LIMIT ' . $termCount  . '';
 
        $db->setQuery($query);
        $items = ($items = $db->loadObjectList())?$items:array();
 
        return $items;
    } //end getItems
}
?>

