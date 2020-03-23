Geocoding in R
================

# Geocoding

**Geocoding** is taking an address (e.g. 1600 Pennsylvania Ave NW,
Washington DC 20500) or a name of a place (e.g. The White House) and
turning it into a geographic position on the earth’s surface. Commonly,
the cooridinate system is longitude and latitude but there are other
[potential coordinate
systems](https://pro.arcgis.com/en/pro-app/help/data/geocoding/introduction-to-finding-places-on-a-map.htm)
that can be used.

There are many different types of locations one can geocode including:
1. Cities 2. Landmarks 3. Geographic Locations \* Mountains \* Rivers 3.
Addresses \* Street Intersections \* House Numbers with street names \*
Postal Codes

There are multiple ways to geocode. For instance, you could find the
corrdinates of the Empire State building by flying to New York, riding
an elevator to the top of the building, and then using your GPS to get
the latitiude and longitude of where you were standing. A much more
efficient way of geocoding is through **interpolation**. Interpolation
uses other known geocoded locations to estimate the coordinates of the
data that you wish to geocode. A computer uses an algorithm and the
closest known geocodes to conduct this interpolation. However, the
farther the “closest” known geocodes are to the data you are trying to
geocode the less *accurate* the geocoding process is.
[smartystreets](https://smartystreets.com/articles/what-are-geocodes), a
geocode platform, has a good explanation of this.

Additionally, **Reverse Geocoding** takes a latitude-longitude pair (or
other global coordinates) and converts it into an address or a place.
Depending on the data that is available reverse geocoding can be very
useful. Similar to regular geocoding, reverse geocoding uses other known
reverse geocoded locations to estimate the address of the inputted
coordinates.

## The Geocoding Process

Whenever you geocode data there is a 3 step process that is undergone:

  - **Step 1: Input Data** Descriptive or textual data is inputted to
    yield a desired corresponding spatial data
  - **Step 2: Classification of Input Data** Input data is sorted into
    two groups *relative input data* and *absolute data*
  - **Step 3A: Relative Input Data** Relative input data is the
    non-preferred type of data (most geocoding reject relative input
    data). Relative data are textual descriptions of locations that
    cannot be converted into precise spatial data on their own. Instead
    they are dependent on a other reference locations. For example,
    “across the street from the White House” has to use “the White
    House” as a reference point and then deduce what “across the street”
    means.
  - **Step 3B: Absolute Data** This is the sweet sweet data that
    geocoding platforms love. A spatial coordinate (lon, lat) can be
    defined for this data independently of other reference points.
    Examples: USPS ZIP codes; complete and partial postal addresses; PO
    boxes; cities; counties; intersections; and named places

## Why is geocoding helpful?

Odds are if you are on this page then you already have a reason to use
geocoding, but here is a brief motivation for how geocoding can help
with a project. Geocoding is helpful when you want to do spatial work.
For example, maybe you have data on voter addresses and want to
visualize party allegiance. Perhaps, you are wondering who is affected
by a certain watershed. If you are limited to postal addresses without
being able to visualize the actual location of those addresses the
inference is limited. Commuter habits, crime trends, pandemic evolution,
and (fill in your example here) analyses are all improved with
geocoding. Thanks, geocoding\!

There are many different geocoding platforms. This page will talk about
[Geocodio](https://www.geocod.io/) and how to use the Goecodio platform
in **R studio**.

### Geocodio

[Geocodio’s website](https://www.geocod.io/) is very straight forward,
but I will briefly walk through the porcess:

1.  Start by making an account. This account will allow you to do your
    geocoding with Geocodio as well as get a Geocodio API which we can
    use in R studio.

2.  To geocode on the website you can either upload a spreadsheet or
    copy and paste addresses into the input window. I highly recommend a
    spreadsheet which takes a [specific
    format](https://www.geocod.io/guides/preparing-your-spreadsheet/)

3.  Geocodio will ask you to make edits if the data you have provided
    isn’t accurate enough

4.  Once your data is in satisfactory form Geodio allows you to make
    *appends* which allows you to include information pertaining to the
    addresses you wish to geocode (e.g. what State Legislative District
    the address is in or Census ACS Demographic information for the
    addresses you are geocoding)

5.  Finally Geocodio will geocode your addresses and return a
    downloadable csv file. The cost and the time of this process depends
    on the size of your data. For example, 250,000 addresses can be
    geocoded for $123.75 and will take about an hour to process. For
    estimates of both cost and time click
    [here](https://www.geocod.io/pricing/)

### rgeocodio

rgeocodio allows you to access the Geocodio platform in R studio.
Instead of the steps mentioned above you can use the rgeocodio to
perform the same functions.

In order to install `rgeocodio` you will need to load the `devtools`
package. Install it if you haven’t already
`install.packages("devtools")`. Once `devtools` is loaded
run:`devtools::install_github('hrbrmstr/rgeocodio')`.

rgeocodio uses an API that you can get from the geocodio website. To get
an API visit [geocodio’s website](https://www.geocod.io/features/api/).
Then save it in your **Renviron**.

To save the API in your **Renvrion**: 1. Open the **Renviron** by
running `usethis::edit_r_environ()` 2. Once you are in the **Renviron**
name and save the API you got from Geocodio. Maybe something like:

``` r
#geocodio_API = 'your api`
```

3.  Save your **Renviron** and then restart your R session just to be
    sure that the API is saved.

Now that you have your API saved in R you still need to authorize the
API in your R session. Do so by running `gio_auth()`.

A quick note, `force` makes you se a new geocodio API key for the
current environment. In general you will want to run `force=F`. Lets try
a regeocodio example. Say you want to get the coordinates of the White
House. You could run:

``` r
rgeocodio::gio_geocode('1600 Pennsylvania Ave NW, Washington DC 20500')
```

    ## # A tibble: 2 x 16
    ##   formatted_addre… accuracy accuracy_type source number street suffix
    ##   <chr>               <dbl> <chr>         <chr>  <chr>  <chr>  <chr> 
    ## 1 1600 Pennsylvan…      1   rooftop       City … 1600   Penns… Ave   
    ## 2 1600 Pennsylvan…      0.7 rooftop       City … 1600   Penns… Ave   
    ## # … with 9 more variables: postdirectional <chr>, formatted_street <chr>,
    ## #   city <chr>, county <chr>, state <chr>, zip <chr>, country <chr>,
    ## #   location_lat <dbl>, location_lng <dbl>

Most of these variables are intuitive but I want to spend a few seconds
on **accuracy** and **accuracy type** which we can learn more about
[here](https://www.geocod.io/docs/#accuracy-score).

1.  Accuracy: because geocodio is interpolating the output will tell you
    how confident geocodio is in its estimation. Anything below 0.8
    should be considered not accurate enough, but that is up to the
    user.

2.  Accuracy Type: interpolation uses the closest know geocodes. So if
    the closest geocodes are, for instance two ends of a street and you
    are trying to geocode a location somewhere on that street then the
    accuracy type will be “street.” In this case the accuracy type is
    “rooftop” which means the buildings on either side of the location
    were used to interpolate your query. Again,
    [smartystreets](https://smartystreets.com/articles/what-are-geocodes)
    has a good explanation of this.

What if we want to geocode a bunch of addresses at once? To geocode
multiple addresses at once we will use `gio_batch_geocode`. The data
that we enter will need to be a *character vector of addresses*.

``` r
library(readxl)
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
    ## ✓ tibble  2.1.3     ✓ dplyr   0.8.4
    ## ✓ tidyr   1.0.0     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.4.0

    ## ── Conflicts ────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
addresses<- c('Yosemite National Park, California', '1600 Pennsylvania Ave NW, Washington DC 20500', '2975 Kincaide St Eugene, Oregon, 97405')

gio_batch_geocode(addresses)
```

    ## # A tibble: 3 x 13
    ##   query response_results response_warnin… formatted_addre… city  state country
    ##   <chr> <list>           <list>           <chr>            <chr> <chr> <chr>  
    ## 1 Yose… <df[,11] [2 × 1… <chr [1]>        Yosemite Nation… Yose… CA    US     
    ## 2 1600… <df[,16] [2 × 1… <chr [1]>        1600 Pennsylvan… Wash… DC    US     
    ## 3 2975… <df[,15] [1 × 1… <chr [1]>        2975 Kincaid St… Euge… OR    US     
    ## # … with 6 more variables: number <chr>, street <chr>, suffix <chr>,
    ## #   postdirectional <chr>, formatted_street <chr>, zip <chr>

You will notice that the output is a list with dataframes of the results
embedded. There are a number of ways to extract the relevant data but
one approach would
be:

``` r
addresses<- c('Yosemite National Park, California', '1600 Pennsylvania Ave NW, Washington DC 20500', '2975 Kincaide St Eugene, Oregon, 97405')

extract_function<- function(addresses){

data<-gio_batch_geocode(addresses)
vector<- (1: length(addresses))

df_function<-function(vector){
  df<-data$response_results[vector]
  df<-df%>%as.data.frame()
}

geocode_data<-do.call(bind_rows, lapply(vector, df_function))
return(geocode_data)
}

extract_function(addresses)
```

    ##                                formatted_address accuracy accuracy_type
    ## 1               Yosemite National Park, CA 95389      1.0         place
    ## 2               Yosemite National Park, CA 95389      0.9         place
    ## 3 1600 Pennsylvania Ave NW, Washington, DC 20500      1.0       rooftop
    ## 4 1600 Pennsylvania Ave SE, Washington, DC 20003      0.7       rooftop
    ## 5              2975 Kincaid St, Eugene, OR 97405      1.0       rooftop
    ##                                          source address_components.city
    ## 1 TIGER/Line® dataset from the US Census Bureau  Yosemite National Park
    ## 2 TIGER/Line® dataset from the US Census Bureau  Yosemite National Park
    ## 3                            City of Washington              Washington
    ## 4                            City of Washington              Washington
    ## 5                                          Lane                  Eugene
    ##   address_components.county address_components.state address_components.zip
    ## 1           Mariposa County                       CA                  95389
    ## 2           Mariposa County                       CA                  95389
    ## 3      District of Columbia                       DC                  20500
    ## 4      District of Columbia                       DC                  20003
    ## 5               Lane County                       OR                  97405
    ##   address_components.country location.lat location.lng
    ## 1                         US     37.63791   -119.69465
    ## 2                         US     37.73687   -119.57266
    ## 3                         US     38.89767    -77.03655
    ## 4                         US     38.87921    -76.98198
    ## 5                         US     44.02468   -123.07878
    ##   address_components.number address_components.street address_components.suffix
    ## 1                      <NA>                      <NA>                      <NA>
    ## 2                      <NA>                      <NA>                      <NA>
    ## 3                      1600              Pennsylvania                       Ave
    ## 4                      1600              Pennsylvania                       Ave
    ## 5                      2975                   Kincaid                        St
    ##   address_components.postdirectional address_components.formatted_street
    ## 1                               <NA>                                <NA>
    ## 2                               <NA>                                <NA>
    ## 3                                 NW                 Pennsylvania Ave NW
    ## 4                                 SE                 Pennsylvania Ave SE
    ## 5                               <NA>                          Kincaid St

Reverse geocoding uses `gio_reverse` and `gio_batch_reverse`.

For `gio_reverse` you submit a longitude-latitude pair:

``` r
gio_reverse(38.89767, -77.03655)
```

    ## # A tibble: 6 x 17
    ##   formatted_addre… accuracy accuracy_type source number street suffix
    ##   <chr>               <dbl> <chr>         <chr>  <chr>  <chr>  <chr> 
    ## 1 1600 Pennsylvan…     1    rooftop       City … 1600   Penns… Ave   
    ## 2 700 Jackson Pl …     0.97 rooftop       City … 700    Jacks… Pl    
    ## 3 704 Jackson Pl …     0.97 rooftop       City … 704    Jacks… Pl    
    ## 4 1593 Pennsylvan…     0.97 nearest_stre… TIGER… 1593   Penns… Ave   
    ## 5 622 E Executive…     0.97 nearest_stre… TIGER… 622    Execu… Ave   
    ## 6 700 Jackson Pl …     0.97 nearest_stre… TIGER… 700    Jacks… Pl    
    ## # … with 10 more variables: postdirectional <chr>, formatted_street <chr>,
    ## #   city <chr>, county <chr>, state <chr>, zip <chr>, country <chr>,
    ## #   predirectional <chr>, location_lat <dbl>, location_lng <dbl>

For `gio_batch_reverse` we will submit a vector of numeric entries
ordered by c(longitude, latitude):

``` r
#make a dataset 
data<-data.frame(
  lat = c(35.9746000, 32.8793700, 33.8337100, 35.4171240),
  lon = c(-77.9658000, -96.6303900, -117.8362320, -80.6784760)
)

gio_batch_reverse(data)
```

    ## # A tibble: 29 x 17
    ##    formatted_addre… accuracy accuracy_type source number predirectional street
    ##    <chr>               <dbl> <chr>         <chr>  <chr>  <chr>          <chr> 
    ##  1 101 W Washingto…     1    rooftop       NC Ge… 101    W              Washi…
    ##  2 101 US Hwy 64 A…     1    nearest_stre… TIGER… 101    <NA>           US Hw…
    ##  3 126 US Hwy 64 A…     1    nearest_stre… TIGER… 126    <NA>           US Hw…
    ##  4 101 E Washingto…     0.99 rooftop       Nash   101    E              Washi…
    ##  5 101 W Washingto…     0.99 rooftop       Nash   101    W              Washi…
    ##  6 100 E Washingto…     0.99 rooftop       NC Ge… 100    E              Washi…
    ##  7 101 E Washingto…     0.99 rooftop       NC Ge… 101    E              Washi…
    ##  8 100 N Alston St…     0.99 nearest_stre… TIGER… 100    N              Alston
    ##  9 3034 S 1st St, …     1    rooftop       City … 3034   S              1st   
    ## 10 3034 S 1st St, …     0.99 rooftop       Dallas 3034   S              1st   
    ## # … with 19 more rows, and 10 more variables: suffix <chr>,
    ## #   formatted_street <chr>, city <chr>, county <chr>, state <chr>, zip <chr>,
    ## #   country <chr>, location_lat <dbl>, location_lng <dbl>,
    ## #   postdirectional <chr>

Notice that the output gives us multiple accuracy types.

What about geocoding the rest of the world,
chico?

``` r
rgeocodio::gio_batch_geocode('523-303, 350 Mokdongdong-ro, Yangcheon-Gu, Seoul, South Korea 07987')
```

    ## # A tibble: 1 x 8
    ##   query response_results response_warnin… formatted_addre… city  state zip  
    ##   <chr> <list>           <list>           <chr>            <chr> <chr> <chr>
    ## 1 523-… <list [0]>       <chr [1]>        Korea, GU 07987  Korea GU    07987
    ## # … with 1 more variable: country <chr>

*gasp* Geocodio only works, from my understanding, in the United States
and Canada, just like–never mind. We can use **Google’s geocoder** to do
the rest of the world.

You can use other geocode platforms like google for international stuff

## Keep in Mind

  - ACCURACY
  - BE CAREFUL TO NOT OVERRUN IT
  - THE PROJECT DETERMINES THE BEST PLATFORM FOR YOU

## Also Consider

For more resources visit the [github for
rgeocodio](https://github.com/hrbrmstr/rgeocodio).

### Google Geocode

Google’s service slightly differs from Geocodio. Google provides you
with an API which you can then use to do your geocoding (or reverse
geocoding). There are many different kinds of API’s that google provides
through [Google Cloud Platform](https://cloud.google.com/gcp/) which you
will need an account to use. For more information about Google’s geocode
platform
[here](https://developers.google.com/maps/documentation/geocoding/start)
is a good place to start. On this page I will show you how to use
Google’s geocode API in R.

  - LIST OF OTHER TECHNIQUES THAT WILL COMMONLY BE USED ALONGSIDE THIS
    PAGE’S TECHNIQUE
  - (E.G. LINEAR REGRESSION LINKS TO ROBUST STANDARD ERRORS),
  - OR INSTEAD OF THIS TECHNIQUE
  - (E.G. PIE CHART LINKS TO A BAR PLOT AS AN ALTERNATIVE)
  - WITH EXPLANATION
  - INCLUDE LINKS TO OTHER LOST PAGES WITH THE FORMAT
    [Description](https://lost-stats.github.io/Category/page_name.html).
    Categories include Data\_Manipulation, Geo-Spatial,
    Machine\_Learning, Model\_Estimation, Presentation,
    Summary\_Statistics, Time\_Series, and Other

# Implementations

## NAME OF LANGUAGE/SOFTWARE 1

`identifier for language type, see this page:
https://github.com/jmm/gfm-lang-ids/wiki/GitHub-Flavored-Markdown-%28GFM%29-language-IDs
Commented code demonstrating the technique`

## NAME OF LANGUAGE/SOFTWARE 2 WHICH HAS MULTIPLE APPROACHES

There are two ways to perform this technique in language/software 2.

First, explanation of what is different about the first way:

`identifier for language type, see this page:
https://github.com/jmm/gfm-lang-ids/wiki/GitHub-Flavored-Markdown-%28GFM%29-language-IDs
Commented code demonstrating the technique`

Second, explanation of what is different about the second way:

`identifier for language type, see this page:
https://github.com/jmm/gfm-lang-ids/wiki/GitHub-Flavored-Markdown-%28GFM%29-language-IDs
Commented code demonstrating the technique`