import strutils

proc solve*(input_file: string): int =
  var carriage = newSeq[int]()
  var calories = 0

  for line in lines input_file:
    if line.len() == 0:
      carriage.add(calories)
      calories = 0
    else:
      let weight = strutils.parseInt(line)
      inc(calories, weight)

  carriage.max()
