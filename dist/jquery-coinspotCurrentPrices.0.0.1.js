/*!
 * Display the latest Coinspot prices with jquery-coinspotCurrentPrices - v0.0.1 - 2014-06-24
 * https://github.com/bit-2-bit/coinspotCurrentPrices
 * Copyright (c) 2014 Dave Sag; Licensed MIT
 */
(function() {
  if (typeof jQuery !== "function") {
    throw "Expected jQuery to have been loaded before this script.";
  }

}).call(this);

(function() {
  (function($) {
    $.fn.coinspotCurrentPrices = function(options) {
      var opts;
      opts = $.extend(true, {}, $.fn.coinspotCurrentPrices.options);
      this.options = typeof options === "object" ? $.extend(true, opts, options) : opts;
      return this.each(function() {
        var $this;
        $this = $(this);
        return $this;
      });
    };
    return $.fn.coinspotCurrentPrices.options = {
      currency: "DOGE"
    };
  })(jQuery);

}).call(this);
