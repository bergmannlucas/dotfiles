#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
## Type-4 Style-3 Only

dir="$HOME/.config/rofi/launchers/type-4"
theme='style-3'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
