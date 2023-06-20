#!/usr/bin/perl

use strict;
use warnings;

# Initialize the world we want to see
my @world;

# Fill in our world with 100 rows of 10 elements
for my $i (1..100) {
	for my $j (1..10) {
		$world[$i][$j] = 0;
	}
}

# Create a variable to determine when our world is finished
my $done = 0;

# Keep looping until our world is filled out
while (!$done) {

	# Pick a random row and element from our world
	my $rand_row = int(rand(100));
	my $rand_elem = int(rand(10));

	# If our random element is 0, fill it in
	if ($world[$rand_row][$rand_elem] == 0) {
		$world[$rand_row][$rand_elem] = 1;

		# Determine if our world is now full
		my $all_filled_in = 1;
		for my $k (1..100) {
			for my $l (1..10) {
				if ($world[$k][$l] == 0) {
					$all_filled_in = 0;
					last;
				}
			}
			if (!$all_filled_in) {
				last;
			}
		}
		$done = $all_filled_in;
	}
}

# Print out our world
for my $m (1..100) {
	for my $n (1..10) {
		print $world[$m][$n] . " ";
	}
	print "\n";
}