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
      this.elems = $("#qunit-fixture").children(".qunit-container")
      # alas sinon's fakeserver does not play nice with jsonp
      # this.server = sinon.fakeServer.create()
      # responseBody =
      #   status: "ok",
      #   prices:
      #     btc:
      #       ask: "668.5",
      #       bid: "640",
      #       last: "670"
      # this.response =
      #   status: 200
      #   headers:
      #     "Content-Type": "application/json"
      #   body: JSON.stringify responseBody
      return

    # teardown: ->
    #   this.server.restore()
    #   return

  # all jQuery plugins must be chainable.
  test "is chainable", ->
    strictEqual this.elems.coinspotCurrentPrices(), this.elems, "should be chainable"
    # console.debug this.server.requests
    # this.server.requests[0].respond this.response.status, this.response.headers, this.response.body
    # equal this.server.requests[0].url, "https://www.coinspot.com.au/pubapi/latest", "expected the ajax call to be to coinspot's public api"
    # equal this.server.requests.length, 1, "expected only one ajax call."
) jQuery
