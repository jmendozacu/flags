<?php

/*
 * @copyright  Copyright (c) 2013 by  ESS-UA.
 */

class Ess_M2ePro_Model_Ebay_Marketplace extends Ess_M2ePro_Model_Component_Child_Ebay_Abstract
{
    const TRANSLATION_SERVICE_NO       = 0;
    const TRANSLATION_SERVICE_YES_TO   = 1;
    const TRANSLATION_SERVICE_YES_FROM = 2;
    const TRANSLATION_SERVICE_YES_BOTH = 3;

    private $info = NULL;

    // ########################################

    public function _construct()
    {
        parent::_construct();
        $this->_init('M2ePro/Ebay_Marketplace');
    }

    // ########################################

    public function getEbayItems($asObjects = false, array $filters = array())
    {
        return $this->getRelatedSimpleItems('Ebay_Item','marketplace_id',$asObjects,$filters);
    }

    // ########################################

    public function getCurrencies()
    {
        return $this->getData('currency');
    }

    public function getCurrency()
    {
        $currency = (string)$this->getData('currency');

        if (strpos($currency,',') === false) {
            return $currency;
        }

        $currency = explode(',', $currency);

        if (!is_null($setting = Mage::helper('M2ePro/Module')->getConfig()
                                ->getGroupValue('/ebay/selling/currency/',$this->getParentObject()->getCode()))
            && in_array($setting, $currency)) {
            return $setting;
        }

        return array_shift($currency);
    }

    public function getOriginCountry()
    {
        return $this->getData('origin_country');
    }

    public function getLanguageCode()
    {
        return $this->getData('language_code');
    }

    public function getTranslationServiceMode()
    {
        return (int)$this->getData('translation_service_mode');
    }

    public function isTranslationServiceMode()
    {
        return $this->getTranslationServiceMode() != self::TRANSLATION_SERVICE_NO;
    }

    public function isTranslationServiceModeTo()
    {
        return $this->getTranslationServiceMode() == self::TRANSLATION_SERVICE_YES_TO;
    }

    public function isTranslationServiceModeFrom()
    {
        return $this->getTranslationServiceMode() == self::TRANSLATION_SERVICE_YES_FROM;
    }

    public function isTranslationServiceModeBoth()
    {
        return $this->getTranslationServiceMode() == self::TRANSLATION_SERVICE_YES_BOTH;
    }

    public function isMultiCurrencyEnabled()
    {
        return (bool)(int)$this->getData('is_multi_currency');
    }

    public function isMultivariationEnabled()
    {
        return (bool)$this->getData('is_multivariation');
    }

    public function isTaxTableEnabled()
    {
        return (bool)(int)$this->getData('is_tax_table');
    }

    public function isVatEnabled()
    {
        return (bool)(int)$this->getData('is_vat');
    }

    public function isStpEnabled()
    {
        return (bool)(int)$this->getData('is_stp');
    }

    public function isStpAdvancedEnabled()
    {
        return (bool)(int)$this->getData('is_stp_advanced');
    }

    public function isMapEnabled()
    {
        return (bool)(int)$this->getData('is_map');
    }

    public function isLocalShippingRateTableEnabled()
    {
        return (bool)(int)$this->getData('is_local_shipping_rate_table');
    }

    public function isInternationalShippingRateTableEnabled()
    {
        return (bool)(int)$this->getData('is_international_shipping_rate_table');
    }

    public function isEnglishMeasurementSystemEnabled()
    {
        return (bool)(int)$this->getData('is_english_measurement_system');
    }

    public function isMetricMeasurementSystemEnabled()
    {
        return (bool)(int)$this->getData('is_metric_measurement_system');
    }

    public function isCashOnDeliveryEnabled()
    {
        return (bool)(int)$this->getData('is_cash_on_delivery');
    }

    public function isFreightShippingEnabled()
    {
        return (bool)(int)$this->getData('is_freight_shipping');
    }

    public function isCalculatedShippingEnabled()
    {
        return (bool)(int)$this->getData('is_calculated_shipping');
    }

    public function isGlobalShippingProgramEnabled()
    {
        return (bool)(int)$this->getData('is_global_shipping_program');
    }

    public function isCharityEnabled()
    {
        return (bool)(int)$this->getData('is_charity');
    }

    public function isClickAndCollectEnabled()
    {
        return (bool)(int)$this->getData('is_click_and_collect');
    }

    public function isHolidayReturnEnabled()
    {
        return (bool)(int)$this->getData('is_holiday_return');
    }

    // ########################################

    public function getCategory($categoryId)
    {
        $tableCategories = Mage::getSingleton('core/resource')->getTableName('m2epro_ebay_dictionary_category');

        $dbSelect = Mage::getResourceModel('core/config')->getReadConnection()
                             ->select()
                             ->from($tableCategories,'*')
                             ->where('`marketplace_id` = ?',(int)$this->getId())
                             ->where('`category_id` = ?',(int)$categoryId);

        $categories = Mage::getResourceModel('core/config')
                                ->getReadConnection()
                                ->fetchAll($dbSelect);

        return count($categories) > 0 ? $categories[0] : array();
    }

