require_relative "Node.rb"

class BinaryTree

	def initialize()
		@root = Node.new()
		@size = 0
	end

	def add(data, current_node=@root)
		if @size == 0
			@root.data = data
			@size += 1
			return
		end

		if data < current_node.data
			if current_node.left_node == nil
				new_node = Node.new(data)
				current_node.left_node = new_node
				@size += 1
			else
				self.add(data, current_node.left_node)
			end
		elsif data > current_node.data
			if current_node.right_node == nil
				new_node = Node.new(data)
				current_node.right_node = new_node
				@size += 1
			else
				self.add(data, current_node.right_node)
			end
		else
			current_node.count += 1
			@size += 1
		end
	end

	def build_tree(data)

		data.each { |entry| self.add(entry) }

	end

	def breadth_first_search(data, current_node=@root, queue=[])
		return current_node if current_node.data == data


		if current_node.left_node != nil
			queue.push(current_node.left_node)
		end

		if current_node.right_node != nil
			queue.push(current_node.right_node)
		end

		next_node = queue.shift
		breadth_first_search(data, next_node, queue)

	end

	def to_s(current_node=@root)
		description = ""

		if(current_node.left_node != nil)
			description += "#{self.to_s(current_node.left_node)}"
		end

		description += "#{current_node.data} "

		if(current_node.right_node != nil)
			description += "#{self.to_s(current_node.right_node)}"
		end

		return description

	end

end