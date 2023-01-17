defmodule TuningTrouble do
  @moduledoc """
  Documentation for `TuningTrouble`.
  """
  def find_first_packet_marker(word_list) do
    four_chars_sublist = word_list |> Enum.take(4)
    length_of_sublist = four_chars_sublist |> Enum.count

    word_map = four_chars_sublist
    |> Enum.reduce({[], 0}, fn {element, inx}, acc -> {elem(acc, 0) ++ (element |> String.to_charlist), inx} end)

    case length_of_sublist == elem(word_map, 0) |> MapSet.new |> Enum.count do
      true -> elem(word_map, 1)
      _ -> find_first_packet_marker(tl(word_list))
    end
  end
  def tuning_touble(input_data_file) do
    input_data_file
    |> File.read!
    |> String.graphemes
    |> Enum.with_index(1)
    |> find_first_packet_marker
  end

  ## mjqjpqmgbljsphdztnvjfqwrcgsmlb
  def tuning_touble_new(str) do
    str
    |> String.graphemes
    |> Enum.chunk_every(5, 1)
    |> Enum.with_index(4)
    |> IO.inspect
    |> Enum.map(fn {chars, inx} ->
      char_list = Enum.take(chars, 4)
      length(char_list) == (MapSet.new(char_list) |> Enum.count) && inx
    end)
    |> IO.inspect
    |> Enum.filter(& &1)
    |> hd
  end

  def find_first_message_marker(word_list) do
    four_chars_sublist = word_list |> Enum.take(14)
    length_of_sublist = four_chars_sublist |> Enum.count

    word_map = four_chars_sublist
    |> Enum.reduce({[], 0}, fn {element, inx}, acc -> {elem(acc, 0) ++ (element |> String.to_charlist), inx} end)

    case length_of_sublist == elem(word_map, 0) |> MapSet.new |> Enum.count do
      true -> elem(word_map, 1)
      _ -> find_first_message_marker(tl(word_list))
    end
  end
  def tuning_touble2(input_data_file) do
    input_data_file
    |> File.read!
    |> String.graphemes
    |> Enum.with_index(1)
    |> find_first_message_marker
  end
end
