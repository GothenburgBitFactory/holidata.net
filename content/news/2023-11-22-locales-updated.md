---
title: "Locales updated"
date: 2023-11-22T00:00:00+02:00
layout: "news_item"
---

We have updated the sorting in some of our locales.
<!--more-->
The update of the holidata library (see [#97](https://github.com/GothenburgBitFactory/holidata/pull/97)) brought also a change in the sorting of the holiday data.
Previously, the data was only sorted by date and was therefore somewhat dependent on the call order during the creation process.
Now the sorting is done first by date, then by name, and finally by region.

This has changed the order, but not the content, of (some of) the years for locales of countries `AT`, `BR`, `CA`, `CZ`, `DK`, `ES`, `RU`, and `TR`.
