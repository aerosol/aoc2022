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

proc overlapsAtAll*(s1: HashSet[int], s2: HashSet[int]): bool =
  (s1 * s2).len > 0

proc solve_day04*(inputFile: string): int =
  var fullyOverlappingCounter: int = 0
  var overlappingAtAllCounter: int = 0
  for line in lines inputFile:
    let defs = line.split(',')

    let s1 = buildRangeSet(defs[0])
    let s2 = buildRangeSet(defs[1])

    if overlapsAtAll(s1, s2):
      inc(overlappingAtAllCounter)

    if oneContainsAnother(s1, s2):
      inc(fullyOverlappingCounter)

  echo "Finished - fully: ", fullyOverlappingCounter, "partially: ", overlappingAtAllCounter
  fullyOverlappingCounter
