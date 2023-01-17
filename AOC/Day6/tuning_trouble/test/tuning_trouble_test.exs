defmodule TuningTroubleTest do
  use ExUnit.Case
  doctest TuningTrouble

  test "Tuning Trouble Test 1" do
    assert TuningTrouble.tuning_touble("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data.txt") == 7
  end

  test "Tuning Trouble Test 2" do
    assert TuningTrouble.tuning_touble("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data2.txt") == 5
  end

  test "Tuning Trouble Test 3" do
    assert TuningTrouble.tuning_touble("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data3.txt") == 6
  end

  test "Tuning Trouble Test 4" do
    assert TuningTrouble.tuning_touble("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data4.txt") == 10
  end

  test "Tuning Trouble Test 5" do
    assert TuningTrouble.tuning_touble("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data5.txt") == 11
  end

  test "Tuning Trouble Test Final" do
    assert TuningTrouble.tuning_touble("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data-final.txt") == 1235
  end


  test "Tuning Trouble Part2 Test 1" do
    assert TuningTrouble.tuning_touble2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data.txt") == 19
  end

  test "Tuning Trouble Part2 Test 2" do
    assert TuningTrouble.tuning_touble2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data2.txt") == 23
  end

  test "Tuning Trouble Part2 Test 3" do
    assert TuningTrouble.tuning_touble2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data3.txt") == 23
  end

  test "Tuning Trouble Part2 Test 4" do
    assert TuningTrouble.tuning_touble2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data4.txt") == 29
  end

  test "Tuning Trouble Part2 Test 5" do
    assert TuningTrouble.tuning_touble2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data5.txt") == 26
  end

  test "Tuning Trouble Part2 Test Final" do
    assert TuningTrouble.tuning_touble2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day6/tuning_trouble/lib/input-data-final.txt") == 3051
  end

  test "Tuning tuning_touble_new Test " do
    assert TuningTrouble.tuning_touble_new("mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 7
  end

  test "Tuning tuning_touble_new Test 2 " do
    assert TuningTrouble.tuning_touble_new("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 11
  end
end
