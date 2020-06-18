#!/bin/bash

if [ -d data ]; then
    echo -e "Make a backup of data directory..."
    cp -vrf data data.bak
else
    echo -e "Create data directory..."
    mkdir data
fi

echo -e "Update data files..."

echo -e "Confirmed cases"
curl -sL https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv -o data/time_series_covid19_confirmed_global.csv

echo -e "Recovered cases"
curl -sL https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv -o data/time_series_covid19_recovered_global.csv

echo -e "Death cases"
curl -sL https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv -o data/time_series_covid19_deaths_global.csv

echo -e "Done."
