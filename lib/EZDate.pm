package EZDate;
use Function::Parameters;
use Moose;
use MooseX::Types::Moose qw(Str Int);
use Time::Local qw(timelocal_modern);
use POSIX 'strftime';
use Readonly;

has 'timestamp' => (is => 'rw'); 

# Blame timelocal_modern for 00 -> 11 for the months.
# need 08 and 09 in quotes, so going to just make them all in quotes made it look cleaner
my $month_day_hr = {
    00 => 31,
    01 => 28, 
    02 => 31,
    03 => 30,
    04 => 31,
    05 => 30,
    06 => 31,
    07 => 31,
    '08' => 30,
    '09' => 31,
    10 => 30,
    11 => 31,
};

Readonly my $epoch_time => { #READ the 'readme' for this section
    sec   => 1,
    min   => 60,
    hr    => 3600,
    day   => 86400,
    week  => 604800,
    month => 2629743,
    year  => 31556926,
};
method now () {
    # Method auto takes care of any parameters that might be passed.
    my $self = $self->new;

    $self->timestamp(time);
    return $self;
}

method last_day_of_month (Int :$month = 0, Int :$year = 0) {
    # We aren't fucking around with month 'names'. 
    # Month => 1 .. 12, year 0 .. 9999.
    # This ain't forsure going to be used in fucking year 10,000
    
    my $self = $self->new;
    ($month, $year) = split ', ', strftime('%m, %Y', localtime(time)) unless $month || $year;
    $month = sprintf('%d', $month) - 1;
    $month = "0$month" if $month > 10; #stupid timelocal_modern doesn't really like 'month 4' needs month '04'
    _check_leap_year(year => $year);
    $self->timestamp(timelocal_modern(0, 0, 0, $month_day_hr->{$month}, $month, $year));
    
    return $self;
}

method print_date(Str :$format) {
    # Strftime will report if theres an issue, method will automatically make sure that theres something in $format.
    # don't believe I need to worry about invalid values 
    return strftime $format, localtime($self->timestamp);
}
    
method add(Str :$prop, Int :$value) {
    die "Unknown type: $prop"
        unless grep { /^$prop$/ } qw(sec min day hr week month year);

    $self->timestamp($self->timestamp + $epoch_time->{$prop} * $value);

    return $self;
}

fun _check_leap_year(Int :$year) {
    if ($year % 4 != 0) { 
        $month_day_hr->{01} = 28;
        return; 
    } 
    if ($year % 100 == 0 && $year % 400 != 0) { 
        $month_day_hr->{01} = 28;
        return; 
    }

    $month_day_hr->{01} = 29;
    return;
}

;1;
