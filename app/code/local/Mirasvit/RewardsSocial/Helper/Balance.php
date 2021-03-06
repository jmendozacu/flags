<?php
/**
 * Mirasvit
 *
 * This source file is subject to the Mirasvit Software License, which is available at http://mirasvit.com/license/.
 * Do not edit or add to this file if you wish to upgrade the to newer versions in the future.
 * If you wish to customize this module for your needs.
 * Please refer to http://www.magentocommerce.com for more information.
 *
 * @category  Mirasvit
 * @package   Reward Points + Referral program
 * @version   1.1.2
 * @build     928
 * @copyright Copyright (C) 2015 Mirasvit (http://mirasvit.com/)
 */


class Mirasvit_RewardsSocial_Helper_Balance extends Mage_Core_Helper_Abstract
{
    public function cancelEarnedPoints($customer, $code)
    {
        if (!$earnedTransaction = $this->getEarnedPointsTransaction($customer, $code)) {
            return false;
        }
        $earnedTransaction->delete();
    }

    public function getEarnedPointsTransaction($customer, $code)
    {
        $collection = Mage::getModel('rewards/transaction')->getCollection()
            ->addFieldToFilter('customer_id', $customer->getId())
            ->addFieldToFilter('code', $code)
            ;
        if ($collection->count()) {
            return $collection->getFirstItem();
        }
    }
}
