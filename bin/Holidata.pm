#! /usr/bin/perl
################################################################################
## holidata.net - data generator
##
##   Scans a specified directory for authoritative CSV files and generates a
##   text and an HTML summary table.
##
## Copyright 2011 - 2016, Göteborg Bit Factory.
## All rights reserved.
##
################################################################################

use strict;
use warnings;

package Holidata;

# Data from http://www.iso.org/iso/list-en1-semic-3.txt
# Last updated 2012-01-08.
our %country =
(
  'AF' => "AFGHANISTAN",
  'AX' => "ÅLAND ISLANDS",
  'AL' => "ALBANIA",
  'DZ' => "ALGERIA",
  'AS' => "AMERICAN SAMOA",
  'AD' => "ANDORRA",
  'AO' => "ANGOLA",
  'AI' => "ANGUILLA",
  'AQ' => "ANTARCTICA",
  'AG' => "ANTIGUA AND BARBUDA",
  'AR' => "ARGENTINA",
  'AM' => "ARMENIA",
  'AW' => "ARUBA",
  'AU' => "AUSTRALIA",
  'AT' => "AUSTRIA",
  'AZ' => "AZERBAIJAN",
  'BS' => "BAHAMAS",
  'BH' => "BAHRAIN",
  'BD' => "BANGLADESH",
  'BB' => "BARBADOS",
  'BY' => "BELARUS",
  'BE' => "BELGIUM",
  'BZ' => "BELIZE",
  'BJ' => "BENIN",
  'BM' => "BERMUDA",
  'BT' => "BHUTAN",
  'BO' => "BOLIVIA, PLURINATIONAL STATE OF",
  'BQ' => "BONAIRE, SINT EUSTATIUS AND SABA",
  'BA' => "BOSNIA AND HERZEGOVINA",
  'BW' => "BOTSWANA",
  'BV' => "BOUVET ISLAND",
  'BR' => "BRAZIL",
  'IO' => "BRITISH INDIAN OCEAN TERRITORY",
  'BN' => "BRUNEI DARUSSALAM",
  'BG' => "BULGARIA",
  'BF' => "BURKINA FASO",
  'BI' => "BURUNDI",
  'KH' => "CAMBODIA",
  'CM' => "CAMEROON",
  'CA' => "CANADA",
  'CV' => "CAPE VERDE",
  'KY' => "CAYMAN ISLANDS",
  'CF' => "CENTRAL AFRICAN REPUBLIC",
  'TD' => "CHAD",
  'CL' => "CHILE",
  'CN' => "CHINA",
  'CX' => "CHRISTMAS ISLAND",
  'CC' => "COCOS (KEELING) ISLANDS",
  'CO' => "COLOMBIA",
  'KM' => "COMOROS",
  'CG' => "CONGO",
  'CD' => "CONGO, THE DEMOCRATIC REPUBLIC OF THE",
  'CK' => "COOK ISLANDS",
  'CR' => "COSTA RICA",
  'CI' => "CÔTE D'IVOIRE",
  'HR' => "CROATIA",
  'CU' => "CUBA",
  'CW' => "CURAÇAO",
  'CY' => "CYPRUS",
  'CZ' => "CZECH REPUBLIC",
  'DK' => "DENMARK",
  'DJ' => "DJIBOUTI",
  'DM' => "DOMINICA",
  'DO' => "DOMINICAN REPUBLIC",
  'EC' => "ECUADOR",
  'EG' => "EGYPT",
  'SV' => "EL SALVADOR",
  'GQ' => "EQUATORIAL GUINEA",
  'ER' => "ERITREA",
  'EE' => "ESTONIA",
  'ET' => "ETHIOPIA",
  'FK' => "FALKLAND ISLANDS (MALVINAS)",
  'FO' => "FAROE ISLANDS",
  'FJ' => "FIJI",
  'FI' => "FINLAND",
  'FR' => "FRANCE",
  'GF' => "FRENCH GUIANA",
  'PF' => "FRENCH POLYNESIA",
  'TF' => "FRENCH SOUTHERN TERRITORIES",
  'GA' => "GABON",
  'GM' => "GAMBIA",
  'GE' => "GEORGIA",
  'DE' => "GERMANY",
  'GH' => "GHANA",
  'GI' => "GIBRALTAR",
  'GR' => "GREECE",
  'GL' => "GREENLAND",
  'GD' => "GRENADA",
  'GP' => "GUADELOUPE",
  'GU' => "GUAM",
  'GT' => "GUATEMALA",
  'GG' => "GUERNSEY",
  'GN' => "GUINEA",
  'GW' => "GUINEA-BISSAU",
  'GY' => "GUYANA",
  'HT' => "HAITI",
  'HM' => "HEARD ISLAND AND MCDONALD ISLANDS",
  'VA' => "HOLY SEE (VATICAN CITY STATE)",
  'HN' => "HONDURAS",
  'HK' => "HONG KONG",
  'HU' => "HUNGARY",
  'IS' => "ICELAND",
  'IN' => "INDIA",
  'ID' => "INDONESIA",
  'IR' => "IRAN, ISLAMIC REPUBLIC OF",
  'IQ' => "IRAQ",
  'IE' => "IRELAND",
  'IM' => "ISLE OF MAN",
  'IL' => "ISRAEL",
  'IT' => "ITALY",
  'JM' => "JAMAICA",
  'JP' => "JAPAN",
  'JE' => "JERSEY",
  'JO' => "JORDAN",
  'KZ' => "KAZAKHSTAN",
  'KE' => "KENYA",
  'KI' => "KIRIBATI",
  'KP' => "KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF",
  'KR' => "KOREA, REPUBLIC OF",
  'KW' => "KUWAIT",
  'KG' => "KYRGYZSTAN",
  'LA' => "LAO PEOPLE'S DEMOCRATIC REPUBLIC",
  'LV' => "LATVIA",
  'LB' => "LEBANON",
  'LS' => "LESOTHO",
  'LR' => "LIBERIA",
  'LY' => "LIBYA",
  'LI' => "LIECHTENSTEIN",
  'LT' => "LITHUANIA",
  'LU' => "LUXEMBOURG",
  'MO' => "MACAO",
  'MK' => "MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF",
  'MG' => "MADAGASCAR",
  'MW' => "MALAWI",
  'MY' => "MALAYSIA",
  'MV' => "MALDIVES",
  'ML' => "MALI",
  'MT' => "MALTA",
  'MH' => "MARSHALL ISLANDS",
  'MQ' => "MARTINIQUE",
  'MR' => "MAURITANIA",
  'MU' => "MAURITIUS",
  'YT' => "MAYOTTE",
  'MX' => "MEXICO",
  'FM' => "MICRONESIA, FEDERATED STATES OF",
  'MD' => "MOLDOVA, REPUBLIC OF",
  'MC' => "MONACO",
  'MN' => "MONGOLIA",
  'ME' => "MONTENEGRO",
  'MS' => "MONTSERRAT",
  'MA' => "MOROCCO",
  'MZ' => "MOZAMBIQUE",
  'MM' => "MYANMAR",
  'NA' => "NAMIBIA",
  'NR' => "NAURU",
  'NP' => "NEPAL",
  'NL' => "NETHERLANDS",
  'NC' => "NEW CALEDONIA",
  'NZ' => "NEW ZEALAND",
  'NI' => "NICARAGUA",
  'NE' => "NIGER",
  'NG' => "NIGERIA",
  'NU' => "NIUE",
  'NF' => "NORFOLK ISLAND",
  'MP' => "NORTHERN MARIANA ISLANDS",
  'NO' => "NORWAY",
  'OM' => "OMAN",
  'PK' => "PAKISTAN",
  'PW' => "PALAU",
  'PS' => "PALESTINIAN TERRITORY, OCCUPIED",
  'PA' => "PANAMA",
  'PG' => "PAPUA NEW GUINEA",
  'PY' => "PARAGUAY",
  'PE' => "PERU",
  'PH' => "PHILIPPINES",
  'PN' => "PITCAIRN",
  'PL' => "POLAND",
  'PT' => "PORTUGAL",
  'PR' => "PUERTO RICO",
  'QA' => "QATAR",
  'RE' => "RÉUNION",
  'RO' => "ROMANIA",
  'RU' => "RUSSIAN FEDERATION",
  'RW' => "RWANDA",
  'BL' => "SAINT BARTHÉLEMY",
  'SH' => "SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA",
  'KN' => "SAINT KITTS AND NEVIS",
  'LC' => "SAINT LUCIA",
  'MF' => "SAINT MARTIN (FRENCH PART)",
  'PM' => "SAINT PIERRE AND MIQUELON",
  'VC' => "SAINT VINCENT AND THE GRENADINES",
  'WS' => "SAMOA",
  'SM' => "SAN MARINO",
  'ST' => "SAO TOME AND PRINCIPE",
  'SA' => "SAUDI ARABIA",
  'SN' => "SENEGAL",
  'RS' => "SERBIA",
  'SC' => "SEYCHELLES",
  'SL' => "SIERRA LEONE",
  'SG' => "SINGAPORE",
  'SX' => "SINT MAARTEN (DUTCH PART)",
  'SK' => "SLOVAKIA",
  'SI' => "SLOVENIA",
  'SB' => "SOLOMON ISLANDS",
  'SO' => "SOMALIA",
  'ZA' => "SOUTH AFRICA",
  'GS' => "SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS",
  'SS' => "SOUTH SUDAN",
  'ES' => "SPAIN",
  'LK' => "SRI LANKA",
  'SD' => "SUDAN",
  'SR' => "SURINAME",
  'SJ' => "SVALBARD AND JAN MAYEN",
  'SZ' => "SWAZILAND",
  'SE' => "SWEDEN",
  'CH' => "SWITZERLAND",
  'SY' => "SYRIAN ARAB REPUBLIC",
  'TW' => "TAIWAN, PROVINCE OF CHINA",
  'TJ' => "TAJIKISTAN",
  'TZ' => "TANZANIA, UNITED REPUBLIC OF",
  'TH' => "THAILAND",
  'TL' => "TIMOR-LESTE",
  'TG' => "TOGO",
  'TK' => "TOKELAU",
  'TO' => "TONGA",
  'TT' => "TRINIDAD AND TOBAGO",
  'TN' => "TUNISIA",
  'TR' => "TURKEY",
  'TM' => "TURKMENISTAN",
  'TC' => "TURKS AND CAICOS ISLANDS",
  'TV' => "TUVALU",
  'UG' => "UGANDA",
  'UA' => "UKRAINE",
  'AE' => "UNITED ARAB EMIRATES",
  'GB' => "UNITED KINGDOM",
  'US' => "UNITED STATES",
  'UM' => "UNITED STATES MINOR OUTLYING ISLANDS",
  'UY' => "URUGUAY",
  'UZ' => "UZBEKISTAN",
  'VU' => "VANUATU",
  'VE' => "VENEZUELA, BOLIVARIAN REPUBLIC OF",
  'VN' => "VIET NAM",
  'VG' => "VIRGIN ISLANDS, BRITISH",
  'VI' => "VIRGIN ISLANDS, U.S.",
  'WF' => "WALLIS AND FUTUNA",
  'EH' => "WESTERN SAHARA",
  'YE' => "YEMEN",
  'ZM' => "ZAMBIA",
  'ZW' => "ZIMBABWE",
);

################################################################################
# Returns an array of files generated from a recursive list of the $base
# directory argument.  Only includes files, no directories.
sub list_files
{
  my ($base) = @_;

  my @files;
  if (opendir my $dh, $base)
  {
    my @entries = grep {! /^..?$/} readdir $dh;
    closedir $dh;

    for my $entry (@entries)
    {
      my $file = $base . '/' . $entry;

      push @files, $file if -f $file;
      push @files, list_files ($file) if -d $file;
    }
  }

  return @files;
}

################################################################################
# Reads $template, replaces %%%% in template with $content, then writes $output.
sub inject
{
  my ($template, $content, $output) = @_;

  my $template_content;
  if (open my $fh, '<:encoding(UTF-8)', $template)
  {
    $template_content .= $_ while <$fh>;
    close $fh;
  }

  $template_content =~ s/%%%%/$content/g;

  if (open my $fh, '>:encoding(UTF-8)', $output)
  {
    print $fh $template_content;
    close $fh;
  }
}

################################################################################
# Returns the country name in English for a given ISO-3166-2 country code.
sub country_name
{
  my ($code) = @_;

  return '-' unless exists $country{$code};
  return join ' ',
         map {ucfirst lc}
         split /\s+/, $country{$code};
}

################################################################################
1;

