---
title: "Locales updated"
date: 2024-06-02T00:00:00+02:00
layout: "news_item"
---

We have fixed some errors in the `DE` and `US` locales.
<!--more-->

We fixed the region code for Bremen in the `DE` locale (see [#103](https://github.com/GothenburgBitFactory/holidata/issues/103)).
Now, it is correctly listed as `HB` as specified in [ISO 3166-2:DE](https://en.wikipedia.org/wiki/ISO_3166-2:DE).  
Thanks to Olaf Sebelin for spotting that error.

We also fixed the calculation of the *Day after Thanksgiving* in the `US` locales (see [#102](https://github.com/GothenburgBitFactory/holidata/issues/102)).
The 4th Friday is not always after the 4th Thursday in a month... 😅  
Thanks to Peter J. Mello for reporting.

Those fixes not only affected 2024, but also some past holiday files which have been updated accordingly.
