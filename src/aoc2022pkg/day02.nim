import std/strutils
import std/sequtils
import std/tables

type
  Choice* {.pure.} = enum
    Rock, Paper, Scissors
  VersusResult* {.pure.} = enum
    Win, Lose, Draw

const WhoBeats: array[Choice, Choice] = [Paper, Scissors, Rock]
const PickBonus: array[Choice, int] = [1, 2, 3]
const VersusBonus: array[VersusResult, int] = [6, 0, 3]

var opponentMoves = {'A': Rock, 'B': Paper, 'C': Scissors}.toTable
var myMoves = {'X': Rock, 'Y': Paper, 'Z': Scissors}.toTable

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
    let theirChoice = opponentMoves[clash[0]]
    let myChoice = myMoves[clash[1]]
    let versusResult = versus(myChoice, theirChoice)
    inc(score, pickBonus(my_choice) + versusBonus(versusResult))

  score



