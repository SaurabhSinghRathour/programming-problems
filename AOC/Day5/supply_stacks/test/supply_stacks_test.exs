defmodule SupplyStacksTest do
  use ExUnit.Case
  doctest SupplyStacks

  test "Supply Stack Test 1" do
    assert SupplyStacks.supply_stacks("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day5/supply_stacks/lib/input-data.txt") == "CMZ"
  end

  test "Supply Stack Test 1.1" do
    assert SupplyStacks.supply_stacks("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day5/supply_stacks/lib/input-data2.txt") == "FJSRQCFTN"
  end

  test "Supply Stack Test 1.2" do
    assert SupplyStacks.supply_stacks2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day5/supply_stacks/lib/input-data.txt") == "MCD"
  end

  test "Supply Stack Test 1.3" do
    assert SupplyStacks.supply_stacks2("C:/Users/ssrathor/visualstudiocode-files/programming-problems/AOC/Day5/supply_stacks/lib/input-data2.txt") == "CJVLJQPHS"
  end

  test "Prepare stack Test 1" do
    assert SupplyStacks.prepare_stack("[N] [C]", %{1 => [], 2 => [], 3 => []}, 1) == %{1 => ["N"], 2=> ["C"], 3 => []}
  end

  test "Prepare stack Test 2" do
    assert SupplyStacks.prepare_stack("    [D]", %{1 => [], 2 => [], 3 => []}, 1) == %{1 => [], 2=> ["D"], 3 => []}
  end

  test "Prepare stack Test 3" do
    assert SupplyStacks.prepare_stack("[Z] [M] [P]", %{1 => [], 2 => [], 3 => []}, 1) == %{1 => ["Z"], 2=> ["M"], 3 => ["P"]}
  end

  test "Prepare stack Test 4" do
    assert SupplyStacks.prepare_stack_part2("[N] [C]", %{1 => [], 2 => [], 3 => []}, 1) == %{1 => ["N"], 2=> ["C"], 3 => []}
  end

  test "Prepare stack Test 5" do
    assert SupplyStacks.prepare_stack_part2("    [D]", %{1 => [], 2 => [], 3 => []}, 1) == %{1 => [], 2=> ["D"], 3 => []}
  end

  test "Prepare stack Test 6" do
    assert SupplyStacks.prepare_stack_part2("[Z] [M] [P]", %{1 => [], 2 => [], 3 => []}, 1) == %{1 => ["Z"], 2=> ["M"], 3 => ["P"]}
  end
end
