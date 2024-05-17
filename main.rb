# frozen_string_literal: true

require_relative './tree'

puts "Running driver script!\n"

puts '#1. Creating a binary search tree from an array of random numbers between 1 and 100'
sleep(2)
elements = Array.new(15) { rand(1..100) }
bst = Tree.new(elements)
puts
bst.pretty_print

puts '#2. Confirming that the tree is balanced by calling `#balanced?`'
sleep(2)
puts bst.balanced? ? 'The tree is balanced!' : "The tree isn't balanced!"
puts

puts '#3. Printing out all elements in level, pre, post, and in order'
puts
puts 'Level Order Traversal'
p bst.level_order

puts
sleep(2)
puts 'PreOrder Traversal'
p bst.preorder

puts
sleep(2)
puts 'InOrder Traversal'
p bst.inorder

puts
sleep(2)
puts 'PostOrder Traversal'
p bst.postorder
puts

puts '#4. Unbalancing the tree by adding several numbers > 100'
puts
(100..115).each { |num| bst.insert(num) }
bst.pretty_print

puts '#5. Confirming that the tree is balanced by calling `#balanced?`'
sleep(2)
puts bst.balanced? ? 'The tree is balanced!' : "The tree isn't balanced!"
puts

puts '#6. Balancing the tree by calling `#rebalance`'
puts
sleep(2)
bst.rebalance
bst.pretty_print

puts '#7. Confirming that the tree is balanced by calling `#balanced?`'
sleep(2)
puts bst.balanced? ? 'The tree is balanced!' : "The tree isn't balanced!"
puts

puts '#8. Printing out all elements in level, pre, post, and in order'
puts
puts 'Level Order Traversal'
p bst.level_order

puts
sleep(2)
puts 'PreOrder Traversal'
p bst.preorder

puts
sleep(2)
puts 'InOrder Traversal'
p bst.inorder

puts
sleep(2)
puts 'PostOrder Traversal'
p bst.postorder