    public function getChildCategories($parentId)
    {
        $tableCategories = Mage::getSingleton('core/resource')->getTableName('m2epro_ebay_dictionary_category');

        $dbSelect = Mage::getResourceModel('core/config')->getReadConnection()
                             ->select()
                             ->from($tableCategories,array('category_id','title','is_leaf'))
                             ->where('`marketplace_id` = ?',(int)$this->getId())
                             ->where('`parent_category_id` = ?',(int)$parentId)
                             ->order(array('title ASC'));

        $categories = Mage::getResourceModel('core/config')
                                ->getReadConnection()
                                ->fetchAll($dbSelect);

        return $categories;
    }

    // ########################################

    public function getInfo()
    {
        if (!is_null($this->info)) {
            return $this->info;
        }

        /** @var $connRead Varien_Db_Adapter_Pdo_Mysql */
        $coreResource = Mage::getSingleton('core/resource');
        $connRead = Mage::getSingleton('core/resource')->getConnection('core_read');

        $tableDictMarketplace = $coreResource->getTableName('m2epro_ebay_dictionary_marketplace');
        $tableDictShipping = $coreResource->getTableName('m2epro_ebay_dictionary_shipping');
        $tableDictShippingCategory = $coreResource->getTableName('m2epro_ebay_dictionary_shipping_category');

        // table m2epro_ebay_dictionary_marketplace
        //------------------------------
        $dbSelect = $connRead->select()
                             ->from($tableDictMarketplace,'*')
                             ->where('`marketplace_id` = ?',(int)$this->getId());
        $data = $connRead->fetchRow($dbSelect);
        //------------------------------

        if (!$data) {
            return $this->info = array();
        }

        // table m2epro_ebay_dictionary_shipping
        //------------------------------
        $dbSelect = $connRead->select()
                             ->from($tableDictShipping,'*')
                             ->where('`marketplace_id` = ?',(int)$this->getId())
                             ->order(array('title ASC'));
        $shippingMethods = $connRead->fetchAll($dbSelect);
        //------------------------------

        if (!$shippingMethods) {
            $shippingMethods = array();
        }

        // table m2epro_ebay_dictionary_shipping_category
        //------------------------------
        $dbSelect = $connRead->select()
                             ->from($tableDictShippingCategory,'*')
                             ->where('`marketplace_id` = ?',(int)$this->getId())
                             ->order(array('title ASC'));
        $shippingCategories = $connRead->fetchAll($dbSelect);

        $categoryShippingMethods = array();

        if (is_array($shippingCategories)) {

            foreach ($shippingCategories as $category) {
                $categoryShippingMethods[$category['ebay_id']] = array(
                    'title'   => $category['title'],
                    'methods' => array(),
                );
            }

            foreach ($shippingMethods as $shippingMethod) {
                $shippingMethod['data'] = json_decode($shippingMethod['data'], true);
                $categoryShippingMethods[$shippingMethod['category']]['methods'][] = $shippingMethod;
            }
        }
        //------------------------------

        return $this->info = array(
            'dispatch'                   => json_decode($data['dispatch'], true),
            'packages'                   => json_decode($data['packages'], true),
            'return_policy'              => json_decode($data['return_policy'], true),
            'listing_features'           => json_decode($data['listing_features'], true),
            'payments'                   => json_decode($data['payments'], true),
            'charities'                  => json_decode($data['charities'], true),
            'shipping'                   => $categoryShippingMethods,
            'shipping_locations'         => json_decode($data['shipping_locations'], true),
            'shipping_locations_exclude' => json_decode($data['shipping_locations_exclude'], true),
            'tax_categories'             => json_decode($data['tax_categories'], true)
        );
    }

    //-----------------------------------------

    public function getDispatchInfo()
    {
        $info = $this->getInfo();
        return isset($info['dispatch']) ? $info['dispatch'] : array();
    }

    public function getPackageInfo()
    {
        $info = $this->getInfo();
        return isset($info['packages']) ? $info['packages'] : array();
    }

    public function getReturnPolicyInfo()
    {
        $info = $this->getInfo();
        return isset($info['return_policy']) ? $info['return_policy'] : array();
    }

    public function getListingFeatureInfo()
    {
        $info = $this->getInfo();
        return isset($info['listing_features']) ? $info['listing_features'] : array();
    }

    public function getPaymentInfo()
    {
        $info = $this->getInfo();
        return isset($info['payments']) ? $info['payments'] : array();
    }

    public function getShippingInfo()
    {
        $info = $this->getInfo();
        return isset($info['shipping']) ? $info['shipping'] : array();
    }

    public function getShippingLocationInfo()
    {
        $info = $this->getInfo();
        return isset($info['shipping_locations']) ? $info['shipping_locations'] : array();
    }

    public function getShippingLocationExcludeInfo()
    {
        $info = $this->getInfo();
        return isset($info['shipping_locations_exclude']) ? $info['shipping_locations_exclude'] : array();
    }

    public function getTaxCategoryInfo()
    {
        $info = $this->getInfo();
        return isset($info['tax_categories']) ? $info['tax_categories'] : array();
    }

    public function getCharitiesInfo()
    {
        $info = $this->getInfo();
        return isset($info['charities']) ? $info['charities'] : array();
    }

    // ########################################

    public function save()
    {
        Mage::helper('M2ePro/Data_Cache_Permanent')->removeTagValues('marketplace');
        return parent::save();
    }

    public function delete()
    {
        Mage::helper('M2ePro/Data_Cache_Permanent')->removeTagValues('marketplace');
        return parent::delete();
    }

    // ########################################
}