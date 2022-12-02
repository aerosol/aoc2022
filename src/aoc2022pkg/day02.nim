import std/strutils
import std/sequtils
import std/tables

type
  Choice* {.pure.} = enum
    Rock, Paper, Scissors
  VersusResult* {.pure.} = enum
    Win, Lose, Draw

const WhoBeats: array[Choice, Choice] = [Paper, Scissors, Rock]
const WhoLoses: array[Choice, Choice] = [Scissors, Rock, Paper]
const PickBonus: array[Choice, int] = [1, 2, 3]
const VersusBonus: array[VersusResult, int] = [6, 0, 3]
const moveCodes = {'A': Rock, 'B': Paper, 'C': Scissors}.toTable
const resultCodes = {'X': Lose, 'Y': Draw, 'Z': Win}.toTable

func `>`(left, right: Choice): bool =
  #[
  WhoBeats:
    Rock -> Paper
    Paper -> Scissors
    Scissors -> Rock

   when:
    left = Paper
    right = Rock

   Paper == WhoBeats[Rock] (-> Paper)
   (left wins)

   when:
    left = Rock
    right = Paper

   Rock != WhoBeats[Paper] (-> Scissors)
   (left loses)
  ]#
  left == WhoBeats[right]

proc pickBonus*(choice: Choice): int =
  PickBonus[choice]

proc versusBonus*(r: VersusResult): int =
  VersusBonus[r]

proc guessChoice*(opponentsChoice: Choice, desiredResult: VersusResult): Choice =
  case desiredResult:
    of Draw:
      opponentsChoice
    of Win:
      WhoBeats[opponentsChoice]
    of Lose:
      WhoLoses[opponentsChoice]

proc versus*(choice1, choice2: Choice): VersusResult =
  if choice1 == choice2:
    Draw
  elif choice1 > choice2:
    Win
  else:
    Lose

proc solve_day02*(inputFile: string): int =
  var score = 0
  for line in lines inputFile:
    let clash = line.split(' ').mapIt(it[0])
    let theirChoice = moveCodes[clash[0]]
    let desiredResult = resultCodes[clash[1]]
    let myChoice = guessChoice(theirChoice, desiredResult)
    let versusResult = versus(myChoice, theirChoice)
    inc(score, pickBonus(myChoice) + versusBonus(versusResult))

  score
