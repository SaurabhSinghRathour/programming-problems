defmodule CampCleanupTest do
  use ExUnit.Case
  doctest CampCleanup

  test "Camp Cleanup Test 1" do
    assert CampCleanup.camp_cleanup("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day4/camp_cleanup/lib/input-data.txt") == 2
  end

  test "Camp Cleanup Test 2" do
    assert CampCleanup.camp_cleanup("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day4/camp_cleanup/lib/input-data2.txt") == 573
  end

  test "Camp Cleanup Test 3" do
    assert CampCleanup.camp_cleanup_part2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day4/camp_cleanup/lib/input-data.txt") == 4
  end

  test "Camp Cleanup Test 4" do
    assert CampCleanup.camp_cleanup_part2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day4/camp_cleanup/lib/input-data2.txt") == 867
  end
end
