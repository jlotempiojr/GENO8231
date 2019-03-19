#!/usr/bin/env Rscript

# read data
d = scan("stdin", quiet=TRUE)

#set variables
avg = (mean(d))
invertebrate = 168

#get percent
avg_invertebrate = (avg/invertebrate) * 100

#return value to final txt file
print(avg_invertebrate)