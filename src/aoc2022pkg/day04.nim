import sets
import sequtils
import parseutils
import strutils

proc buildRangeSet*(input: string): HashSet[int] =
  let rangeData = input.split('-').mapIt(parseInt(it))
  var r = rangeData[0] .. rangeData[1]
  r.toSeq().toHashSet()

proc oneContainsAnother*(s1: HashSet[int], s2: HashSet[int]): bool =
  s1 == s2 or s1 < s2 or s1 > s2

proc solve_day04*(inputFile: string): int =
  var counter: int = 0
  for line in lines inputFile:
    let defs = line.split(',')
    let s1 = buildRangeSet(defs[0])
    let s2 = buildRangeSet(defs[1])
    if oneContainsAnother(s1, s2):
      inc(counter)
  echo "Finished ", counter
  counter
