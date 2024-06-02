# NAME

`update-locale` - Update [holidata.net](https://holidata.net)'s holiday data files

# SYNOPSIS
```
HOLIDATA=/path/to/holidata ./update-locale [--commit] (--all-locales|LOCALE...) (--all-formats|FORMAT...) [--all-years|YEAR...]
```

# DESCRIPTION
Use the `update-locale` script to update the locale data files of [holidata.net](https://holidata.net).
The script requires the location of `holidata`, from the [holidata python module](https://github.com/GothenburgBitFactory/holidata), to be injected via the `HOLIDATA` environment variable!

For each `LOCALE` `update-locale` generates the data files (formats `csv`, `json`, `yaml`, and `xml`) for the given `YEAR`.

If the `--commit` option is given, the script creates a commit with the message _"Add holidays for `LOCALE` `YEAR`"_ for each updated locale containing the new or updated files.

# OPTIONS
* **`LOCALE`**  
  The locale(s) the data files should be generated for.
  You can specify several locales or use the `--all-locales` option to update all available locales.
* **`FORMAT`**
  The format(s) in which the data should be stored.
  You can specify several formats out of `csv`, `json`, `yaml`, and `xml`, or use the `--all-formats` option.
* **`YEAR`**  
  The year(s) for which data files should be generated for each locale.
  You can specify several years or use the `--all-years` option to update each locale for all years from 2011 to now.  
  `YEAR` can be omitted if only a single locale is given.
  In this case all present years for this locale will be updated.
* **`--all-locales`**  
  Try to update all locales found on holidata.net.  
  **Note that currently not all locales are supported by `holidata`!
  Missing locales are skipped.**
* **`--all-formats`**
  Write the output in all currently supported formats, i.e. `csv`, `json`, `yaml`, and `xml`.
* **`--all-years`**  
  Try to update locales for years from 2011 to current year.
* **`--commit`**  
  Create a git commit for each updated locale and year.  
  **Note that this option also does a cleanup of the holidata.net `html` directory:
  All untracked files and all changes in directory `html` are removed or discarded respectively!**
  
# EXAMPLES
1. Full update for all locales
   ```
   HOLIDATA=/path/to/holidata ./update-locale --commit --all-locales --all-years --all-formats
   ```
2. Update year 2023 all locales and create commits for each update
   ```
   HOLIDATA=/path/to/holidata ./update-locale --commit --all-locales 2023 --all-formats
   ```
3. Update a single locale for a given year in all formats
   ```
   HOLIDATA=/path/to/holidata ./update-locale en-US 2023 --all-formats
   ```
4. Update all present years for a single locale in all formats
   ```
   HOLIDATA=/path/to/holidata ./update-locale en-US --all-formats
   ```
5. Update year 2022 and 2023 for multiple locales in JSON format
   ```
   HOLIDATA=/path/to/holidata ./update-locale en-US de-DE 2022 2023 json
   ```
   You can specify the arguments `YEAR`, `FORMAT` and `LOCALE` in any order.
   Those three lines are thus equivalent:
   ```
   HOLIDATA=/path/to/holidata ./update-locale en-US de-DE 2023 json
   HOLIDATA=/path/to/holidata ./update-locale en-US 2023 json de-DE
   HOLIDATA=/path/to/holidata ./update-locale json 2023 de-DE en-US
   ```
