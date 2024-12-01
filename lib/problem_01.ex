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
end
