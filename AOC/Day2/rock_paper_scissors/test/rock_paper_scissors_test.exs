defmodule RockPaperScissorsTest do
  use ExUnit.Case
  doctest RockPaperScissors

  test "Rock Paper Scissors Test 1" do
    assert RockPaperScissors.total_score("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day2/rock_paper_scissors/lib/input-data2.txt") == 15
  end

  test "Rock Paper Scissors Test 2" do
    assert RockPaperScissors.total_score("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day2/rock_paper_scissors/lib/input-data.txt") == 11449
  end

  test "Rock Paper Scissors Test 3" do
    assert RockPaperScissors.total_score_part2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day2/rock_paper_scissors/lib/input-data2.txt") == 12
  end

  test "Rock Paper Scissors Test 4" do
    assert RockPaperScissors.total_score_part2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day2/rock_paper_scissors/lib/input-data.txt") == 13321
  end
end
