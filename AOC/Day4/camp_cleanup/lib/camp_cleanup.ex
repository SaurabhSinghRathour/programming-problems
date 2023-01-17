defmodule CampCleanup do
  @moduledoc """
  Documentation for `CampCleanup`.
  """
  def camp_cleanup(input_data_file) do
    input_data_file
    |> File.read!
    |> String.split("\r\n")
    |> Enum.map(&(String.split(&1, ",")))
    |> Enum.map(fn [first_pair, second_pair] ->
    [String.split(first_pair, "-") |> Enum.map(&String.to_integer/1),
    String.split(second_pair, "-") |> Enum.map(&String.to_integer/1)]
    |> Enum.map(fn [first, second] -> first..second |> MapSet.new() end)
  end)
    |> Enum.reduce(0, fn [first_map, second_map], acc ->
      cond do
        MapSet.subset?(second_map, first_map) -> acc + 1
        MapSet.subset?(first_map, second_map) -> acc + 1
        true -> acc
      end
end)
  end

  def camp_cleanup_part2(input_data_file) do
    input_data_file
    |> File.read!
    |> String.split("\r\n")
    |> Enum.map(&(String.split(&1, ",")))
    |> Enum.map(fn [first_pair, second_pair] ->
    [String.split(first_pair, "-") |> Enum.map(&String.to_integer/1),
    String.split(second_pair, "-") |> Enum.map(&String.to_integer/1)]
    |> Enum.map(fn [first, second] -> first..second |> MapSet.new() end)
  end)
    |> Enum.reduce(0, fn [first_map, second_map], acc ->
      cond do
        MapSet.intersection(first_map, second_map) != MapSet.new([]) -> acc + 1
        true -> acc
      end
end)
  end
end
