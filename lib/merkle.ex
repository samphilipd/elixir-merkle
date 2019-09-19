defmodule Merkle do
  @doc """
  Read a file, build a merkle tree and return its root hash.

  """
  def root(path) do
    path
    |> bottom_leaf_nodes
    |> build_tree
  end

  defp build_tree([root]), do: root

  defp build_tree(nodes) do
    child_pairs = Enum.chunk_every(nodes, 2)

    parents =
      Enum.map(child_pairs, fn child_pair ->
        concatenated =
          case child_pair do
            [left, right] ->
              left.value <> right.value

            [left] ->
              left.value <> left.value
          end

        %Merkle.Node{
          value: hash(concatenated),
          children: child_pair
        }
      end)

    build_tree(parents)
  end

  defp bottom_leaf_nodes(path) do
    path
    |> File.stream!([], 1000)
    |> Enum.map(fn block ->
      %Merkle.Node{
        value: hash(block),
        children: []
      }
    end)
  end

  defp hash(binary) do
    :crypto.hash(:sha256, binary)
  end
end
