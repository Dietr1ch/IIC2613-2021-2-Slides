#!/usr/bin/env bash

clingo einstein.lp $@ | ./einstein.py
