/**
 * PrinterJS v1.0.0
 * 2015, Sergii Luchko, http://best-web-creation.com/
 */
var Printer = (function ($) {
    'use strict';

    var _loadStylesPromise;
    var _iframe = window.frames['printer'];

    return {
        /**
         * Print HTML element
         * @param {Object} element
         */
        printEl: function (element) {
            _ensureStylesAreReady().then(function () {
                _insertElementIntoFrame(element);

                // calling print of iframe
                _iframe.window.focus();
                _iframe.window.print();

                // clear printer content
                $(_iframe.document.body).empty();
            });
        }
    };

    // Preloading styles to iframe
    function _ensureStylesAreReady() {
        // load only once, if they were not loaded yet
        if (!_loadStylesPromise) {

            // load styles from links
            var links = $('head link[rel="stylesheet"]');
            var promises = links.map(function (index, el) {
                return $.get(el.href).done(function (data) {
                    // when style loaded - let's add it to page
                    _appendStyle2Head(data);
                });
            });
            _loadStylesPromise = $.when.apply($, promises);

            // grab styles from head
            var styles = $('head style');
            styles.each(function (index, el) {
                _appendStyle2Head(el.innerHTML);
            });
        }

        return _loadStylesPromise;
    }

    // Insert STYLE tag with styles into iframe's head
    function _appendStyle2Head(data) {
        
    }

    // Insert element into iframe
    function _insertElementIntoFrame(element) {
        var body = $(_iframe.document.body);

        body.empty();
        body.append(element.clone());
    }

})(window.jQuery);
