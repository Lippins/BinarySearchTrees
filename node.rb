# frozen_string_literal: true

# Handles the behaviour of the binary trees node
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other)
    other = other.instance_of?(Node) ? other.data : other
    @data <=> other
  end

  def child?
    @left || @right ? true : false
  end
end

# test = Node.new(8)
# puts(test > 7)
