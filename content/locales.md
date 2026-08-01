---
title: "Available Locales"
---

For each locale, Holidata provides the data for all years from 2011 to the current following year.

## How to access the data

To access the data, all you need is the correct URL which looks like this:
```html

  https://holidata.net/<LOCALE>/<YEAR>.<FORMAT>
  
```
* The `LOCALE` should be one of the supported locales (see [available locales](locales/)).
* The `YEAR` should be a four-digit value no earlier than 2011.
* The `FORMAT` should be one of: [`csv`](formats/csv/), [`json`](formats/json/), [`yaml`](formats/yaml/),  [`xml`](formats/xml/)  (see [available formats](formats/)).

Here is an example that requests the `{{< current_year >}}` holiday data for the `en-US` locale as `JSON`:
```html

  https://holidata.net/en-US/{{< current_year >}}.json
  
```

## Current locales

The table below lists the locales and formats for the current and the following year.
If a locale or format you are seeking is not listed, please [consider contributing](https://github.com/GothenburgBitFactory/holidata/blob/main/CONTRIBUTING.md) or report this using the links on the right.

{{< available_locales_table >}}
