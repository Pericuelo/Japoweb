<?php
/**
 * JComments plugin for Remository objects support
 *
 * @version 2.0
 * @package JComments
 * @author Sergey M. Litvinov (smart@joomlatune.ru)
 * @copyright (C) 2006-2009 by Sergey M. Litvinov (http://www.joomlatune.ru)
 * @license GNU/GPL: http://www.gnu.org/copyleft/gpl.html
 **/

class jc_com_remository extends JCommentsPlugin
{
	function getObjectTitle($id)
	{
		$db = & JCommentsFactory::getDBO();
		$db->setQuery( 'SELECT filetitle, id FROM #__downloads_files WHERE id = ' . $id );
		return $db->loadResult();
	}

	function getObjectLink($id)
	{
		$_Itemid = JCommentsPlugin::getItemid('com_remository');
		$link = JoomlaTuneRoute::_( 'index.php?option=com_remository&amp;func=fileinfo&amp;id=' . $id . '&amp;Itemid=' . $_Itemid );
		return $link;
	}

	function getObjectOwner($id)
	{
		$db = & JCommentsFactory::getDBO();
		$db->setQuery( 'SELECT userid FROM #__downloads_files WHERE id = ' . $id );
		$userid = $db->loadResult();
		
		return $userid;
	}
}
?>