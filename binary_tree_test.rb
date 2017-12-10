require_relative "BinaryTree.rb"

binary_tree = BinaryTree.new()


data1 = [10, 7, 15, 2, 8, 12, 17]

binary_tree.build_tree(data1)

puts binary_tree.to_s
binary_tree.breadth_first_search(2)