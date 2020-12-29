---
title: "Welcome to Holidata"
---

Holidata.net is a no-nonsense, ad-free provider of international holiday data under a [Creative Commons License](https://creativecommons.org/licenses/by-nc-sa/3.0/).

See the [map of supported countries](map/), and the [available locales](locales/) and [formats](formats/).

## How to access the data

All you need to access the data is the correct URL, which looks like this:
```html

    http://holidata.net/<LOCALE>/<YEAR>.<FORMAT>

```
* The `LOCALE` should be one of the supported locales (see [available locales](locales/)).
* The `YEAR` should be a four-digit value no earlier than 2011.
* The `FORMAT` should be one of: [`csv`](formats/csv/), [`json`](formats/json/), [`yaml`](formats/yaml/),  [`xml`](formats/xml/)  (see [available formats](formats/)).

Here is an example that requests the `2016` holiday data for the `en-US` locale as `JSON`:
```html

    http://holidata.net/en-US/2016.json

```
