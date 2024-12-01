defmodule Problem01 do
  def part_1(filename) do
    numbers =
      File.read!(filename)
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        line
        |> String.split()
        |> Enum.map(&String.to_integer/1)
        |> List.to_tuple()
      end)

    {list1, list2} = Enum.unzip(numbers)

    Enum.zip(Enum.sort(list1), Enum.sort(list2))
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end

  def part_2(filename) do
    {left_list, right_list} =
      File.read!(filename)
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        line
        |> String.split()
        |> Enum.map(&String.to_integer/1)
        |> List.to_tuple()
      end)
      |> Enum.unzip()

    # Create frequency map of right list
    right_frequencies = Enum.frequencies(right_list)

    # For each number in left list, multiply by its frequency in right list
    left_list
    |> Enum.map(fn num -> num * Map.get(right_frequencies, num, 0) end)
    |> Enum.sum()
  end
end
