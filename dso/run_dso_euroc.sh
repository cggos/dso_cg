#!/usr/bin/env bash

euroc_seq=/media/cg/udisk_cg/slam_datasets/EuRoC/MH_01_easy

echo $monovo_seq

bin/dso_dataset \
    files=$euroc_seq/mav0/cam0/data \
    calib=../cam_data/camera.txt \
    mode=1
