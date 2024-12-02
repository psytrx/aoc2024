defmodule Day02 do
  def part_1(filename) do
    parse(filename)
    |> Enum.count(&is_safe?/1)
  end

  def part_2(filename) do
    :none
  end

  def is_safe?(report) do
    report
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(:direction_unknown, fn [a, b], direction ->
      case direction do
        :direction_unknown when (b - a) in 1..3 ->
          :increasing

        :direction_unknown when (a - b) in 1..3 ->
          :decreasing

        :increasing when (b - a) in 1..3 ->
          :increasing

        :decreasing when (a - b) in 1..3 ->
          :decreasing

        _else ->
          :unsafe
      end
    end) != :unsafe
  end

  def parse(filename) do
    File.read!(filename)
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    end)
  end
end
