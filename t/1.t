use strict;
use warnings;

use Test::More tests => 6;
BEGIN { use_ok("Lingua::EN::FindNumber") };

ok($number_re, "Exported the regular expression");

my $text = "Fourscore and seven years ago, our four fathers...";

is(numify($text), "87 years ago, our 4 fathers...", "numify");
my @numbers = extract_numbers($text);
is_deeply(\@numbers, ["Fourscore and seven", "four"], "extract_numbers");

my $mixed_ordinals = "On the 1st day of Christmas, the 2nd, 3rd, 4th, 5th, 6th, 7th, 8th, 9th, 10th, 11th, 12th, 13TH, 14Th, 20tH, 21St, 32nD, 123Rd, 987654321st, what a blast around the bard for all his mirth. The 111st day of the 12nd month of the 2113rd year.";
is(numify($mixed_ordinals), "On the 1 day of Christmas, the 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 20, 21, 32, 123, 987654321, what a blast around the bard for all his mirth. The 111st day of the 12nd month of the 2113rd year.", "numify mixed ordinals");
my @mixed_ordinal_numbers = extract_numbers($mixed_ordinals);
is_deeply(\@mixed_ordinal_numbers, [ '1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th', '10th', '11th', '12th', '13TH', '14Th', '20tH', '21St', '32nD', '123Rd', '987654321st' ], "extract_numbers (mixed ordinals)");

my $x = $number_re; #quiet warnings
$number_re = $x;
