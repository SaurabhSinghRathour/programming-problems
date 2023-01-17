defmodule RucksackReorganization do
  @moduledoc """
  Documentation for `RucksackReorganization`.
  """

  @alphabet_map %{
    "a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5, "f" => 6, "g" => 7, "h" => 8, "i" => 9, "j" => 10, "k" => 11,
    "l" => 12, "m" => 13, "n" => 14, "o" => 15, "p" => 16, "q" => 17, "r" => 18, "s" => 19, "t" => 20, "u" => 21,
    "v" => 22, "w" => 23, "x" => 24, "y" => 25, "z" => 26,
    "A" => 27, "B" => 28, "C" => 29, "D" => 30, "E" => 31, "F" => 32, "G" => 33, "H" => 34, "I" => 35, "J" => 36, "K" => 37,
    "L" => 38, "M" => 39, "N" => 40, "O" => 41, "P" => 42, "Q" => 43, "R" => 44, "S" => 45, "T" => 46, "U" => 47,
    "V" => 48, "W" => 49, "X" => 50, "Y" => 51, "Z" => 52
  }
  # def rucksack(input_data_file) do
  #   input_data_file
  #   |> File.read!
  #   |> String.split("\r\n")
  #   |> Enum.map(&String.split_at(&1, div(String.length(&1), 2)))
  #   |> Enum.flat_map(fn {first, second} ->
  #     first |> String.codepoints |> Enum.filter(fn str -> String.contains?(second, str) end) |> Enum.uniq
  #   end)
  #   |> Enum.reduce(0, fn x, acc -> acc + @alphabet_map[x] end)
  # end

  def rucksack(input_data_file) do
    #create_set = fn str -> str |> String.codepoints |> MapSet.new() end
    #create_set =  &String.codepoints(&1) |> MapSet.new()
    create_set =  &MapSet.new(String.codepoints(&1))
    e0 = &elem(&1, 0)
    e1 = &elem(&1, 1)
    create_set_e0 = &create_set.(e0.(&1))
    create_set_e1 = &create_set.(e1.(&1))
    #(compose MapSet.new String.codepoints)

    input_data_file
    |> File.read!
    |> String.split("\r\n")
    |> Enum.map(&String.split_at(&1, div(String.length(&1), 2)))
    # |> Enum.flat_map(fn {first, second} -> MapSet.intersection(create_set.(first), create_set.(second)) end)
    |> Enum.flat_map(&MapSet.intersection(create_set_e0.(&1), create_set_e1.(&1)))
    |> Enum.reduce(0, fn x, acc -> acc + @alphabet_map[x] end)
  end

  def rucksack_part2(input_data_file) do
    input_data_file
    |> File.read!
    |> String.split("\r\n")
    |> Enum.chunk_every(3)
    |> Enum.flat_map(fn [first, second, third] ->
      first |> String.codepoints |> Enum.filter(fn str -> String.contains?(second, str) and  String.contains?(third, str) end) |> Enum.uniq
    end)
    |> Enum.reduce(0, fn x, acc -> acc + @alphabet_map[x] end)
  end
end
