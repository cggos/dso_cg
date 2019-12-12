#!/usr/bin/env bash

monovo_seq=/media/cg/udisk_cg/slam_datasets/TUM/MonoVO/sequence_11

echo $monovo_seq

bin/dso_dataset \
    files=$monovo_seq/images.zip \
    calib=$monovo_seq/camera.txt \
    gamma=$monovo_seq/pcalib.txt \
    vignette=$monovo_seq/vignette.png \
    preset=0 \
    mode=0
