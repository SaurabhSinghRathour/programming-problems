defmodule RockPaperScissors do
  @moduledoc """
  Documentation for `RockPaperScissors`.
  """
  def total_score(input_data_file) do
    input_data_file
    |> File.read!
    |> String.split("\r\n")
    |> Enum.map(&String.split/1)
    |> Enum.reduce(0, fn [op, me], acc ->
      case [op, me] do
        ["A", "X"] -> acc + 4
        ["A", "Y"] -> acc + 8
        ["A", "Z"] -> acc + 3
        ["B", "X"] -> acc + 1
        ["B", "Y"] -> acc + 5
        ["B", "Z"] -> acc + 9
        ["C", "X"] -> acc + 7
        ["C", "Y"] -> acc + 2
        ["C", "Z"] -> acc + 6
      end
    end)
  end

  def total_score_part2(input_data_file) do
    input_data_file
    |> File.read!
    |> String.split("\r\n")
    |> Enum.map(&String.split/1)
    |> Enum.reduce(0, fn [op, me], acc ->
      case [op, me] do
        ["A", "X"] -> acc + 3
        ["A", "Y"] -> acc + 4
        ["A", "Z"] -> acc + 8
        ["B", "X"] -> acc + 1
        ["B", "Y"] -> acc + 5
        ["B", "Z"] -> acc + 9
        ["C", "X"] -> acc + 2
        ["C", "Y"] -> acc + 6
        ["C", "Z"] -> acc + 7
      end
    end)
  end
end
