### Preamble ###
# Purpose: Download data from opendatatoronto
# Author: Xiangyu Wang 
# Date: 03 Feb 2022
# Contact: xiangyu.wang@mail.utoronto.ca
# License: Open Government Licence – Toronto

#### Workspace setup ####
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("cba07a90-984b-42d2-9131-701c8c2a9788")
package

# get all resources for this package
resources <- list_package_resources("cba07a90-984b-42d2-9131-701c8c2a9788")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
death_registry <- filter(datastore_resources, row_number()==1) %>% get_resource()
death_registry