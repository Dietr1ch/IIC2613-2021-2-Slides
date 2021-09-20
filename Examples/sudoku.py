#!/usr/bin/env python

import fileinput
import re

import numpy as np

SUDOKU_REGEX = re.compile(r'^sudoku\((?P<x>\d),(?P<y>\d),(?P<n>\d)\)$')


def parse_answer(answer):
    sudoku = np.zeros((9, 9))
    for fact in answer:
        m = SUDOKU_REGEX.search(fact)

        x = int(m.group("x"))
        y = int(m.group("y"))
        n = int(m.group("n"))

        sudoku[y][x] = n

    return sudoku


def read_answers():
    answer_line = False
    for line in fileinput.input():
        if line.startswith("Answer: "):
            # Mark next line as an answer line
            answer_line = True
            continue

        if not answer_line:
            # Discard non-answer lines
            continue

        # Collect answer
        answer_line = False
        yield line.split()


def main():
    for answer in read_answers():
        print(parse_answer(answer))
        print()


if __name__ == '__main__':
    main()
