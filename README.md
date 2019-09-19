# Merkle

Get the Merkle root of the file at priv/alice.txt.

# Run the CLI

Get merkle root of the file:

```
./merkle
```

Print the hash of a node found at a particular route (0 means left, 1 means right):

```
./merkle 00000101
```

NOTE: If, when forming a row in the tree (other than the root of the tree), it would have an odd number of elements, the final double-hash is duplicated to ensure that the row has an even number of hashes. So every node always has a left and right child unless it is a leaf in which case it has no children.

# Development

Elixir is required for the following:

## Run the tests

```elixir
mix deps.get
mix test
```

## Build the CLI app

```
mix escript.build
```