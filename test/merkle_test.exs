defmodule MerkleTest do
  use ExUnit.Case
  doctest Merkle

  @path "priv/alice.txt"

  test "calculates merkle root of text file" do
    assert Merkle.root(@path).value |> Base.encode16(case: :lower) ==
             "5a792e5fab93b0bbbdee42f10e40b2a05296cd301144620bee33999c8115eefb"
  end

  test "retrieves children using binary path" do
    route = "00000101"

    assert Merkle.lookup(@path, route) |> Base.encode16(case: :lower) ==
             "a144cb1e6029f92b0403071a07b69dd9d3aff267c8ff5f2e6e950721562bf84b"
  end
end
