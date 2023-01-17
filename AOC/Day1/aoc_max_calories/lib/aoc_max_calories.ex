defmodule AocMaxCalories do
  @moduledoc """
  Documentation for `AocMaxCalories`.
  """
  def find_max_calories(input_file) do
    input_file
    |> File.read!
    |> String.split("\r\n\r\n")
    |> Enum.with_index
    |> Enum.map(fn {ele_str, inx} -> {String.split(ele_str, "\r\n") |> Enum.map(&String.to_integer/1)|> Enum.sum, inx+1} end)
    |> Enum.max
  end

  def max_calories(input_file) do
    input_file
    |> File.read!
    |> String.split("\r\n\r\n")
    |> Enum.map(&String.split(&1, "\r\n") |> Enum.map(fn l -> String.to_integer(l) end) |> Enum.sum)
    |> Enum.max
  end

  def top_3_calories(input_file) do
    input_file
    |> File.read!
    |> String.split("\r\n\r\n")
    |> Enum.map(&String.split(&1, "\r\n") |> Enum.map(fn l -> String.to_integer(l) end) |> Enum.sum)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.sum
  end
end
