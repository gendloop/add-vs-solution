use strict;
use warnings;

my $input_file = shift @ARGV;
my $output_file = shift @ARGV;
my $old_string = shift @ARGV;
my $new_string = shift @ARGV;

open my $fh_in, '<', $input_file or die "Cannot open input file: $!";
my @content = do { local $/; <$fh_in> };
close $fh_in;

foreach my $index (6, 24) {
  @content[$index] =~ s/\Q$old_string\E/$new_string/g;
}

open my $fh_out, '>', $output_file or die "Cannot open output file: $!";
print $fh_out @content;
close $fh_out;
