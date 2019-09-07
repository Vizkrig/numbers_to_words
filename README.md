# Project Title

Given a 10 digit phone number, the program will return all possible words or combinations of words from the provided dictionary, that can be mapped back as a whole to the number. With this we can generate numbers like 1-800-motortruck which is easier to remember than 1-800-6686787825.

The phone number mapping to letters is as follows:

2 = a b c,  
3 = d e f,  
4 = g h i,  
5 = j k l,  
6 = m n o,  
7 = p q r s,  
8 = t u v,  
9 = w x y z  

The phone numbers will never contain a 0 or 1. 
Words have to be at least 3 characters.

To give you an initial idea, here are some numbers that return (a lot of) results.

6686787825 returns a (long) list with at least these word combinations:

* motortruck
* motor, truck
* motor, usual
* noun, struck
* not, opt, puck
 
2282668687 returns a (long) list with at least these word combinations:

* catamounts
* acta, mounts
* act, amounts
* act, contour
* cat, boot, our

The conversion of a 10 digit phone number should be performed within 1000ms.
# Run tests
```
bundle exec rspec spec/mapper_test.rb
```

# Installation

Clone the repository by running the following command in a terminal

```
git clone git@github.com:Vizkrig/numbers_to_words.git
```

# Execute program
Navigate the root directory of the source folder, open a terminal and following command to set the file as executable

```
chmod +x bin/numbers_to_words.rb
```

Note: Windows users may need to install cygwin for `chmod` to work

The script can be executed by running the following
```
./bin/numbers_to_words <parameters>
```

Example: 
```
./bin/numbers_to_words 6686787825
```

# How it works

The script iterates over each digits of the phone number then using the given character map assigns the corresponding characters to each digit to get a 2d array of characters.

Afterwards the cartesian product of the arrays is done to get all combinations.

From the above result, the strings are as per lengths shown below
5 x 5
4 x 6, 6 x 4
3 x 3 x 4
3 x 4 x 3
4 x 3 x 3
3 x 7
7 x 3

From this each piece of string is searched in a dictionary to find matches, onces matches are found its added to the result array.

# Sample Output

```
viz@cryo:~/Projects/numbers_to_words$ time ./bin/number_to_words.rb 6686787825
MOT,OPT,PUCK
MOT,OPT,RUCK
MOT,OPTS,TAJ
MOT,OPT,SUCK
MOT,OPUS,TAJ
MOT,ORT,PUCK
MOTORTRUCK
MOTOR,TRUCK
MOT,ORT,RUCK
MOT,ORTS,TAJ
MOT,ORT,SUCK
MOTOR,USUAL
NOT,OPT,PUCK
NOT,OPT,RUCK
NOT,OPTS,TAJ
NOT,OPT,SUCK
NOT,OPUS,TAJ
NOT,ORT,PUCK
NOT,ORT,RUCK
NOT,ORTS,TAJ
NOT,ORT,SUCK
NOUN,PUP,TAJ
NOUN,PUR,TAJ
NOUN,PUS,TAJ
NOUNS,TRUCK
NOUN,STRUCK
NOUN,SUP,TAJ
NOUN,SUQ,TAJ
NOUNS,USUAL
ONTO,PUP,TAJ
ONTO,PUR,TAJ
ONTO,PUS,TAJ
ONTO,STRUCK
ONTO,SUP,TAJ
ONTO,SUQ,TAJ
OOT,OPT,PUCK
OOT,OPT,RUCK
OOT,OPTS,TAJ
OOT,OPT,SUCK
OOT,OPUS,TAJ
OOT,ORT,PUCK
OOT,ORT,RUCK
OOT,ORTS,TAJ
OOT,ORT,SUCK

real	0m1.458s
user	0m1.425s
sys	0m0.030s

```

## Authors

* **Vishnu Prasanth** - *Initial work* - [Vizkrig](https://github.com/Vizkrig)