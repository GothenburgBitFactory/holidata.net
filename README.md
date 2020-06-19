# Holidata.net

## What is holidata.net?

Holidata.net is a no-nonsense, ad-free provider of international holiday data under a Creative Commons License. 

The purpose of holidata.net is to provide a source for free, reliable, international holiday data in machine-readable form via a stable API.
The holidays are described in their native language, using UTF-8.

## API

There really isn't an API, but rather a URL convention.
Data can be obtained by using an HTTP request of the form:

    https://holidata.net/<LOCALE>/<YEAR>.<FORMAT>

This allows the user to select the `LOCALE`, `YEAR` and `FORMAT`.

* The `LOCALE` should be one of the supported locales.
* The `YEAR` should be a four-digit value no earlier than 2011.
* The `FORMAT` should be one of: `csv`, `json`, `yaml`, `xml`.

Visit [holidata.net](holidata.net) for more information.
Because the data is static content, the web server provides a status code that indicates success (200) or error (404).
