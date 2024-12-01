defmodule Aoc2024Test do
  use ExUnit.Case
  doctest Day01

  test "day_01" do
    assert Day01.part_1("./input/01-test.txt") == 11
    assert Day01.part_2("./input/01-test.txt") == 31
  end
end
