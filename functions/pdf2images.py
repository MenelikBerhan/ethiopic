#!/usr/bin/env python3
"""
Script that saves each page of a pdf as image.
"""
from sys import argv
from pdf2image import convert_from_path
from os import path



if len(argv) < 3:
    print('Usage: ./pdf2images.py <pdf_path> <output_dir')
    exit(1)

pdf_path = argv[1]      # input pdf path
output_dir = argv[2]    # output images directory

assert path.isfile(pdf_path)
assert path.isdir(output_dir)

# get input file base name (without extension)
_, name_wiz_extension = path.split(pdf_path)
base_name, ext = path.splitext(name_wiz_extension)
assert ext == 'pdf'

# load pdf
pages = convert_from_path(pdf_path)

for i, page in enumerate(pages):
    page.save(
        '{}_page-{}.jpg'.format(base_name, i + 1),
        format='jpeg'
    )
