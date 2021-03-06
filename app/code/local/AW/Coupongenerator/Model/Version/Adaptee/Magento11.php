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
 * @package    AW_Coupongenerator
 * @version    1.0.2
 * @copyright  Copyright (c) 2010-2012 aheadWorks Co. (http://www.aheadworks.com)
 * @license    http://ecommerce.aheadworks.com/AW-LICENSE.txt
 */


class AW_Coupongenerator_Model_Version_Adaptee_Magento11 extends AW_Coupongenerator_Model_Version_Adaptee_Magento4
{
    /**
     * @param Mage_Core_Model_Layout $layout
     *
     * @return Mage_Core_Model_Layout
     */
    public function addBannersBlock(Mage_Core_Model_Layout $layout)
    {
        $layout->getUpdate()->addHandle('adminhtml_awqcg_rules_edit_ee_banners');
        return $layout;
    }
}