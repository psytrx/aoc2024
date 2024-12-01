defmodule Aoc2024Test do
  use ExUnit.Case
  doctest Problem01

  test "problem_01" do
    assert Problem01.part_1("./input/01-test.txt") == 11
  end
end
