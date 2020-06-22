---
title: "Locales updated"
date: 2020-06-22T00:00:00+02:00
layout: "news_item"
---

We are making progress - not only by adding new locales but also by adding tests to our python package.
<!--more-->
With these tests we have discovered some inconsistencies in the present holiday files:
Holidays without regions defined are nationwide and thus should have the flag `N` and vice versa.

The affected locales 
`de-AT` ([#51](https://github.com/GothenburgBitFactory/holidata/issues/51))
`nl-NL` ([#52](https://github.com/GothenburgBitFactory/holidata/issues/52))
`de-DE` ([#53](https://github.com/GothenburgBitFactory/holidata/issues/53))
`de-CH` ([#54](https://github.com/GothenburgBitFactory/holidata/issues/54))
and `en-US`/`es-US` ([#55](https://github.com/GothenburgBitFactory/holidata/issues/55)) 
have been corrected, and the datafiles updated.
See the linked github issues for more details.