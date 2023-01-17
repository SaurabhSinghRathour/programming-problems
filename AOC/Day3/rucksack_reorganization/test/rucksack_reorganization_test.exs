defmodule RucksackReorganizationTest do
  use ExUnit.Case
  doctest RucksackReorganization

  test "RucksackReorganization Test1" do
    assert RucksackReorganization.rucksack("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day3/rucksack_reorganization/lib/input-data.txt") == 157
  end

  test "RucksackReorganization Test2" do
    assert RucksackReorganization.rucksack("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day3/rucksack_reorganization/lib/input-data2.txt") == 7997
  end

  test "RucksackReorganization Test3" do
    assert RucksackReorganization.rucksack_part2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day3/rucksack_reorganization/lib/input-data.txt") == 70
  end

  test "RucksackReorganization Test4" do
    assert RucksackReorganization.rucksack_part2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day3/rucksack_reorganization/lib/input-data2.txt") == 2545
  end
end
