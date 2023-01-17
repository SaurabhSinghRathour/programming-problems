# defmodule NoSpaceLeftOnDevice do
#   @moduledoc """
#   Documentation for `NoSpaceLeftOnDevice`.
#   """
#   # def calculate_space(input_data_file) do
#   #   cmd_line_list = input_data_file |> File.read! |> String.split("\r\n")
#   #   cmd_line_list
#   #   |> Enum.reduce({[], %{}}, fn line, {path_list, acc} ->
#   #     acc |> IO.inspect
#   #     Map.size(acc) |> IO.inspect
#   #     word_list = String.split(line)
#   #     case word_list do
#   #       ["$", "cd", ".."] -> {tl(path_list), Map.update(acc, tl(path_list), 0, fn existing_val -> existing_val + 0 end)}
#   #       ["$", "cd", dirs] -> {[dirs|path_list], Map.update(acc, [dirs|path_list], 0, fn existing_val -> existing_val + 0 end)}
#   #       ["$", "ls"] -> {path_list, acc}
#   #       ["dir", _] -> {path_list, acc}
#   #       [size, _filename] -> {path_list, Map.update(acc, List.pop_at(Map.keys(acc), map_size(acc) -1 ) |> elem(0), 0, fn existing_val -> existing_val + (Integer.parse(size) |> elem(0)) end)}
#   #     end
#   #   end)
#     # |> Enum.reduce(%{}, fn line, acc ->
#     #   case String.split(line) do
#     #     ["$", "cd", ".."] -> tl(acc)
#     #     ["$", "cd", directory] -> %{acc | directory: 0}
#     #     ["$", "ls"] -> acc
#     #     ["dir", _] -> acc
#     #     [size, _filename] -> Integer.parse(size)
#     #   end
#     # end)

#   def calculate_space(input_data_file) do
#     cmd_line_list = input_data_file |> File.read! |> String.split("\r\n")
#     cmd_line_list
#     |> Enum.reduce([[], []], fn line, [push_list, pop_list] ->
#       [push_list, pop_list] |> IO.inspect
#       case String.split(line) do
#         ["$", "cd", ".."] ->  if push_list == [], do: [push_list, pop_list], else: [tl(push_list), [hd(push_list)|pop_list]] #[tl(push_list), [hd(push_list)|pop_list]]
#         ["$", "cd", dir_val] -> [ [{String.to_atom(dir_val), 0}] ++ push_list, pop_list]
#         ["$", "ls"] -> [push_list, pop_list]
#         ["dir", _] -> [push_list, pop_list]
#         [size, _filename] -> [Keyword.keys(push_list) |> Enum.reduce(push_list, fn key, push_list -> Keyword.update!(push_list, key, &(&1 + (Integer.parse(size) |> elem(0)))) end), pop_list]
#       end
#     end)
#     #|> IO.inspect()
#     |> Enum.flat_map(&(&1))
#     |> Enum.filter(fn {_key, val} -> val < 100000 end)
#     |> Enum.reduce(0, fn {_key, val}, acc -> acc + val end)
#   end
# end


# defmodule NoSpaceLeftOnDevice do
#   @moduledoc """
#   Documentation for `NoSpaceLeftOnDevice`.
#   """
#   def calculate_space(input_data_file) do
#     cmd_line_list = input_data_file |> File.read! |> String.split("\r\n")
#     cmd_line_list
#     |> Enum.reduce([[], []], fn line, [push_list, pop_list] ->
#       [push_list, pop_list] |> IO.inspect
#       case String.split(line) do
#         ["$", "cd", ".."] ->  if push_list == [], do: [push_list, pop_list], else: [tl(push_list), [hd(push_list)|pop_list]] #[tl(push_list), [hd(push_list)|pop_list]]
#         ["$", "cd", dir_val] -> [ [{String.to_atom(dir_val), 0}] ++ push_list, pop_list]
#         ["$", "ls"] -> [push_list, pop_list]
#         ["dir", _] -> [push_list, pop_list]
#         [size, _filename] -> [Keyword.keys(push_list) |> Enum.reduce(push_list, fn key, push_list -> Keyword.update!(push_list, key, &(&1 + (Integer.parse(size) |> elem(0)))) end), pop_list]
#       end
#     end)
#     |> Enum.flat_map(&(&1))
#     |> Enum.filter(fn {_key, val} -> val < 100000 end)
#     |> IO.inspect()
#     |> Enum.reduce(0, fn {_key, val}, acc -> acc + val end)
#   end
# end

defmodule NoSpaceLeftOnDevice do
  @moduledoc """
  Documentation for `NoSpaceLeftOnDevice`.
  """
  def calculate_space(input_data_file) do
    cmd_line_list = input_data_file |> File.read! |> String.split("\r\n")
    cmd_line_list
    |> Enum.reduce([[], %{}], fn line, [push_list, final_map] ->
      #[push_list, final_map] |> IO.inspect
      case String.split(line) do
        ["$", "cd", ".."] ->  if push_list == [], do: [push_list, final_map], else: [tl(push_list), final_map]
        ["$", "cd", dir_val] -> [ [dir_val|push_list], final_map]
        ["$", "ls"] -> [push_list, final_map]
        ["dir", _] -> [push_list, final_map]
        [size, _filename] -> [
          push_list,
          Enum.reduce(
            push_list |> Enum.with_index,
            final_map,
            fn {_key, inx}, acc ->
              Map.update(acc, Enum.join(Enum.take(Enum.reverse(push_list), inx + 1), "/"), (Integer.parse(size) |> elem(0)), fn existing_value -> existing_value + (Integer.parse(size) |> elem(0))
            end)
          end)
        ]
      end
    end)
    |> tl
    |> hd
    |> Map.filter(fn {_k, v} -> v < 100000 end)
    |> Map.values
    |> Enum.sum
  end

  def calculate_space_part2(input_data_file) do
    cmd_line_list = input_data_file |> File.read! |> String.split("\r\n")

    map_output = cmd_line_list
    |> Enum.reduce([[], %{}], fn line, [push_list, final_map] ->
      #[push_list, final_map] |> IO.inspect
      case String.split(line) do
        ["$", "cd", ".."] ->  if push_list == [], do: [push_list, final_map], else: [tl(push_list), final_map]
        ["$", "cd", dir_val] -> [ [dir_val|push_list], final_map]
        ["$", "ls"] -> [push_list, final_map]
        ["dir", _] -> [push_list, final_map]
        [size, _filename] -> [
          push_list,
          Enum.reduce(
            push_list |> Enum.with_index,
            final_map,
            fn {_key, inx}, acc ->
              Map.update(acc, Enum.join(Enum.take(Enum.reverse(push_list), inx + 1), "/"), (Integer.parse(size) |> elem(0)), fn existing_value -> existing_value + (Integer.parse(size) |> elem(0))
            end)
          end)
        ]
      end
    end)
    |> tl
    |> hd

    total_used = map_output["/"]
    need_to_free = total_used - 40000000
    need_to_free |> IO.inspect

    map_output
    |> Map.filter(fn {_k, v} -> v > need_to_free end)
    |> Map.values
    |> Enum.min
  end
end
