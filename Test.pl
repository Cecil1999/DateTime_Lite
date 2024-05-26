use FindBin;
use Time::Local qw(timelocal_posix timelocal_modern);
use POSIX 'strftime';

#Custom this to make it work.
use lib "$FindBin::Bin/lib";
use EZDate;

print "Now \n";
my $dt = EZDate->now();
print $dt->print_date(format => '%c') . "\n\n";


##### Adding testcases
print "Adding Testcases \n";
$dt->add(prop => 'min', value => 2);
print $dt->print_date(format => '%c') . "\n";
$dt->add(prop => 'day', value => 2);
print $dt->print_date(format => '%c') . "\n";
$dt->add(prop => 'week', value => 2);
print $dt->print_date(format => '%c') . "\n";
$dt->add(prop => 'month', value => 2);
print $dt->print_date(format => '%c') . "\n";
$dt->add(prop => 'year', value => 2);
print $dt->print_date(format => '%c') . "\n\n";

### Subtract (aka add negative number)
print "Subtracting Testcases \n";
$dt->add(prop => 'min', value => -2);
print $dt->print_date(format => '%c') . "\n";
$dt->add(prop => 'day', value => -2);
print $dt->print_date(format => '%c') . "\n";
$dt->add(prop => 'week', value => -2);
print $dt->print_date(format => '%c') . "\n";
$dt->add(prop => 'month', value => -2);
print $dt->print_date(format => '%c') . "\n";
$dt->add(prop => 'year', value => -2);
print $dt->print_date(format => '%c') . "\n\n";

# Last Day checks, with leap year
print "LD of month, leap year check \n";
$dt = EZDate->last_day_of_month();
print $dt->print_date(format => '%c') . "\n";
$dt = EZDate->last_day_of_month(month => 2, year => 2023);
print $dt->print_date(format => '%c') . "\n";
