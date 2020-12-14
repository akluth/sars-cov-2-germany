/**
 * SARS-CoV-2/COVID-19 cases in Germany
 *
 * Based on data published by the Johns Hopkins school every night at approx.
 * 23:59 UTC.
 *
 * This graph shows all confirmed, recovered and dead cases starting at
 * 22.01.2020.
 *
 * Published under the MIT license by Alexander Kluth <alex@quackiquacki.org>
 */
mode(0);
host update.sh;
clear importdata; 
 
function [header, data] = importdata(filename) 
    header = mgetl(filename, 1); 
    header = csvTextScan(header, ",", ".", "string"); 
    data = csvRead(filename, ",", ".", "string", [], [], [], 1); 
endfunction

[header, data] = importdata(pwd() + "\data\time_series_covid19_confirmed_global.csv");
[recov_header, recov_data] = importdata(pwd() + "\data\time_series_covid19_recovered_global.csv");
[death_header, death_data] = importdata(pwd() + "\data\time_series_covid19_deaths_global.csv");

confirmed = strtod(data(:,5:$));
country = data(:,2);
state = data(:,1);

recovered = strtod(recov_data(:,5:$));
recov_country = recov_data(:,2);
recov_state = recov_data(:,1);

dead = strtod(death_data(:,5:$));
dead_country = death_data(:,2);
dead_state = death_data(:,1);

germany_confirmed = confirmed(country == "Germany",:);
germany_recovered = recovered(recov_country == "Germany",:);
germany_dead = dead(dead_country == "Germany",:);

x = 1:size(germany_confirmed,'*');
plot(x,germany_confirmed,x,germany_recovered,x,germany_dead);
xticks2string(header(5:$),10)
xtitle("Germany Covid-19 Confirmed, Recovered, Death Cases","Date","Cases")
xgrid()
legend("Confirmed", "Recovered", "Dead", 2)
xs2png(0, 'plot.png');
