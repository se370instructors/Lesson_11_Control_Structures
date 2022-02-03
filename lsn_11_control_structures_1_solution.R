## SE370 AY22-2
## Lesson 11 - Control Structures I
## Kloo Edits

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
for(i in 1:10){
  print(i)
}



# We can do more than just print. Let's manipulate the input. 
# Let's take the numbers 1 to 10, and multiply them by 2, then print
for(i in 1:10){
  tmp <- i * 2
  print(tmp)
}


# What if we want to preserve our results in some sort of data structure?
# Can we do this? How?

# Starting with a vector, you need to allocate how much space you're going to fill up
results <- vector(length = 10)
for (i in 1:10) {
  x = i * 2
  results[i] <- x
}

#the better way is to use a list.  this allows the most flexibility for output types.
#you don't have to pre-allocate space in a list, but you need to do some work at the end to convert from a list to a vector:
results <- list()
for (i in 1:10) {
  x = i * 2
  results[[i]] <- x #note the double brackets
}

results <- unlist(results)
results


# Can we run a FOR loop on a list, vector, or column of a dataframe?
# YES! 

# Read in some Australian weather data...
weather <- read.csv("~/Downloads/weatherAUS.csv")


# Let's convert the min temp column from celsius to fahrenheit
min_f <- list()
for(i in 1:nrow(weather)){
  f = weather$MinTemp[i] * 1.8 + 32
  min_f[i] <- f
}

min_f <- unlist(min_f)

# Print the first 10 results...
min_f[1:10]


# WHILE loops: Executes code until a condition is met

# Let's make a WHILE loop to print numbers from 1 to 10:
counter <- 1 # Designate an initial value
while(counter < 11){
  print(counter)
  counter <- counter + 1 #You have to remember to advance or 
  # alter your input...otherwise the loop will never end!
}


# How about we make a list of the numbers less than 100, that are 
# divisible by 7...we can start by finding the remainder (modulo)
# of all these numbers, then finding which ones equal to zero...

results <- list()
counter <- 1
while(counter < 100){
  results[[counter]] <- counter %% 7
  counter <- counter + 1
}

results <- unlist(results)


# Now, we can look at the results and find the index of all the 
# zeroes using which()

which(results == 0)


# We could accomplish the same thing using an IF statement.
# You should generally know how this works from the Excel block...

# Let's make an IF statement that only prints a number if it is divisible by 7:
x <- 15
if(x %% 7 == 0){
  print(x)
}

# Nice! Now how about we nest it in our while loop...
counter <- 1
while(counter < 100){
  if(counter %% 7 == 0){
    print(counter)
  }
  counter <- counter + 1
}


# Now put it in a for loop...and put it in a list instead of printing....
results <- list()
for(i in 1:100){
  if(i %% 7 == 0){
    results[[length(results) + 1]] <- i #the code on the left of the arrow says "place in a list 1 spot to the right of the last value"
  }
}

results <- unlist(results)
results


# You can also add an ELSE, which tells R what to do with data that
# doesn't meet the defined criteria. 
# Let's put the values divisible by 7 in one list, 
# and the values that are not in another list.
results <- list()
not_div <- list()
for(i in 1:100){
  if(i %% 7 == 0){
    results[[length(results) + 1]] <- i
  }else{
    not_div[[length(not_div) + 1]] <- i
  }
}

results <- unlist(results)
not_div <- unlist(not_div)



# Finally, we can use ELSE IF to add a different criteria 
# into the mix...for example, we showed this in our video:

x <- 2
if(x > 10){
  print("Greater than 10")
}else if(x > 5){
  print("Between 10 and 5")
}else{
  print("Less than 5")
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


#######Stretch Riddle (don't have to do this - only for fun) - source fivethirtyeight.com

#In the video game “Red Dead Redemption 2,” there is a side quest where the main character is 
#supposed to collect 12 sets of cigarette cards, each consisting of 12 unique cards.

#Some cards can be found lying around in the open world, but the easiest way to collect the cards 
#is to buy cigarettes at the store and collect the single random card included in each pack. Suppose 
#Arthur is too lazy to look for cards in the open world and tries to complete the set only by buying 
#packs at the store.

#At $5 a pack, how much money do we expect Arthur to spend to complete all 12 sets?

#Solve with a simulation!  Here are some tips:
#1. First, create a vector that is the length of all of the cards you will need to find and make it always have the value FALSE.
#   This will be our "deck" of cards we have collected.
#2. Create a loop that draws a card and places it in the deck.
#3. Run this loop until the deck is full.
#4. Include a counting variable in your loop so you know how many draws it took to fill the deck.
#5. Store the total $ spent in a new variable at the end of the process.

#Congrats!  You simulated a single iteration of this card-collecting process.  

#6. Now run a simulation (using another loop) to run this game 1000 times, storing the total cost at the end of each run.
#7. Find the mean and draw a histogram from your results - how much money should it take to get all of the cards?
#   What are the upper- and lower-end amounts you can expect to pay?

pb <- txtProgressBar(max = 1000, style = 3)
final <- numeric(length = 1000)
for(i in 1:1000){
  cards <- rep(FALSE, 144)
  
  counter <- 1
  while(length(which(cards)) < 144){
    rand <- sample(1:144, size = 1)
    cards[rand] <- TRUE
    counter <- counter + 1
  }
  
  cash <- counter * 5
  
  final[i] <- cash
  setTxtProgressBar(pb, i)
}

hist(final)
summary(final)





