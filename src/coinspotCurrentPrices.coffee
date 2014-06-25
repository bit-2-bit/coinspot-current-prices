(($) ->

  PRICE_FIELDS = ["bid", "ask", "last"]

  class PriceLoader
    instance = null
    class PrivatePriceLoader
      constructor: ->
        @url = "https://www.coinspot.com.au/pubapi/latest"
        @prices = {}
        @lastLoadTime = null
        @delay = 60000
        @loading = false
        return

      loadPrices: ->
        # https://www.coinspot.com.au/pubapi/latest
        handleData = (jsonp) =>
          data = $.parseJSON(jsonp.query.results.body.p);
          if data && data.status is "ok"
            @prices = data.prices
            @lastLoadTime = new Date()
            # console.debug "prices set to", @prices, "at", @lastLoadTime
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
          query = encodeURI("select * from html where url=")
          yqlUrl = "http://query.yahooapis.com/v1/public/yql?q=#{query}\"#{@url}\"&format=json&callback=?"
          $.getJSON(yqlUrl).done(handleData).fail(handleFail).always(andFinally)
        return

    @get: ->
      instance ?= new PrivatePriceLoader()

  # Main jQuery Collection method.
  $.fn.coinspotCurrentPrices = ->
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
        # see http://stackoverflow.com/questions/3612744/javascript-remove-insignificant-trailing-zeros-from-a-number
        if useVal
          $this.val(parseFloat(price.toFixed(6)).toString())
        else
          $this.text(parseFloat(price.toFixed(6)).toString())
        return
      return $this # because it's chainable.

) jQuery
