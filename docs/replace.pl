use strict;
use warnings;

my $input_file = shift @ARGV;
my $output_file = shift @ARGV;
my $old_string = shift @ARGV;
my $new_string = shift @ARGV;

my @line_numbers = (6, 24);

open my $fh_in, '<', $input_file or die "Cannot open input file: $!";

my %lines_to_read = map { $_ => 1 } @line_numbers;
my %lines;
my $line_number = 1;
while (my $line = <$fh_in>) {  # 修正变量名错误
  if ($lines_to_read{$line_number}) {
    $lines{$line_number} = $line;
    delete $lines_to_read{$line_number};
  }

  last if not %lines_to_read;

  $line_number++;
}
close $fh_in;

for my $line_number (@line_numbers) {
  my $line = $lines{$line_number} // "";
  print "Line $line_number: $line";
}

for my $line_number (@line_numbers) {
  $lines{$line_number} =~ s/\Q$old_string\E/$new_string/g;  # 使用 \Q 和 \E 转义正则表达式
}

open my $fh_out, '>', $output_file or die "Cannot open output file: $!";
for my $line_number (1..keys %lines) {  # 使用哈希表的键来遍历
  print $fh_out $lines{$line_number};
}
close $fh_out;
