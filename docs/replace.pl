use strict;
use warnings;

my $input_file = shift @ARGV;
my $output_file = shift @ARGV;
my $old_string = shift @ARGV;
my $new_string = shift @ARGV;


open my $fh, '<', $input_file or die "Cannot open input file: $!";
my $content = do { local $/; <$fh> };
close $fh;

$content =~ s/$old_string/$new_string/g;

open $fh, '>', $output_file or die "Cannot open output file: $!";
print $fh @content;
close $fh;
