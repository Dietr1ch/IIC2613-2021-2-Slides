#!/usr/bin/env python

import fileinput
import re

from prettytable import PrettyTable

EINSTEIN_REGEX = re.compile(r'^assign\((?P<h>\d),(?P<p>.*)\)$')


def parse_answer(answer):
    print(answer)
    properties = [list() for _ in range(5)]
    for fact in answer:
        m = EINSTEIN_REGEX.search(fact)
        if not m:
            continue

        h = int(m.group("h"))
        p = m.group("p")

        properties[h].append(p)

    return properties

def print_answer(answer):
    table = PrettyTable()
    table.field_names = ["Number", "Color", "Drink", "Nationality", "Pet", "Tobacco"]
    for i, props in enumerate(answer):
        props.sort()

        prop_list = [i]
        for p in props:
            prop_list.append(str(p[1:]))
        table.add_row(prop_list)
    print(table)

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
    all_properties = [set() for _ in range(5)]
    for i, answer_str in enumerate(read_answers()):
        answer = parse_answer(answer_str)
        for h, props in enumerate(answer):
            for p in props:
                all_properties[h].add(p)

        props.sort()
        print(i)
        print_answer(answer)
        print()

    print("All:")
    all_properties = [sorted(list(s)) for s in all_properties]
    for house in all_properties:
        print(house)

if __name__ == '__main__':
    main()
