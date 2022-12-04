import sequtils, sets, strutils

proc calcPriority*(c: char): int =
  if c >= 'a':
    ord(c) - 96
  else:
    ord(c) - 38

type
  Chunk = seq[string]

proc toChunks*(input: seq[string], parts: int): seq[Chunk] =
  input.distribute(parts)

proc commonCompartment*(chunk: Chunk): char =
  chunk.mapIt(toHashSet(it)).foldl(a * b).toSeq[0]

proc solve_day03*(inputFile: string): int =
  var totalSum: int = 0
  let data: seq[string] = readFile(inputFile).strip().split('\n')
  let parts = data.len div 3
  for chunk in toChunks(data, parts):
    inc(totalSum, calcPriority(commonCompartment(chunk)))

  totalSum
