defmodule Aoc2024Test do
  use ExUnit.Case

  test "day_01" do
    assert Day01.part_1("./input/01-test.txt") == 11
    assert Day01.part_2("./input/01-test.txt") == 31
  end

  test "day_02" do
    assert Day02.part_1("./input/02-test.txt") == 2
    assert Day02.part_2("./input/02-test.txt") == :unknown
  end
end
