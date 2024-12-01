defmodule Problem01 do
  def part_1(filename) do
    {left, right} = parse(filename)

    Enum.zip(Enum.sort(left), Enum.sort(right))
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end

  def part_2(filename) do
    {left, right} = parse(filename)

    right_frequencies = Enum.frequencies(right)

    left
    |> Enum.map(fn num -> num * Map.get(right_frequencies, num, 0) end)
    |> Enum.sum()
  end

  def parse(filename) do
    File.read!(filename)
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
    |> Enum.unzip()
  end
end
