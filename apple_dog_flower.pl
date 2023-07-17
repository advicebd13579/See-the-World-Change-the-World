#!/usr/bin/perl

use strict;
use warnings;

#declare necessary variables
my $name;
my $city;
my $country;
my $continent;

#prompt user for input
print "What is your name?\n";
$name = <STDIN>;

print "Enter the name of a city you want to visit:\n";
$city = <STDIN>;

#find and concise the country/continent of the chosen city
if ($city == 'New York') {
	$country = 'United States';
	$continent = 'North America';
} elsif ($city == 'London') {
	$country = 'United Kingdom';
	$continent = 'Europe';
} elsif ($city == 'Rome') {
	$country = 'Italy';
	$continent = 'Europe';
} elsif ($city == 'Paris') {
	$country = 'France';
	$continent = 'Europe';
} elsif ($city == 'Tokyo') {
	$country = 'Japan';
	$continent = 'Asia';
} elsif ($city == 'Beijing') {
	$country = 'China';
	$continent = 'Asia';
} elsif ($city == 'Canberra') {
	$country = 'Australia';
	$continent = 'Oceania';
} else {
	$country = 'unknown';
	$continent = 'unknown';
}

#print out results
print "$name, you want to visit $city, which is in $country, located in $continent.\n";

#calculate cost of a vacation to chosen city
my $cost;
if ($continent == 'North America') {
	$cost = 2000;
} elsif ($continent == 'South America') {
	$cost = 1500;
} elsif ($continent == 'Europe') {
	$cost = 3000;
} elsif ($continent == 'Africa') {
	$cost = 2500;
} elsif ($continent == 'Asia') {
	$cost = 1800;
} elsif ($continent == 'Oceania') {
	$cost = 2000;
} else {
	$cost = 0;
}

print "The cost of a vacation to $city is approximately \$$cost.\n";

#provide helpful tips and resources on how to save money
print "You can save money on a vacation to $city by:\n";
print "- Booking flights during off-peak times or using discount sites like Expedia\n";
print "- Looking for deals on websites like Groupon and eBay\n";
print "- Choosing a less expensive hotel or hostel\n";
print "- Eating at street markets or local restaurants instead of higher-end options\n";
print "- Investing in transportation passes or car rentals instead of taking taxis\n";
print "- Making a budget and sticking to it\n";
print "- Joining a tour group (if available)\n";

#farewell
print "Happy travels, $name!\n";