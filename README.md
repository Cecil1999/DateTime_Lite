## This was NOT made to be actually used in any environment just something I thought about making since DateTime module is huge. Plus a stupid bet.

In my workplace environment we use a lot of DateTime->last_day_of_month/math functions to then pass a date custom web templating tool.

Then I stupidly challenged my friend that I could complete a lite version of said module. 

*I regret that tremendously* 

# WARNINGS:

#### This was made as a joke, nothing more. Do not use this in any professional environment as a replacement to DateTime, Localtime or any other time

#### I am not going to claim that this is completely 100% accurate. If you want split second accuracy use DateTime or another tested module on CPAN

#### Likely no updates are going to be added to this.

--------

### Addressing the weird epoch_seconds for month/year

Because I wanted to try and get this to be as accurate as possible this does keep track of lost epoch seconds for new years

This is the chart which I based the values off [Epoch Seconds Chart](https://www.epochconverter.com/)

### Testing

I've created A 'test' file for examples on how to use the module
