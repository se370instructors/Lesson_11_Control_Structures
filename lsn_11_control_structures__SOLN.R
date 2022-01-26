## SE370 AY22-2
## Lesson 11 - Control Structures I
## 

# What is a control structure? What does it allow us to do?
# ANS: Control structures let you control the flow of a series of R
# expressions/functions/etc. They let you insert more logic into your 
# code, and create efficiency (instead of typing out and running the 
# same lines of code 10, 20, or 100000 times).


# LOOPS
# Loops allow us to repeat a specific block of code
# There are two types we will introduc: FOR and WHILE

# FOR loops: provide a range/list of inputs, and R iterates through

# Lets count from 1 to 10 with a for loop

for (i in 1:10) {
  print(i)
}

# We can do more than just print. Let's manipulate the input. 
# Let's take the numbers 1 to 10, and multiply them by 2, then print

for (i in 1:10) {
  x = i * 2
  print(x)
}

# What if we want to preserve our results in some sort of data structure?
# Can we do this? How?

# Start with a list or vector...then add results to it...

results = c() #or
results = rep(0, 10) # we can do this here since we know there will be 10 outputs!

for (i in 1:10) {
  x = i * 2
  results[i] <- x
}

# Can we run a FOR loop on a list, vector, or column of a dataframe?
# YES! 

# Read in some Australian weather data...

weather <- read.csv("weatherAUS.csv")

# Let's convert the first 100 entries in the MinTemp 
# column from celsius to fahrenheit

min_f <- c()

for(i in 1:length(weather$MinTemp)){
  f = weather$MinTemp[i] * 1.8 + 32
  min_f[i] <- f
}

# Print the first 10 results...
min_f[1:10]


# WHILE loops: Executes code until a condition is met

# Let's make a WHILE loop to print numbers from 1 to 10:

x <- 1 # Designate an initial value

while(x < 11){
  print(x)
  x <- x + 1 #You have to remember to advance or 
  # alter your input...otherwise the loop will never end!
}

# How about we make a list of the numbers less than 100, that are 
# divisible by 7...we can start by finding the remainder (modulo)
# of all these numbers, then finding which ones equal to zero...

results <- c()

x <- 1

while(x < 100){
  results[x] <- x %% 7
  x <- x + 1
}

# Now, we can look at the results and find the index of all the 
# zeroes using which()

which(results %in% 0)

# But...there's an easier way to do this!
# We can use an IF statement.
# You should already know how this works from the Excel block...

# Let's make an IF statement that tells us whether or not a
# number is divisible by 7...

x <- 15

if(x %% 7 == 0){
  print(x)
}

# Nice! Now how about we nest it in our while loop...

x <- 1

while(x < 100){
  if(x %% 7 == 0){
    print(x)
  }
  x <- x + 1 # this has to stay outside the if statement...why?
}

# Now put it in a for loop...and put it in a list instead of printing....

results <- c()

for(x in 1:100){
  if(x %% 7 == 0){
    results <- c(results, x) # see how we are appending the vector?
    # this is another way to add results to a data structure without
    # relying on an index
  }
}

results

# You can also add an ELSE, which tells R what to do with data that
# doesn't meet the defined criteria. 
# Let's put the values divisible by 7 in one list, 
# and the values that are not in another list.

results <- c()
not_div <- c()

for(x in 1:100){
  if(x %% 7 == 0){
    results <- c(results, x) 
  }else{
    not_div <- c(not_div, x)
  }
}

# Finally, we can use ELSE IF to add a different criteria 
# into the mix...for example, we showed this in our video:

x <- 7

if(x > 10){
  print("> 10")
}else if(x > 5){
  print("10 > x > 5")
}else{
  print("< 5")
}



#######Time for a riddle
# Members of the West High School Band were hard at
# work practicing for the annual Homecoming Parade.
# First they tried marching in rows of 12, but Andrew was
# left by himself to bring up the rear. Then the director
# told the band members to march in columns of eight,
# but Andrew was still left to march alone. Even when the
# band marched in rows of three, Andrew was left out.
# Finally, in exasperation, Andrew told the band director
# that they should march in rows of five in order to have
# all the rows filled. He was right. Given that there were at
# least 45 musicians on the field but fewer than 200 musicians,
# how many students were there in the West High
# School Band?

for (i in 45:200) {
  if (i %% 5 == 0) {
    if (i %% 12 == 1) {
      if (i %% 8 == 1) {
        if (i %% 3 == 1) {
          print(i)
        }
      }
    }
  }
}

#What if the band could have had 500 people?-- What are the options?
