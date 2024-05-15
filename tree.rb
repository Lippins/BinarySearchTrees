# frozen_string_literal: true

require './node'
# Handles the attributes of the Balanced Binary Search Tree (BST)

# rubocop: disable Metrics/ClassLength
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

  def find(value, current_node = @root)
    return nil unless current_node

    if current_node > value
      find(value, current_node.left)
    elsif current_node < value
      find(value, current_node.right)
    else
      current_node
    end
  end

  # Iterative aproach for breadth-first traversal
  def level_order(current_node = @root)
    return [] unless current_node

    queue = [current_node]
    result = []

    until queue.empty?
      current_node = queue.shift
      result << current_node.data
      yield current_node if block_given?
      # Enqueue left and right children if they exist
      queue << current_node.left if current_node.left
      queue << current_node.right if current_node.right
    end

    result unless block_given?
  end

  # Performs a preorder traversal of a binary search tree.
  # Yields each node's data to a provided block, if given.
  # Returns an array of all node data if no block is given.
  def preorder(current_node = @root, result = nil, &blk)
    return result || [] unless current_node

    result ||= []

    if block_given?
      yield current_node
    else
      result << current_node.data
    end
    preorder(current_node.left, result, &blk)
    preorder(current_node.right, result, &blk)
    result unless block_given?
  end

  # Performs a preorder traversal of a binary search tree.
  def inorder(current_node = @root, result = nil, &blk)
    return result || [] unless current_node

    result ||= []
    inorder(current_node.left, result, &blk)
    if block_given?
      yield current_node
    else
      result << current_node.data
    end
    inorder(current_node.right, result, &blk)
    result unless block_given?
  end

  # Performs a postorder traversal of a binary search tree.
  def postorder(current_node = @root, result = nil, &blk)
    return result || [] unless current_node

    result ||= []
    postorder(current_node.left, result, &blk)
    postorder(current_node.right, result, &blk)
    if block_given?
      yield current_node
    else
      result << current_node.data
    end

    result unless block_given?
  end

  def height(current_node = @root)
    return -1 unless current_node # Base case: if there's no node, return -1 (no edges).

    # Recursively calculate the height of each subtree.
    left_height = height(current_node.left)
    right_height = height(current_node.right)

    # The height of the tree is the max height of the subtrees plus one edge to reach the subtree.
    [left_height, right_height].max + 1
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def handle_deletion(node)
    # The deletion value is a leaf node or has only one subtree
    return node.right unless node.left
    return node.left unless node.right

    # The deletion value has both  left and right subtrees
    replace_and_delete_min(node)
  end

  def replace_and_delete_min(node)
    # Swaps a node's value with its minimum successor
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
end
# rubocop:enable Metrics/ClassLength

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
puts test
test.pretty_print
test.insert(10)
test.insert(16)
test.insert(1.2)
test.pretty_print
# puts test.find(8)
# puts test.find(0)
# puts test.find(16)
p test.height
