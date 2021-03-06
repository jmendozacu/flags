var ajaxaddtocart = {
    g: new Growler(),
    initialize: function() {
        this.g = new Growler();		
        this.bindEvents();
    },
    bindEvents: function () {
        this.addSubmitEvent();

        $$('a[href*="/checkout/cart/delete/"]').each(function(e){
            $(e).observe('click', function(event){
                setLocation($(e).readAttribute('href'));
                Event.stop(event);
            });
        });        
    },
    ajaxCartSubmit: function (obj) {
        var _this = this;
        if(Modalbox !== 'undefined' && Modalbox.initialized)Modalbox.hide();

        try {
            if(typeof obj == 'string') {
                var url = obj;
                if(url.search('checkout/cart/delete') != -1 )
                   {
                     if(!confirm("Are you sure you would like to remove this item from the shopping cart?"))
                     {
                         return false;
                     }

                 }
                new Ajax.Request(url, {
                    onCreate	: function() {
                        _this.g.warn("Processing...", {
                            life: 2
                        });
                    },
                    onSuccess	: function(response) {
                        // Handle the response content...
                        try{
                            var res = response.responseText.evalJSON();
                            if(res) {
                                //check for group product's option
                                if(res.configurable_options_block) {
                                    if(res.r == 'success') {
                                        //show group product options block
                                        _this.showPopup(res.configurable_options_block);
                                    } else {
                                        if(typeof res.messages != 'undefined') {
                                            _this.showError(res.messages);
                                        } else {
                                            _this.showError("Something happened wrong ");
                                        }
                                    }
                                } else {
                                    if(res.r == 'success') {
                                        if(res.redirect_url) 
                                         {
                                              window.location.href = res.redirect_url;
                                         }
                                        if(res.message) {
                                            _this.showSuccess(res.message);
                                           
                                        } else {
                                            _this.showSuccess('Item was successfully added to cart.');
                                        }

                                        //update all blocks here
                                        _this.updateBlocks(res.update_blocks);

                                    } else {
                                        if(typeof res.messages != 'undefined') {
                                            _this.showError(res.messages);
                                        } else {
                                            _this.showError("Something happened wrong");
                                        }
                                    }
                                }
                            } else {
                                document.location.reload(true);
                            }
                        } catch(e) {
                       
                        }
                    }
                });
            } else {
                if(typeof obj.form.down('input[type=file]') != 'undefined') {

                    //use iframe

                    obj.form.insert('<iframe id="upload_target" name="upload_target" src="" style="width:0;height:0;border:0px solid #fff;"></iframe>');

                    var iframe = $('upload_target');
                    iframe.observe('load', function(){
                        // Handle the response content...
                        try{
                            var doc = iframe.contentDocument ? iframe.contentDocument : (iframe.contentWindow.document || iframe.document);
                            //console.log(doc);
                            var res = doc.body.innerText ? doc.body.innerText : doc.body.textContent;
                            res = res.evalJSON();

                            if(res) {
                                if(res.r == 'success') {
                                    if(res.message) {
                                        _this.showSuccess(res.message);
                                    } else {
                                        _this.showSuccess('Item was successfully added to cart.');
                                    }

                                    //update all blocks here
                                    _this.updateBlocks(res.update_blocks);

                                } else {
                                    if(typeof res.messages != 'undefined') {
                                        _this.showError(res.messages);
                                    } else {
                                        _this.showError("Something happened wrong");
                                    }
                                }
                            } else {
                                _this.showError("Something happened wrong");
                            }
                        } catch(e) {
                            console.log(e);
                            _this.showError("Something happened wrong");
                        }
                    });

                    obj.form.target = 'upload_target';

                    //show loading
                    _this.g.warn("Processing...", {
                        life: 2
                    });

                    obj.form.submit();
                    return true;

                } else {
                    //use ajax

                    var url	 = 	obj.form.action;
                  //  var subcribeurl  =  jQuery(obj.form).attr('data-subscribeurl');
                    data =	obj.form.serialize();
					var $j = jQuery.noConflict();
                    new Ajax.Request(url, {
                        method		: 'post',
                        postBody	: data,
                        onCreate	: function() {
							if( url.search('checkout/cart/add') != -1 || url.search('checkout/cart/delete') != -1) {
								var $j = jQuery.noConflict();
								$j('#addtooverlay').show();
							}
							else
							{
								_this.g.warn("Processing...", {
									life: 2
								});
							}	
                        },
                        onSuccess	: function(response) {
                            // Handle the response content...
                            try{
                                var res = response.responseText.evalJSON();

                                if(res) {
                                    if(res.qtyerror)
                                    { 
                                       var $q = jQuery.noConflict();
                                        _this.showSuccess(res.message);
                                        $q('#addtooverlay').hide();
                                        return false;
                                    }  
                                    if(res.r == 'success') {
                                        if(res.message) {
                                            _this.showSuccess(res.message);
                                        } else {
                                            _this.showSuccess('Item was successfully added to cart.');
                                        }

                                        //update all blocks here
                                        _this.updateBlocks(res.update_blocks);
										
										// By Hardik
										var $j = jQuery.noConflict();
										//$j('.'+res.sku+'-del').
										if( url.search('checkout/cart/add') != -1 ) {
											if ($j('.'+res.sku+'-del')[0]){
											// Do something if class exists
												obj.form.action = $j('#'+res.sku+'-del').attr('href');
												$j('.'+res.sku+'-addto').hide();
												$j('.'+res.sku+'-addremove').show();
												$j('#addtooverlay').hide();
											}
										}else if(url.search('checkout/cart/delete') != -1)
										{
											obj.form.action = $j('#'+res.sku+'-addtourl').attr('value');
											$j('.'+res.sku+'-addremove').hide();
											$j('.'+res.sku+'-addto').show();
											$j('#addtooverlay').hide();
										}
                                        else if(url.search('outofstocksubscription/') != -1)
                                        {
                                            
                                            $j('#subscription_email').attr('value','');
                                        }
										$j('#addtooverlay').hide();
                                        
										if($j('#is_paypal').attr('value') == 1)
										{
											window.location.href = $j('#pp_checkout_url').attr('value');
										}
                                    } else {
                                        if(typeof res.messages != 'undefined') {
											var $j = jQuery.noConflict();
											$j('#addtooverlay').hide();
                                            _this.showError(res.messages);
                                        } else {
                                            _this.showError("Something happened wrong");
                                        }
                                    }
                                } else {
                                    _this.showError("Something happened wrong");
                                }
                            } catch(e) {
                                console.log(e);
                                _this.showError("Something happened wrong");
                            }
                        }
                    });
                }
            }
        } catch(e) {
            console.log(e);
            if(typeof obj == 'string') {
                window.location.href = obj;
            } else {
                document.location.reload(true);
            }
        }
    },
    
    getConfigurableOptions: function(url) {
        var _this = this;
        new Ajax.Request(url, {
            onCreate	: function() {
                _this.g.warn("Processing...", {
                    life: 2
                });
            },
            onSuccess	: function(response) {
               
                try{
                    var res = response.responseText.evalJSON();
                    if(res) {
                        if(res.r == 'success') {
                            
                            //show configurable options popup
                            _this.showPopup(res.configurable_options_block);

                        } else {
                            if(typeof res.messages != 'undefined') {
                                _this.showError(res.messages);
                            } else {
                                _this.showError("Something happened wrong");
                            }
                        }
                    } else {
                        document.location.reload(true);
                    }
                } catch(e) {
                window.location.href = url;
               
                }
            }
        });
    },

    showSuccess: function(message) {
        this.g.info(message, {
            life: 2
        });
    },

    showError: function (error) {
        var _this = this;

        if(typeof error == 'string') {
            _this.g.error(error, {
                life: 2
            });
        } else {
            error.each(function(message){
                _this.g.error(message, {
                    life: 2
                });
            });
        }
    },

    addSubmitEvent: function () {

        if(typeof productAddToCartForm != 'undefined') {
            var _this = this;
            productAddToCartForm.submit = function(url){
                if(this.validator && this.validator.validate()){
                    _this.ajaxCartSubmit(this);
                }
                return false;
            }

            productAddToCartForm.form.onsubmit = function() {
                productAddToCartForm.submit();
                return false;
            };
        }
    },

    updateBlocks: function(blocks) {
        var _this = this;

        if(blocks) {
            try{
                blocks.each(function(block){
                    if(block.key) {
                        var dom_selector = block.key;
                        if($$(dom_selector)) {
                            $$(dom_selector).each(function(e){
                                $(e).update(block.value);
                            });
                        }
                    }
                });
                _this.bindEvents();
                _this.bindNewEvents();
                truncateOptions();
            } catch(e) {
                console.log(e);
            }
        }

    },
    
    bindNewEvents: function() {
       
        if (typeof(jQuery) != undefined) {

            var $j = jQuery.noConflict();
            var skipContents = $j('.skip-content');
            var skipLinks = $j('.skip-link');

            if (typeof(skipContents) != undefined && typeof(skipLinks) != undefined) {
                
                skipLinks.on('click', function (e) {
                    e.preventDefault();

                    var self = $j(this);
                    var target = self.attr('href');

                    // Get target element
                    var elem = $j(target);

                    // Check if stub is open
                    var isSkipContentOpen = elem.hasClass('skip-active') ? 1 : 0;

                    // Hide all stubs
                    skipLinks.removeClass('skip-active');
                    skipContents.removeClass('skip-active');

                    // Toggle stubs
                    if (isSkipContentOpen) {
                        self.removeClass('skip-active');
                    } else {
                        self.addClass('skip-active');
                        elem.addClass('skip-active');
                    }
                });

                $j('#header-cart').on('click', '.skip-link-close', function(e) {
                    var parent = $j(this).parents('.skip-content');
                    var link = parent.siblings('.skip-link');

                    parent.removeClass('skip-active');
                    link.removeClass('skip-active');

                    e.preventDefault();
                });
            }
        }
    },
    
    showPopup: function(block) {
        try {
            var _this = this;
            var element = new Element('div', {
                id: 'modalboxOptions',
                class: 'product-view'
            }).update(block);
            
            var viewport = document.viewport.getDimensions();
            Modalbox.show(element,
            {
                title: 'Please Select Product Options', 
                width: 510,
                height: viewport.height,
                afterLoad: function() {
                    _this.extractScripts(block);
                    _this.bindEvents();
                }
            });
        } catch(e) {
            console.log(e)
        }
    },
    
    extractScripts: function(strings) {
        var scripts = strings.extractScripts();
        scripts.each(function(script){
            try {
                eval(script.replace(/var /gi, ""));
            }
            catch(e){
                console.log(e);
            }
        });
    }

};

var oldSetLocation = setLocation;
var setLocation = (function() {
    return function(url){
        if( url.search('checkout/cart/add') != -1 ) {
           
            ajaxaddtocart.ajaxCartSubmit(url);
        } else if( url.search('checkout/cart/delete') != -1 ) {
            ajaxaddtocart.ajaxCartSubmit(url);
        } else if( url.search('options=cart') != -1 ) {
           
            url += '&ajax=true';
            ajaxaddtocart.getConfigurableOptions(url);
        } else {
            oldSetLocation(url);
        }
    };
})();

setPLocation = setLocation;

document.observe("dom:loaded", function() {
    ajaxaddtocart.initialize();
});