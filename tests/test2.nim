import unittest

import aoc2022pkg/day02

test "scissors beats paper":
  check versus(Scissors, Paper) == Win
  check versus(Paper, Scissors) == Lose

test "paper beats rock":
  check versus(Paper, Rock) == Win
  check versus(Rock, Paper) == Lose

test "rock beats scissors":
  check versus(Rock, Scissors) == Win
  check versus(Scissors, Rock) == Lose

test "draws":
  check versus(Rock, Rock) == Draw
  check versus(Scissors, Scissors) == Draw
  check versus(Paper, Paper) == Draw

test "pick bonuses":
  check pickBonus(Rock) == 1
  check pickBonus(Paper) == 2
  check pickBonus(Scissors) == 3

test "versus bonuses":
  check versusBonus(Win) == 6
  check versusBonus(Draw) == 3
  check versusBonus(Lose) == 0

test "regression test lol":
  check solve_day02("inputs/day02.txt") == 10595
