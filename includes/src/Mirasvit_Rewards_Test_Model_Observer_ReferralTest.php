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


class Mirasvit_Rewards_Model_Observer_ReferralTest extends EcomDev_PHPUnit_Test_Case
{
    protected function setUp()
    {
        parent::setUp();
    }

    /**
     * @test
     * @loadFixture data
     *
     * @doNotIndex catalog_product_price
     */
    public function convertTest() {
        $customer = Mage::getModel('customer/customer')->getCollection()
            ->addAttributeToSelect('*')
            ->addFieldToFilter('entity_id', 2)
            ->getFirstItem();
        Mage::getSingleton('core/session')->setReferral(2);

        $observer = Mage::getSingleton('rewards/observer_referral');
        $observer->customerAfterCreate($customer);

        // $this->assertEquals(11, $customer->getName());
    }
}