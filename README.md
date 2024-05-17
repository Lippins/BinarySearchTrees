# Binary Search Tree (BST) Implementation in Ruby

This project implements a Binary Search Tree (BST) in Ruby, focusing on basic tree operations such as insertion, deletion, and traversal. A BST is a data structure that facilitates fast lookup, addition, and deletion, all of which operate on average at O(log n) time complexity.

## Features

- **Node Class:** Represents a tree node with attributes for data, and pointers to left and right children. Includes Comparable for easy data comparison.
- **Tree Class:** Manages the overall tree operations and stores the root node.
- **Build Tree:** Constructs a balanced BST from a sorted array with duplicates removed.
- **Insert/Delete:** Efficiently manages elements insertion and removal while maintaining tree balance.
- **Find:** Searches for a node with the specified value.
- **Traversal:** Includes methods for _level-order_, _pre-order_, _in-order_, and post-order traversal, which can operate with or without a provided block.
- **Tree Analysis:** Methods to determine the _height_ and _depth_ of a node.
- **Balanced Check**: Verifies if the tree is balanced, where no subtrees differ in height by more than one.
- **Rebalance:** Rebuilds the tree to ensure optimal balance.
- **Pretty Print:** Visually represents the tree structure.

## Usage

Below is a brief guide on how to use the Binary Search Tree implementation.

```ruby
# Create a new tree from an array of random numbers
tree = Tree.new(Array.new(15) { rand(1..100) })
```

## Basic Operations

```ruby
# Insert elements
tree.insert(125)
tree.insert(200)

# Delete an element
tree.delete(125)
```

## Find an element

```ruby
node = tree.find(77)
puts node.data
```

### Example Output

```ruby
77
```

## Traversal

```ruby
# Print elements in various orders
puts "Levelorder:", tree.level_order.join(" ")
puts "Preorder:", tree.preorder.join(" ")
puts "Inorder:", tree.inorder.join(" ")
puts "Postorder:", tree.postorder.join(" ")
```

### Example Output

```ruby
Levelorder: 77 50 93 30 60 85 100
Preorder: 77 50 30 60 93 85 100
Inorder: 30 50 60 77 85 93 100
Postorder: 30 60 50 85 100 93 77
```

## Rebalancing

```ruby
# Unbalance the tree and rebalance it
puts "Balanced? #{tree.balanced?}"
tree.insert(300)
tree.insert(350)
puts "Balanced? #{tree.balanced?}"
tree.rebalance
puts "Balanced? #{tree.balanced?}"
tree.pretty_print
```

### Example Output

```ruby
Balanced? true
Balanced? false
Balanced? true
```

## Visualizing the Tree

```ruby
# To see a graphical representation of the tree
tree.pretty_print
```

### Example Output

```ruby
    ┌── 95
┌── 93
│   └── 77
...
│   │   └── 12
└── 10
    └── 7
```

## Languages

- Ruby
