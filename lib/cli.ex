defmodule Merkle.CLI do
  @path "priv/alice.txt"

  def main([]) do
    root_value = Merkle.root(@path).value |> Base.encode16(case: :lower)
    IO.puts("Merkel root value for #{@path}:\n#{root_value}")
  end

  def main([route]) do
    value = Merkle.lookup(@path, route).value |> Base.encode16(case: :lower)
    IO.puts("Merkel root value for #{@path} following route #{route}:\n#{value}")
  end
end
