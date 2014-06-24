coinspotCurrentPrices
=====================

A jQuery Plugin that extracts current prices from
[the Coinspot API](https://www.coinspot.com.au/api) and displays them within the element you specify.

## This Plugin is currently non-functional

I've just started writing it.

### First

Assuming you have `Node.js` installed.

```bash
npm install
```

## To Test

```bash
grunt test
```

Note that by default this will supress any console.log output.  To get that output as well you need to add the `--debug` flag, which also generates a lot of `phantomjs` noise.

### To Build

```bash
grunt
```

This will output the final distribution files into the `dist/` folder, prefixed with `jquery` and suffixed with the version number you specify in `package.json`.

Files created are:

* `jquery-coinspotCurrentPrices.0.0.1.js` - the 'developer' version.
* `jquery-coinspotCurrentPrices.0.0.1.min.js` The minified version for production use.
* `jquery-coinspotCurrentPrices.0.0.1.min.map` The `sourcemap` file for debugging using the minified version.

