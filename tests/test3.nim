import unittest
import sets

import aoc2022pkg/day03

test "split into chunks":
   check toChunks(@["abc", "foo", "bar", "baz", "bam", "boo"], 3) ==
     @[@["abc", "foo"], @["bar", "baz"], @["bam", "boo"]]

test "common":
   check commonCompartment(@["zab", "xad", "uae"]) == 'a'
   check commonCompartment(@["abc", "cde", "fcu"]) == 'c'

test "calculates priority":
   check calcPriority('a') == 1
   check calcPriority('p') == 16
   check calcPriority('L') == 38
   check calcPriority('P') == 42
   check calcPriority('v') == 22
   check calcPriority('t') == 20
   check calcPriority('s') == 19

test "integration (part 2)":
   check solve_day03("inputs/day03.txt") == 2633
