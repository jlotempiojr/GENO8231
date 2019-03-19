#!/bin/bash

# NAGS midterm 
# mammals 

# monday march 18

# requires stat.r to be saved in working directory

# cut a specific character, in this case a space
cut -f1 -d" " Mammalian_NAGS_CLUSTALW_VD.fasta > Mammalian_NAGS_CLUSTALW_VD_cut.fasta

#linearize fasta
sed -e 's/\(^>.*$\)/#\1#/' Mammalian_NAGS_CLUSTALW_VD_cut.fasta | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > Mammalian_NAGS_CLUSTALW_VD_cut_and_linearized.fasta

#this counts prolines but returns an extra line with zero
while read line; do echo $line | grep ">" | sed 's/>//g'; for i in P;do echo $line | grep -v ">" | grep -o $i | wc -l | grep -v "^0"; done; done < Mammalian_NAGS_CLUSTALW_VD_cut_and_linearized.fasta | paste - > Mammalian_proline_counts.txt

# pull out count of prolines
sed -n '1,${n;n;p;}' Mammalian_proline_counts.txt > Mammalian_proline_counts.csv

# return average proline percent across variable region of NAGS protein sequence
Rscript mammal_stat.r < Mammalian_proline_counts.csv > Mammalian_proline_stats.txt

