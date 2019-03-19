#!/usr/bin/env Rscript

# read data
d = scan("stdin", quiet=TRUE)

#set variables
avg = (mean(d))
mammal = 106

#get percent
avg_mammal = (avg/mammal) * 100

#return value to final txt file
print(avg_mammal)