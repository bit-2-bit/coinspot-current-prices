(($) ->
  ###
    ======== A Handy Little QUnit Reference ========
    http://api.qunitjs.com/

    Test methods:
      module(name, {[setup][ ,teardown]})
      test(name, callback)
      expect(numberOfAssertions)
      stop(increment)
      start(decrement)
    Test assertions:
      ok(value, [message])
      equal(actual, expected, [message])
      notEqual(actual, expected, [message])
      deepEqual(actual, expected, [message])
      notDeepEqual(actual, expected, [message])
      strictEqual(actual, expected, [message])
      notStrictEqual(actual, expected, [message])
      throws(block, [expected], [message])
  ###

  module "basic tests",
  
    setup: ->
      @elems = $("#qunit-fixture").children(".qunit-container")
      @responseBody =
        status: "ok"
        prices:
          btc:
            ask: "668.5",
            bid: "640",
            last: "670"
      jsonpWrapper =
        query:
          count: 1
          created: new Date().toISOString()
          results:
            body: JSON.stringify this.responseBody
      deferred = $.Deferred()
      deferred.resolveWith(null, [jsonpWrapper])
      stub = sinon.stub($, "getJSON").returns deferred
      return

    teardown: ->
      $.getJSON.restore()
      return

  # do a bunch of tests in one go
  test "is chainable, getJSON is called once, and 'price-change' event is triggered", ->
    $(document).on "price-change", (evt, prices) =>
      equal prices.btc.ask, @responseBody.prices.btc.ask, "expected correct btc ask price"
      equal prices.btc.bid, @responseBody.prices.btc.bid, "expected correct btc bid price"
      equal prices.btc.last, @responseBody.prices.btc.last, "expected correct btc last price"
    strictEqual @elems.coinspotCurrentPrices(), @elems, "should be chainable"
    equal $.getJSON.calledOnce, true, "expected $.getJSON to be called"
    expect 5
) jQuery
