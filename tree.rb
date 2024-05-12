# frozen_string_literal: true

require './node'
# Handles the attributes of the Balanced Binary Search Tree (BST)
class Tree
  def initialize(elements)
    @root = build_tree(elements)
  end

  def build_tree(elements)
    return nil if elements.empty?

    elements = elements.uniq.sort
    mid = elements.length / 2
    root_node = Node.new(elements[mid])

    root_node.left = build_tree(elements[0...mid])
    root_node.right = build_tree(elements[mid + 1...])

    root_node
  end

  def insert(value, current_node = @root)
    # Inserts value as a new node in the tree
    return Node.new(value) unless current_node

    if current_node > value
      current_node.left = insert(value, current_node.left)
    elsif current_node < value
      current_node.right = insert(value, current_node.right)
    end

    current_node
  end

  def delete(value, current_node = @root)
    # Deletes specified value from the tree.
    return nil unless current_node

    if current_node > value
      current_node.left = delete(value, current_node.left)
    elsif current_node < value
      current_node.right = delete(value, current_node.right)
    else
      current_node = handle_deletion(current_node)
    end
    current_node
  end

  def handle_deletion(node)
    # The deletion value is a leaf node or has only one subtree
    return node.right unless node.left
    return node.left unless node.right

    # The deletion value is a leaf node or has only one subtree
    replace_and_delete_min(node)
  end

  def replace_and_delete_min(node)
    # Swaps a nodes value with its minimum successor
    min_successor = min_value(node.right)
    node.data = min_successor.data
    node.right = delete(min_successor, node.right)
    node
  end

  def min_value(current_node = @root)
    # Returns the node with the smallest value in a tree.
    current_node = current_node.left while current_node.left
    current_node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
puts test
test.pretty_print
test.insert(10)
test.insert(16)
test.insert(1.2)
test.pretty_print
test.delete(8)
test.pretty_print
