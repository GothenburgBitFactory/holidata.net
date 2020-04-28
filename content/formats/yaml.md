---
title: "YAML Data Format"
---

The YAML data format (YAML Ain't Markup Language) is a human-friendly universal data serialization format.
See [http://yaml.org](https://yaml.org) for a complete description.

Fields are not quoted, and empty fields are represented by the omission of values.

All data is provided in UTF-8.

## Example
```yaml

  %YAML 1.1
  ---
    holiday:
      locale: en-US
      region: 
      date: 2012-01-01
      description: New Year's Day
      type: NF
      notes: 
   ...

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
