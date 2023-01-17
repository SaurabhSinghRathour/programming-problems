defmodule SupplyStacks do
  @moduledoc """
  Documentation for `SupplyStacks`.
  """
  def supply_stacks(input_data_file) do
    execution_statements = input_data_file
    |> File.read!
    |> String.split("\r\n")
    |> Enum.filter(fn line -> String.contains?(line, "move") end)
    |> Enum.map(fn line -> Regex.scan(~r"\d+", line) |> List.flatten |> Enum.map(&String.to_integer/1) end)

    #execution_statements |> IO.inspect

    stack_elements = input_data_file
    |> File.read!
    |> String.split("\r\n")
    |> Enum.reject(fn line -> String.contains?(line, "move") end)

    reduce_map = 1..(stack_elements |> Enum.slice(-2, 1) |> Enum.map(&String.split(&1) |> Enum.count) |> hd)
    |> Enum.reduce(%{}, fn key, acc -> Map.put(acc, key, []) end) #|> IO.inspect

    prepared_stack = Enum.take(stack_elements, length(stack_elements) - 2)
    |> Enum.reduce(reduce_map, fn line, acc -> prepare_stack(line, acc, 1) end)

    execute_statements_on_stack(execution_statements, prepared_stack)
  end

  def execute_statements_on_stack(execution_statements, prepared_stack) do
    prepared_stack = prepared_stack
    |> Enum.reduce(prepared_stack, fn {key, _val}, acc -> %{acc|key => acc[key] |> Enum.reverse} end)

    execution_statements
    |> Enum.reduce(prepared_stack, fn [move, from, to], acc ->
      acc = %{acc|to => [ Enum.take(acc[from], move) |> Enum.reverse | acc[to] ] |> List.flatten}
      %{acc|from => Enum.drop(acc[from], move)}
    end)
    |> Enum.reduce("", fn {_k, v}, acc -> acc <> hd(v) end)
  end

  def prepare_stack(line, stack_map, inx) do
    case (inx + (inx - 1)*3) > String.length(line) do
      true -> stack_map
      _ -> prepare_stack_1(line, stack_map, inx)
    end
  end
  def prepare_stack_1(line, stack_map, inx) do
    case String.at(line, inx + (inx - 1)*3) do
      " " -> prepare_stack(line, stack_map, inx + 1)
      c -> prepare_stack(line, %{stack_map|inx => [c|stack_map[inx]]}, inx + 1)
    end
  end

  def prepare_stack_part2(line, stack_map, inx) do
    prepare_stack2(line |> String.graphemes, stack_map, inx)
  end
  def prepare_stack2([], stack_map, _), do: stack_map
  def prepare_stack2(line_elem, stack_map, inx) do
    case line_elem do
      [" ", " ", " ", " "|rest] -> prepare_stack2(rest, stack_map, inx + 1)
      [" ", _, str, _|rest] -> prepare_stack2(rest, %{stack_map|inx => [str|stack_map[inx]]}, inx + 1)
      [_, str, _|rest] -> prepare_stack2(rest, %{stack_map|inx => [str|stack_map[inx]]}, inx + 1)
    end
  end


  def supply_stacks2(input_data_file) do
    execution_statements = input_data_file
    |> File.read!
    |> String.split("\r\n")
    |> Enum.filter(fn line -> String.contains?(line, "move") end)
    |> Enum.map(fn line -> Regex.scan(~r"\d+", line) |> List.flatten |> Enum.map(&String.to_integer/1) end)

    #execution_statements |> IO.inspect

    stack_elements = input_data_file
    |> File.read!
    |> String.split("\r\n")
    |> Enum.reject(fn line -> String.contains?(line, "move") end)

    reduce_map = 1..(stack_elements |> Enum.slice(-2, 1) |> Enum.map(&String.split(&1) |> Enum.count) |> hd)
    |> Enum.reduce(%{}, fn key, acc -> Map.put(acc, key, []) end) #|> IO.inspect

    prepared_stack = Enum.take(stack_elements, length(stack_elements) - 2)
    |> Enum.reduce(reduce_map, fn line, acc -> prepare_stack(line, acc, 1) end)

    execute_statements_on_stack2(execution_statements, prepared_stack)
  end

  def execute_statements_on_stack2(execution_statements, prepared_stack) do
    prepared_stack = prepared_stack
    |> Enum.reduce(prepared_stack, fn {key, _val}, acc -> %{acc|key => acc[key] |> Enum.reverse} end)

    execution_statements
    |> Enum.reduce(prepared_stack, fn [move, from, to], acc ->
      acc = %{acc|to => [ Enum.take(acc[from], move) | acc[to] ] |> List.flatten}
      %{acc|from => Enum.drop(acc[from], move)}
    end)
    |> Enum.reduce("", fn {_k, v}, acc -> acc <> hd(v) end)
  end
end
