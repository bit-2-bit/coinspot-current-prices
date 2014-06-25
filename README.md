coinspotCurrentPrices
=====================

A jQuery Plugin that extracts current prices from
[the Coinspot API](https://www.coinspot.com.au/api) and displays them within the element you specify.

Uses Yahoo's YQL to supply the API with a JSONP callback handler.

### First

Assuming you have `Node.js` installed.

```bash
npm install
```

## To Test

```bash
grunt test
```

## To Build

```bash
grunt
```

This will output the final distribution files into the `dist/` folder, prefixed with `jquery` and suffixed with the version number you specify in `package.json`.

Files created are:

* `jquery-coinspotCurrentPrices.0.1.3.js` - the 'developer' version.
* `jquery-coinspotCurrentPrices.0.1.3.min.js` The minified version for production use.
* `jquery-coinspotCurrentPrices.0.1.3.min.map` The `sourcemap` file for debugging using the minified version.

## To use

See the example.

