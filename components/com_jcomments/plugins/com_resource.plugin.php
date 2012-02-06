<?php
/**
 * JComments plugin for JoomSuite Content [com_resource] - (http://www.joomsuite.com/)
 *
 * @version 2.0
 * @package JComments
 * @author Sergey M. Litvinov (smart@joomlatune.ru)
 * @copyright (C) 2006-2009 by Sergey M. Litvinov (http://www.joomlatune.ru)
 * @license GNU/GPL: http://www.gnu.org/copyleft/gpl.html
 **/

class jc_com_resource extends JCommentsPlugin
{
	function getTitles($ids)
	{
		$db = & JCommentsFactory::getDBO();
		$db->setQuery( 'SELECT id, title FROM #__js_res_record WHERE id IN (' . implode(',', $ids) . ')' );
		return $db->loadObjectList('id');
	}

	function getObjectTitle($id)
	{
		$db = & JCommentsFactory::getDBO();
		$db->setQuery( 'SELECT title, id FROM #__js_res_record WHERE id = ' . $id );
		return $db->loadResult();
	}

	function getObjectLink($id)
	{
		include_once(JPATH_ROOT.DS.'administrator'.DS.'components'.DS.'com_resource'.DS.'library'.DS.'helper.php');
		if (class_exists('MEUrl')) {
			$link = MEUrl::link_record($id);
		} else {
			$_Itemid = JCommentsPlugin::getItemid('com_resource');
			$link = 'index.php?option=com_resource&controller=article&article='.$id;
			$link .= ($_Itemid > 0) ? ('&Itemid=' . $_Itemid) : '';
		}

		$link = JRoute::_( $link );

		return $link;
	}

	function getObjectOwner($id)
	{
		$db = & JCommentsFactory::getDBO();
		$db->setQuery( "SELECT created_by FROM #__js_res_record WHERE id='$id'");
		$userid = $db->loadResult();
		
		return $userid;
	}
}
?>