(($) ->

  PRICE_FIELDS = ["bid", "ask", "last"]

  class PriceLoader
    instance = null
    class PrivatePriceLoader
      constructor: ->
        @url = "https://www.coinspot.com.au/pubapi/latest"
        @prices = {}
        @lastLoadTime = null
        @delay = 30000
        @loading = false
        return

      loadPrices: ->
        # https://www.coinspot.com.au/pubapi/latest
        handleData = (data) =>
          if data && data.status is "ok"
            @prices = data.prices
            @lastLoadTime = new Date()
            console.debug "prices set to", @prices, "at", @lastLoadTime
            $(document).trigger "price-change", [@prices]
          else
            console.error "server returned", data
          return

        handleFail = (err) ->
          console.error err
          return

        andFinally = =>
          @loading = false
          setTimeout =>
            @loadPrices()
          , @delay
          return

        if !@loading and (@lastLoadTime is null or (@lastLoadTime - 1) + @delay <= new Date())
          @loading = true
          $.getJSON(@url).done(handleData).fail(handleFail).always(andFinally)
        return

    @get: ->
      instance ?= new PrivatePriceLoader()

  # Main jQuery Collection method.
  $.fn.coinspotCurrentPrices = (options) ->
    opts = $.extend true, {}, $.fn.coinspotCurrentPrices.options
    @options = if typeof options is "object"
      $.extend(true, opts, options)
    else
      opts
    # start loading prices.
    @loader = PriceLoader.get()
    @loader.loadPrices()
    
    @each ->
      $this = $(@)
      useVal = $this.is("input[type=text]")
      currency = $this.data("currency")
      priceField = $this.data("price")
      throw "invalid price field" if PRICE_FIELDS.indexOf(priceField) is -1
      priceMargin = if m = $this.data("margin")
        parseFloat m
      else
        1.0
      # TODO: do pluginy stuff with $this
      $(document).on "price-change", (evt, prices) ->
        price = parseFloat(prices[currency][priceField]) * priceMargin
        if useVal
          $this.val(price)
        else
          $this.text(price)
        return
      return $this # because it's chainable.

  # defaults
  $.fn.coinspotCurrentPrices.options =
    currency: "DOGE"
) jQuery
