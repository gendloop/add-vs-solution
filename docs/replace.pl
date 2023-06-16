use strict;
use warnings;

my $input_file = shift @ARGV;
my $output_file = shift @ARGV;

open my $fh_in, '<', $input_file or die "Cannot open input file: $!";
my $content = do { local $/; <$fh_in> };
close $fh_in;

$content =~ s/NewProject/OldProject/g;

open my $fh_out, '>', $output_file or die "Cannot open output file: $!";
print $fh_out $content;
close $fh_out;
