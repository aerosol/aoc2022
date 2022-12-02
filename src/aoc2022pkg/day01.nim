import strutils
import std/algorithm
from math import sum

proc solve_day01*(input_file: string): int =
  var carriage = newSeq[int]()
  var calories = 0

  for line in lines input_file:
    if line.len() == 0:
      carriage.add(calories)
      calories = 0
    else:
      let value = strutils.parseInt(line)
      inc(calories, value)

  carriage.sort(Descending)
  carriage[0..2].sum
