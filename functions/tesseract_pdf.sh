#!/usr/bin/bash
# perform OCR on multiple images & output inplace pdf
input_dir = '.'
ouput_file = 'output'
ls $input_dir | tesseract -l amh-old3 - $ouput_file pdf
