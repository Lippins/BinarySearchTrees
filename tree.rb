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
    # inserts value as a new node in the tree
    return Node.new(value) unless current_node

    if current_node > value
      current_node.left = insert(value, current_node.left)
    elsif current_node < value
      current_node.right = insert(value, current_node.right)
    end

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
test.insert(23)
test.pretty_print
