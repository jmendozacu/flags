<?php
/**
 * aheadWorks Co.
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the EULA
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://ecommerce.aheadworks.com/AW-LICENSE.txt
 *
 * =================================================================
 *                 MAGENTO EDITION USAGE NOTICE
 * =================================================================
 * This software is designed to work with Magento community edition and
 * its use on an edition other than specified is prohibited. aheadWorks does not
 * provide extension support in case of incorrect edition use.
 * =================================================================
 *
 * @category   AW
 * @package    AW_Helpdesk3
 * @version    3.3.7
 * @copyright  Copyright (c) 2010-2012 aheadWorks Co. (http://www.aheadworks.com)
 * @license    http://ecommerce.aheadworks.com/AW-LICENSE.txt
 */


class AW_Helpdesk3_Model_Resource_Gateway_Mail extends Mage_Core_Model_Mysql4_Abstract
{
    public function _construct()
    {
        $this->_init('aw_hdu3/gateway_mail', 'id');
    }

    /**
     * @param string $messageUid
     *
     * @return bool
     */
    public function isMailExistByMailUid($messageUid)
    {
        $read = $this->_getReadAdapter();
        $select = $read->select()
            ->from(array('gm' => $this->getTable('aw_hdu3/gateway_mail')), 'count(id)')
            ->where('gm.uid = ?', $messageUid)
        ;
        return (bool)$read->fetchOne($select->__toString());
    }

    /**
     * @param int $gatewayId
     *
     * @return array
     */
    public function getExistMailUIDs($gatewayId)
    {
        $read = $this->_getReadAdapter();
        $select = $read->select()
            ->from(array('gm' => $this->getTable('aw_hdu3/gateway_mail')) , 'REPLACE(gm.uid, CONCAT(g.email, g.id),"")')
            ->joinLeft(
                array(
                    'g' => $this->getTable('aw_hdu3/gateway')
                ),
                'gm.gateway_id = g.id',
                array()
            )
            ->where('gm.gateway_id = ?', $gatewayId)
        ;
        return $read->fetchCol($select->__toString());
    }
}