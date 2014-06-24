coinspotCurrentPrices
=====================

A jQuery Plugin that extracts current prices from
[the Coinspot API](https://www.coinspot.com.au/api) and displays them within the element you specify.

## Disclaimer

This is not currently functional as i'm waiting on Coinspot to add the JSONP callback handler.

### First

Assuming you have `Node.js` installed.

```bash
npm install
```

## To Test

Tests are currently very minimal.

```bash
grunt test
```

## To Build

```bash
grunt
```

This will output the final distribution files into the `dist/` folder, prefixed with `jquery` and suffixed with the version number you specify in `package.json`.

Files created are:

* `jquery-coinspotCurrentPrices.0.1.1.js` - the 'developer' version.
* `jquery-coinspotCurrentPrices.0.1.1.min.js` The minified version for production use.
* `jquery-coinspotCurrentPrices.0.1.1.min.map` The `sourcemap` file for debugging using the minified version.

## To use

See the example.

