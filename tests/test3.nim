import unittest
import sets

import aoc2022pkg/day03

test "find compartment errors":
  check commonCompartment("abccde") == 'c'

test "calculates priority":
  check calcPriority('a') == 1
  check calcPriority('p') == 16
  check calcPriority('L') == 38
  check calcPriority('P') == 42
  check calcPriority('v') == 22
  check calcPriority('t') == 20
  check calcPriority('s') == 19

test "integration":
  check solve_day03("inputs/day03.txt") == 7785
