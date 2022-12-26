class Node

  include Comparable
  attr_accessor :data, :left, :right
  def initialize(value)
    @data = value

    @left = nil
    @right = nil
  end
end

class Tree

  attr_accessor :root, :data
  def initialize(array)

    @data = array.uniq.sort
    @root = build_tree(@data)

  end

  def build_tree(array)
    return nil if array.empty?

      mid = (array.length - 1) / 2
      root = Node.new(array[mid])

      root.left = build_tree(array.slice(0...mid))
      root.right = build_tree(array.slice((mid + 1)..-1))

      return root

  end

  def search(root=@root, key)
    if root == nil || root.data == key
      return root
    end

    if root.data < key
      return search(root.right, key)
    end

    return search(root.left, key)

  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

test_arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

test_tree = Tree.new(test_arr)

test_tree.pretty_print

puts test_tree.search(7)