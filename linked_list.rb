class LinkedList
		attr_accessor :head, :tail

		def initialize(value)
			node = Node.new(value)
			@head = node 
			@head.next_node = @tail
			@@size = 1
		end

		def append(value)
			@@size += 1
			value = Node.new(value)
			if @head.next_node.nil?
				@head.next_node = value
				@tail = @head.next_node
				@tail.next_node = nil
			else
				@tail.next_node = value
				@tail = @tail.next_node
			end
			
			 
		end

		def prepend(value)
			@@size += 1
			value = Node.new(value)
			if @head.nil?
				@head = value
			else
				value.next_node = head
				@head = value
			end
		end

		def size
			@@size
		end

		def at(index)
			if index > @@size
				return "Index too small"
			end
			 node = @head
			 i = 0
			 while i != @@size
			 	i += 1
			 	if i == index
			 		return node
			 	else
			 		node = node.next_node
			 	end
			 end
			 return node
		end

		def pop
			@@size -= 1
			@tail = nil
			@tail = self.at(@@size)
		end

		def contains?(value)
			i = 0
			while i != @@size
				i += 1
				if self.at(i).value == value
					return true
				end
			end
			return false
		end

		def find(value)
			i = 0
			while i != @@size
				i += 1
				if self.at(i).value == value
					return i				
				end
			end
			return nil
		end

		def to_s
			i = 0
			data = []
			while i != @@size
				i += 1
				data.push("(#{self.at(i).value}) -> ")
			end
			data.push("nil")
			data = data.join(",")
			return data.gsub!(",", " ")
		end

		def insert_at(index, value)
			prev_node = at(index - 1)
			current = at(index)
			current = Node.new(value)
			prev_node.next_node = current
			@@size += 1
		 
		end

		def remove_at(index)
			if index == 1
				@head = @head.next_node
				@@size -= 1
				return
			end
			current = at(index)
			next_node = current.next_node
			prev_node = at(index - 1)
			current = nil
			prev_node.next_node = next_node
			@@size -= 1
		end

end

class Node
	attr_accessor :value, :next_node

	def initialize(value)
		@value = value
		@next_node = nil
	end

end