defmodule NoSpaceLeftOnDeviceTest do
  use ExUnit.Case
  doctest NoSpaceLeftOnDevice

  test "No space left on Device Test 1" do
    assert NoSpaceLeftOnDevice.calculate_space("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day7/no_space_left_on_device/lib/input-data.txt") == 95437
  end

  test "No space left on Device Test 2" do
    assert NoSpaceLeftOnDevice.calculate_space("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day7/no_space_left_on_device/lib/input-data-final.txt") == 1723892
  end

  test "No space left on Device Test 3" do
    assert NoSpaceLeftOnDevice.calculate_space_part2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day7/no_space_left_on_device/lib/input-data.txt") == 24933642
  end

  test "No space left on Device Test 4" do
    assert NoSpaceLeftOnDevice.calculate_space_part2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day7/no_space_left_on_device/lib/input-data-final.txt") == 8474158
  end
end
