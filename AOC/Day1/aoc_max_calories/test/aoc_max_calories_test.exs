defmodule AocMaxCaloriesTest do
  use ExUnit.Case
  doctest AocMaxCalories

  test "Test max calories 1" do
    assert AocMaxCalories.find_max_calories("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/aoc_max_calories/lib/input-data.txt") == {70613, 148}
  end
  test "Test max calories 2" do
    assert AocMaxCalories.find_max_calories("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/aoc_max_calories/lib/input-data2.txt") == {24000, 4}
  end

  test "Test max calories 3" do
    assert AocMaxCalories.max_calories("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/aoc_max_calories/lib/input-data.txt") == 70613
  end
  test "Test max calories 4" do
    assert AocMaxCalories.max_calories("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/aoc_max_calories/lib/input-data2.txt") == 24000
  end

  test "Test max calories 5" do
    assert AocMaxCalories.top_3_calories("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/aoc_max_calories/lib/input-data.txt") == 205805
  end

  test "Test top 3 calories - 6" do
    assert AocMaxCalories.top_3_calories("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/aoc_max_calories/lib/input-data2.txt") == 45000
  end
end
