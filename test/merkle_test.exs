defmodule MerkleTest do
  use ExUnit.Case
  doctest Merkle

  test "calculates merkle root of text file" do
    file = "priv/alice.txt"

    assert Merkle.root(file).value |> Base.encode16(case: :lower) ==
             "13c167bf7129d1cad60284fa3def50ed62e91219e3fe274f47ff6e9aea720ad1"
  end

  test "contains an even number on every row by doubling last value if necessary"
  test "retrieves children using binary path"
end
