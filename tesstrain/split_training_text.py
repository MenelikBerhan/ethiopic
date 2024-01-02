#!/usr/bin/env python3
# source: https://github.com/astutejoe/tesseract_tutorial
# creates a text, image(tif) and box file for each line in a text file
# output to be used as a ground truth for training tesseract

import os
import random
import pathlib
import subprocess

training_text_file = 'training_text/kidane-introduction-clean.txt'

lines = []

with open(training_text_file, 'r') as input_file:
    for line in input_file.readlines():
        lines.append(line.strip())

output_directory = 'data/amh-dict-ground-truth'

if not os.path.exists(output_directory):
    os.mkdir(output_directory)

random.shuffle(lines)

# no of lines to process from txt file (comment out for all)
# count = 5
# lines = lines[:count]

# file name without extention
file_name = training_text_file.split('/')[-1].split('.')[0]

line_count = 0
for line in lines:
    training_text_file_name = pathlib.Path(training_text_file).stem
    line_training_text = os.path.join(output_directory, f'{training_text_file_name}_{line_count}.gt.txt')
    with open(line_training_text, 'w') as output_file:
        output_file.writelines([line])

    file_base_name = f'{file_name}_{line_count}'

    subprocess.run([
        'text2image',
        '--font=Abyssinica SIL',
        f'--text={line_training_text}',
        f'--outputbase={output_directory}/{file_base_name}',
        '--max_pages=1',
        '--strip_unrenderable_words',
        '--leading=0',
        '--xsize=1600',     # change xsize & ysize based on line length
        '--ysize=80',       #+  to minimize margin spaces around text
        '--char_spacing=1.0',
        '--exposure=0',
        '--unicharset_file=langdata/eng.unicharset',
        '--margin=0'
    ])

    line_count += 1
