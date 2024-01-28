#!/bin/bash

# command to train tesseract using tesstrain module

python3 -m tesstrain   \
    --fontlist 'Abyssinica SIL'   \
    --fonts_dir ../fonts  \
    --tmp_dir ./temp  \
    --lang amh   \
    --langdata_dir ./data/langdata  \
    --output_dir ./tesstrain_output  \
    --linedata_only \
    --save_box_tiff \
    --training_text ./training_text/kidane-introduction-clean.txt    \
    --tessdata_dir ./data/tessdata  \
    # --overwrite \
    # --wordlist WORDFILE \


#   --fontlist              A list of fontnames to train on.
#   --fonts_dir             Path to font files.
#   --tmp_dir TMP_DIR       Path to temporary training directory.
#   --lang LANG_CODE        ISO 639 code.
#   --langdata_dir          Path to tesseract/training/langdata directory.
#   --maxpages MAX_PAGES
#   --output_dir            Location of output traineddata file.
#   --overwrite             Safe to overwrite files in output_dir.
#   --save_box_tiff         Save box/tiff pairs along with lstmf files.
#   --linedata_only         Only generate training data for lstmtraining.
#   --extract_font_properties
#   --noextract_font_properties
#   --distort_image
#   --exposures             A list of exposure levels to use (e.g. -1,0,1).
#   --ptsize                Size of printed text.

# inputdata:
#   OPTIONAL flags for input data. If unspecified we will look for them in the langdata_dir directory.

#   --training_text         Text to render and use for training.
#   --wordlist WORDFILE     Word list for the language ordered by decreasing frequency.

# tessdata:
#   OPTIONAL flag to specify location of existing traineddata files, required
#   during feature extraction. If unspecified will use TESSDATA_PREFIX defined
#   in the current environment.

#   --tessdata_dir Path to tesseract/tessdata directory.

# [22:22:08] INFO - Log file location: temp/amh-2024-01-12ghf5uq60/tesstrain.log
# [22:22:08] INFO - === Starting training for language amh
# [22:22:08] INFO - Testing font: Abyssinica SIL
# [22:22:15] INFO - === Phase I: Generating training images ===
#   0%|                                                                                 | 0/1 [00:00<?, ?it/s][22:22:15] INFO - Rendering using Abyssinica SIL
# 100%|█████████████████████████████████████████████████████████████████████████| 1/1 [01:28<00:00, 88.65s/it]
# [22:23:43] INFO - === Phase UP: Generating unicharset and unichar properties files ===
# [22:23:44] INFO - === Phase E: Generating lstmf files ===
# [22:23:44] INFO - Using TESSDATA_PREFIX=./data/tessdata
# 100%|████████████████████████████████████████████████████████████████████████| 1/1 [02:52<00:00, 172.92s/it]
# [22:26:37] INFO - === Constructing LSTM training data ===
# [22:26:38] INFO - === Moving lstmf files for training data ===
# Traceback (most recent call last):
#   File "/usr/lib/python3.8/runpy.py", line 194, in _run_module_as_main
#     return _run_code(code, main_globals, None,
#   File "/usr/lib/python3.8/runpy.py", line 87, in _run_code
#     exec(code, run_globals)
#   File "/home/menelikberhan/.local/lib/python3.8/site-packages/tesstrain/__main__.py", line 77, in <module>
#     main()
#   File "/home/menelikberhan/.local/lib/python3.8/site-packages/tesstrain/__main__.py", line 67, in main
#     run_from_context(ctx)
#   File "/home/menelikberhan/.local/lib/python3.8/site-packages/tesstrain/wrapper.py", line 52, in run_from_context
#     make_lstmdata(ctx)
#   File "/home/menelikberhan/.local/lib/python3.8/site-packages/tesstrain/generate.py", line 379, in make_lstmdata
#     with open(lstm_list, encoding="utf-8", newline="\n") as fd:
# FileNotFoundError: [Errno 2] No such file or directory: './tesstrain_output/amh.training_files.txt'
# Temporary files retained at: ./temp/amh-2024-01-12ghf5uq60