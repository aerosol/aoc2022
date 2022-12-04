import unittest
import sets

import aoc2022pkg/day04

test "builds range set":
  let s = buildRangeSet("1-10")
  check s.len == 10
  check 1 in s
  check 2 in s
  check 9 in s
  check 10 in s

test "check if sets are overlapping fully":
  check oneContainsAnother(buildRangeSet("2-8"), buildRangeSet("3-7")) == true
  check oneContainsAnother(buildRangeSet("3-7"), buildRangeSet("2-8")) == true
  check oneContainsAnother(buildRangeSet("4-6"), buildRangeSet("6-6")) == true
  check oneContainsAnother(buildRangeSet("4-5"), buildRangeSet("6-6")) == false
  check oneContainsAnother(buildRangeSet("2-8"), buildRangeSet("3-9")) == false
  check oneContainsAnother(buildRangeSet("2-8"), buildRangeSet("2-8")) == true

test "check if sets overlap at all":
  check overlapsAtAll(buildRangeSet("2-8"), buildRangeSet("3-7")) == true
  check overlapsAtAll(buildRangeSet("6-6"), buildRangeSet("6-6")) == true
  check overlapsAtAll(buildRangeSet("1-9"), buildRangeSet("9-11")) == true

test "integration - part 1":
  check solve_day04("inputs/day04.txt") == 580
