(($) ->

  # Main jQuery Collection method.
  $.fn.coinspotCurrentPrices = (options) ->
    opts = $.extend true, {}, $.fn.coinspotCurrentPrices.options
    @options = if typeof options is "object"
      $.extend(true, opts, options)
    else
      opts
    @each ->
      $this = $(@)
  
      # TODO: do pluginy stuff with $this
  
      return $this # because it's chainable.

  # defaults
  $.fn.coinspotCurrentPrices.options =
    currency: "DOGE"
) jQuery
