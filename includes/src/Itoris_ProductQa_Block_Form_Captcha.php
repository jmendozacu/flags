<?php
/**
 * ITORIS
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the ITORIS's Magento Extensions License Agreement
 * which is available through the world-wide-web at this URL:
 * http://www.itoris.com/magento-extensions-license.html
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to sales@itoris.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade the extensions to newer
 * versions in the future. If you wish to customize the extension for your
 * needs please refer to the license agreement or contact sales@itoris.com for more information.
 *
 * @category   ITORIS
 * @package    ITORIS_PRODUCTQA
 * @copyright  Copyright (c) 2013 ITORIS INC. (http://www.itoris.com)
 * @license    http://www.itoris.com/magento-extensions-license.html  Commercial License
 */

class Itoris_ProductQa_Block_Form_Captcha extends Mage_Core_Block_Template {

	protected $captchaId = 'question';
	protected $type = 'alikon';

	protected function _construct() {
		$this->setTemplate('itoris/productqa/form/captcha.phtml');
	}

	public function setCaptchaId($id) {
		$this->captchaId = $id;
		return $this;
	}

	public function setType($type) {
		$this->type = $type;
		return $this;
	}

	public function getCaptchaId() {
		return $this->captchaId;
	}

	public function getType() {
		return $this->type;
	}

	public function getCaptchaUrl() {
		return Mage::getUrl('itoris_productqa', array('_nosid' => true)) .'captcha/' . $this->type . '?' . $this->captchaId;
	}
}

?>