
<!-- README.md is generated from README.Rmd. Please edit that file -->

# UIWrangleR

<!-- badges: start -->

[![](https://www.r-pkg.org/badges/version/badger?color=green)](https://cran.r-project.org/package=badger)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://cran.r-project.org/web/licenses/MIT)

<!-- badges: end -->

The goal of UIWrangleR is to to facilitate while standardizing common
functions and processes used by the University of Idaho Advancement
Services Data Team.

## Installation

You can install the development version of UIWrangleR like so:

``` r
install.packages("devtools")
devtools::install_github("https://github.com/jwisaacson41/UIWrangleR")
```

## Functions

### `household_fix`

The `household_fix` function helps to fill in NA values with the values
of another column. The most common instance is where married individuals
will have a primary individual listed. Single individuals typically do
not have a `household_primary` ID listed as shown below.

``` r
starwars_donors[c(1:3, 90:93),] %>%
  kable() %>%
  kable_styling()
```

<table class="table" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
ï..Primary_ID
</th>
<th style="text-align:left;">
Spouse_ID
</th>
<th style="text-align:left;">
Name
</th>
<th style="text-align:left;">
Marital_Status
</th>
<th style="text-align:left;">
Address
</th>
<th style="text-align:right;">
Giving
</th>
<th style="text-align:left;">
Household_Primary
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
FAKE669261
</td>
<td style="text-align:left;">
FAKE711503
</td>
<td style="text-align:left;">
Commander Larma D’Acy
</td>
<td style="text-align:left;">
Married
</td>
<td style="text-align:left;">
6250 Han Solo Street
</td>
<td style="text-align:right;">
2118.36
</td>
<td style="text-align:left;">
FAKE669261
</td>
</tr>
<tr>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
FAKE905527
</td>
<td style="text-align:left;">
FAKE497957
</td>
<td style="text-align:left;">
Han Solo
</td>
<td style="text-align:left;">
Married
</td>
<td style="text-align:left;">
860 Clone Wars Court
</td>
<td style="text-align:right;">
3737.67
</td>
<td style="text-align:left;">
FAKE905527
</td>
</tr>
<tr>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
FAKE965069
</td>
<td style="text-align:left;">
FAKE108240
</td>
<td style="text-align:left;">
Sheev Palpatine
</td>
<td style="text-align:left;">
Married
</td>
<td style="text-align:left;">
2328 Separatist Lane
</td>
<td style="text-align:right;">
3630.90
</td>
<td style="text-align:left;">
FAKE965069
</td>
</tr>
<tr>
<td style="text-align:left;">
90
</td>
<td style="text-align:left;">
FAKE210937
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Joph Seastriker
</td>
<td style="text-align:left;">
Single
</td>
<td style="text-align:left;">
8051 Podracing Court
</td>
<td style="text-align:right;">
5120.75
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
91
</td>
<td style="text-align:left;">
FAKE710371
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Luke Skywalker
</td>
<td style="text-align:left;">
Single
</td>
<td style="text-align:left;">
2304 Jar Jar Binks Boulevard
</td>
<td style="text-align:right;">
1217.97
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
92
</td>
<td style="text-align:left;">
FAKE519043
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Leia Organa
</td>
<td style="text-align:left;">
Single
</td>
<td style="text-align:left;">
310 Knight Lane
</td>
<td style="text-align:right;">
5325.40
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
93
</td>
<td style="text-align:left;">
FAKE042091
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Depa Billaba
</td>
<td style="text-align:left;">
Single
</td>
<td style="text-align:left;">
529 Hutt Court
</td>
<td style="text-align:right;">
2431.44
</td>
<td style="text-align:left;">
</td>
</tr>
</tbody>
</table>

Using the function we can quickly reconcile the field to ensure all
individuals have a value in the `Household_Primary` column.

``` r
starwars_donors[c(1:3, 90:93),] %>%
  mutate(Household_Primary = household_fix(Household_Primary, Primary_ID)) %>%
  kable() %>%
  kable_styling()
```

<table class="table" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
ï..Primary_ID
</th>
<th style="text-align:left;">
Spouse_ID
</th>
<th style="text-align:left;">
Name
</th>
<th style="text-align:left;">
Marital_Status
</th>
<th style="text-align:left;">
Address
</th>
<th style="text-align:right;">
Giving
</th>
<th style="text-align:left;">
Household_Primary
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
FAKE669261
</td>
<td style="text-align:left;">
FAKE711503
</td>
<td style="text-align:left;">
Commander Larma D’Acy
</td>
<td style="text-align:left;">
Married
</td>
<td style="text-align:left;">
6250 Han Solo Street
</td>
<td style="text-align:right;">
2118.36
</td>
<td style="text-align:left;">
FAKE669261
</td>
</tr>
<tr>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
FAKE905527
</td>
<td style="text-align:left;">
FAKE497957
</td>
<td style="text-align:left;">
Han Solo
</td>
<td style="text-align:left;">
Married
</td>
<td style="text-align:left;">
860 Clone Wars Court
</td>
<td style="text-align:right;">
3737.67
</td>
<td style="text-align:left;">
FAKE905527
</td>
</tr>
<tr>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
FAKE965069
</td>
<td style="text-align:left;">
FAKE108240
</td>
<td style="text-align:left;">
Sheev Palpatine
</td>
<td style="text-align:left;">
Married
</td>
<td style="text-align:left;">
2328 Separatist Lane
</td>
<td style="text-align:right;">
3630.90
</td>
<td style="text-align:left;">
FAKE965069
</td>
</tr>
<tr>
<td style="text-align:left;">
90
</td>
<td style="text-align:left;">
FAKE210937
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Joph Seastriker
</td>
<td style="text-align:left;">
Single
</td>
<td style="text-align:left;">
8051 Podracing Court
</td>
<td style="text-align:right;">
5120.75
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
91
</td>
<td style="text-align:left;">
FAKE710371
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Luke Skywalker
</td>
<td style="text-align:left;">
Single
</td>
<td style="text-align:left;">
2304 Jar Jar Binks Boulevard
</td>
<td style="text-align:right;">
1217.97
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
92
</td>
<td style="text-align:left;">
FAKE519043
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Leia Organa
</td>
<td style="text-align:left;">
Single
</td>
<td style="text-align:left;">
310 Knight Lane
</td>
<td style="text-align:right;">
5325.40
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;">
93
</td>
<td style="text-align:left;">
FAKE042091
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Depa Billaba
</td>
<td style="text-align:left;">
Single
</td>
<td style="text-align:left;">
529 Hutt Court
</td>
<td style="text-align:right;">
2431.44
</td>
<td style="text-align:left;">
</td>
</tr>
</tbody>
</table>

## Data Sets
