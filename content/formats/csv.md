---
title: "CSV Data Format"
---

The CSV (Comma-Separated Values) format is simple and commonly supported.
One line of text represents a holiday, and within each line, the fields are surrounded by double quotes (`"`) and separated by commas (`,`).
The quotes allow the holiday descriptions to themselves contain commas.

* The first line of data contains the field names, in the same format.
* Empty fields are represented by `""`.
* All data is provided in UTF-8.

## Example
```bash

  "locale","region","date","description","type","notes"
  "en-US","","2011-01-01","New Year's Day","NF",""
  "en-US","","2011-01-17","Birthday of Martin Luther King, Jr.","V",""

```

## Fields

* **locale** is a combination of an [ISO 639-1 language code](https://en.wikipedia.org/wiki/ISO_639-1), such as `en` (English), and an [ISO 3166-1 alpha-2 country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), such as `US` (United States), separated by a hyphen: e.g. `en-US`.

* **region** is a subdivision of locale, for those locales that have regional holidays.
  Regions are represented by their respective [ISO 3166-2 Country subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2).
  For example, Patriot's Day is only observed in the `en-US` locale in Massachusetts (`MA`) and Maine (`ME`), so there are entries for each of those states.

* **date** is provided in `YYYY-MM-DD` format.

* **description** is text that simply describes the holiday.

* **type** is a collection of single-character indicators, that describe the holiday:
  * `N` means national holiday, which means locale-wide.
  * `R` means it is a religious holiday.
  * `F` means the holiday date is fixed, i.e. on the same day each year.
  * `V` means the holiday date is variable, e.g. tied to a Monday, or the third Thursday of a month.

* **notes** are provided in some cases for clarification, but are not to be used as part of the holiday description.
