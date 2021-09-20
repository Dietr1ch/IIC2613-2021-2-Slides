#!/usr/bin/env bash

clingo sudoku.lp $@ | ./sudoku.py
