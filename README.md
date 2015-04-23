# ruby_cal
Nashville Software School exercise for implementing Zeller's Congruency in Ruby

####Cal
The Unit 1 capstone for this course is the implementation of a subset of the Unix program, cal.

####Objectives

* Practice with Arrays, Hashes, and Strings
* Develop the logic of a non-trivial algorithm
* Programming to meet a (changing) specification

####Requirements

* Your program must have tests. These test may be as high-level (integration tests) or as low-level (unit tests) as you wish. I highly recommend a mix of tests.
* You may not use any of the built-in Ruby classes that provide date, time, or calendar functionality.
* You may not use exec, Kernel, etc. to shell out to any Unix programs.
* You should not use "magic" numbers.
* You must commit your code at least once per day and push it to your github repository.
* As a capstone project for the basic Ruby portion of the course, this should demonstrate your skills. Do not share code with your peers. You can help each other think about the problems, but don't help each other code.
* Your program should accept any combination of months and years between 1800 and 3000.

####Suggested Implementation Order

* You will find this (and all future) programming projects much easier if you take the time to break it down into smaller parts. I will suggest a breakdown that works well for me:

* Implement Zeller's Congruence, with test for all of the special types of months/years.
* Implement printing a month where the first day of the month is on a Sunday. For example, January 2012. This is the easiest type of month to print and can be thought of as a base case. For this, you can temporarily hardcode the assumption that the month will start on Sunday. Of course, you will use tests for this!
* Combine the powers of your Zeller's Congruence (which will tell you the real first day of the month) with your basic month printing from step 2. Test the hell out of this!
* After you feel good about that and have had your first milestone reviewed, combine the ability to print each individual month, to allow you to print an entire year. Hint: This is all about combining strings!
####Resources:
Wikipedia articles that may be of use:

* [http://en.wikipedia.org/wiki/Cal_(Unix)]
* [http://en.wikipedia.org/wiki/Gregorian_calendar]
* [http://en.wikipedia.org/wiki/Zeller's_congruence]

Cal.rb
-----
Never print from your classes. Classes should only be responsible for
holding state. (Single responsibility principle)

Bound to 3x4 grid (matching output of Unix Cal)

No magic numbers:
    Eg:
    days_in_year = 365
    years_old = 14
    days_since_last_bday = 127
    days_old = (years_old * days_in_year + days_since_last_bday)

#### Implementing Months
* month = Month.new(ARGV[0],ARGV[1])
* puts month.to_s
* everything in month should be about representing a month
* month: Fixnum year
* Days? day_count
* start_day (delegates functionality by calling Day.new(12,1,2015) using the Day class)
* name
* to_s

#### Implementing Year
* year = Year.new(ARGV[0])
* puts year.to_s
* year: Fixnum
* to_s
* is_leap_year?
* if falls outside the allowable range, raises error in initializer

#### 3rd Class Option 1: Implementing Day Class
* knows which month, day, and year it is
* has a method days_of_the_week which returns which day of the week it
  is

#### 3rd Class Option 2: Implementing a Zellers class
* day_of_week(m,d,y)

#### Implementing integration tests
* months that start on a Sunday
* regular leap years
* century leap years
* 400 year leap years
* one test case for each month and two for February
* dates beyond the minimum date (1800)
* dates beyond the max date (3000)
* checks min and max dates
* checks test suite works
* it only accepts [month] [year]
* it can accept 04 or 4 but not "April"
* it can accept YYYY but not YY
* error cases (eg "April" instead of 04 2015 or 4 2015)
* no more than 20 test cases should be necessary


###Example month output:

         April 2015
    Su Mo Tu We Th Fr Sa
              1  2  3  4
     5  6  7  8  9 10 11
    12 13 14 15 16 17 18
    19 20 21 22 23 24 25
    26 27 28 29 30

####Example year output

                                 2015
          January               February               March
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                 1  2  3   1  2  3  4  5  6  7   1  2  3  4  5  6  7
     4  5  6  7  8  9 10   8  9 10 11 12 13 14   8  9 10 11 12 13 14
    11 12 13 14 15 16 17  15 16 17 18 19 20 21  15 16 17 18 19 20 21
    18 19 20 21 22 23 24  22 23 24 25 26 27 28  22 23 24 25 26 27 28
    25 26 27 28 29 30 31                        29 30 31

           April                  May                   June
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
              1  2  3  4                  1  2      1  2  3  4  5  6
     5  6  7  8  9 10 11   3  4  5  6  7  8  9   7  8  9 10 11 12 13
    12 13 14 15 16 17 18  10 11 12 13 14 15 16  14 15 16 17 18 19 20
    19 20 21 22 23 24 25  17 18 19 20 21 22 23  21 22 23 24 25 26 27
    26 27 28 29 30        24 25 26 27 28 29 30  28 29 30
                          31
            July                 August              September
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
              1  2  3  4                     1         1  2  3  4  5
     5  6  7  8  9 10 11   2  3  4  5  6  7  8   6  7  8  9 10 11 12
    12 13 14 15 16 17 18   9 10 11 12 13 14 15  13 14 15 16 17 18 19
    19 20 21 22 23 24 25  16 17 18 19 20 21 22  20 21 22 23 24 25 26
    26 27 28 29 30 31     23 24 25 26 27 28 29  27 28 29 30
                          30 31
          October               November              December
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                 1  2  3   1  2  3  4  5  6  7         1  2  3  4  5
     4  5  6  7  8  9 10   8  9 10 11 12 13 14   6  7  8  9 10 11 12
    11 12 13 14 15 16 17  15 16 17 18 19 20 21  13 14 15 16 17 18 19
    18 19 20 21 22 23 24  22 23 24 25 26 27 28  20 21 22 23 24 25 26
    25 26 27 28 29 30 31  29 30                 27 28 29 30 31



