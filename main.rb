# frozen_string_literal: true

require_relative './tree'

# 1. Creating a binary search tree from an array of random numbers between 1 and 100
elements = Array.new(15) { rand(1..100) }
bst = Tree.new(elements)

# 2. Confirming that the tree is balanced by calling #balanced?
puts bst.balanced? ? 'The tree is balanced!' : "The tree isn't balanced!"

# 3. Printing out all elements in level, pre, post, and in order
puts 'Level order:', bst.level_order
puts 'Preorder:', bst.preorder
puts 'Inorder:', bst.inorder
puts 'Postorder:', bst.postorder

# 4. Unbalancing the tree by adding several numbers > 100
(100..115).each { |num| bst.insert(num) }

# 5. Confirming that the tree is balanced by calling #balanced?
puts bst.balanced? ? 'The tree is balanced!' : "The tree isn't balanced!"
bst.pretty_print

# 6. Balancing the tree by calling #rebalance
bst.rebalance
bst.pretty_print

# 7. Confirming that the tree is balanced by calling #balanced?
puts bst.balanced? ? 'The tree is balanced!' : "The tree isn't balanced!"

# 8. Printing out all elements in level, pre, post, and in order
puts 'Level order:', bst.level_order
puts 'Preorder:', bst.preorder
puts 'Inorder:', bst.inorder
puts 'Postorder:', bst.postorder
