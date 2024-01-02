#!/usr/bin/env python3
# shuffles words in txt file and creates a text file with lines of max 40 chars long
# output text file to be used for training tesseract from synthetic text

from random import shuffle

in_file_name = 'training_text/kidane-introduction.txt'
out_file_name = 'training_text/kidane-introduction-clean.txt'

with open(in_file_name, 'r', encoding='utf-8') as in_file:
    lines = in_file.readlines()

# list of non-space words stripped of newline
words = []
for line in lines:
    # add space b/n ። and word, split and strip newline and add to list if non-empty
    words.extend(
        [w.strip()
         for w in line.replace('፡፡', ' ።').replace('።', ' ።').split(' ')
         if w]
        )

# TODO add other punctuation marks to words before shuffle

shuffle(words)

with open(out_file_name, 'w', encoding='utf-8') as out_file:
    i = 0
    len_wrds = len(words)
    while (i < len_wrds):
        # a line with length less than 40
        optimal_line = ''

        # concat words while line len < 40, then write line
        while (i < len_wrds and len(optimal_line) + len(words[i]) < 41):
            optimal_line += ' ' + words[i]
            i += 1
        out_file.write(optimal_line + '\n')
