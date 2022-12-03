proc commonCompartment*(s: string): char =
  let l = s.len div 2
  var seqLeft: seq[char] = @[]
  var found: char
  for i in 0 .. s.len - 1:
    if i < l:
      seqLeft.add(s[i])
    else:
      if seqLeft.contains(s[i]):
        found = s[i]
        break
      else:
        continue
  found

proc calcPriority*(c: char): int =
  if c >= 'a':
    ord(c) - 96
  else:
    ord(c) - 38

proc solve_day03*(input_file: string): int =
  var prioritySum: int = 0
  for line in lines input_file:
    let c = commonCompartment(line)
    inc(prioritySum, calcPriority(c))
  prioritySum



