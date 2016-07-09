require_relative "../linked_list.rb"

RSpec.describe LinkedList, "#append" do
		node1 = "node1"
		node2 = "node2"
		node3 = "node3"
		node4 = "node4"
		node5 = "node5"
		node6 = "node6"
		list = LinkedList.new(node1)
	 
	
	context "#append" do
		

		it "adds a new node to start of the list" do

			expect(list.head.value).to eq node1
		end
		it "adds a new node at end of list" do
			list.append(node2)
			expect(list.tail.value).to eq node2
		end

		it "expects lits.head to be a Node" do
			list.append(node2)
			expect(list.head).to be_a Node 
			expect(list.tail).to be_a Node
		end

		it "expects @tail.next_node to be nil" do
			list.append(node2)
			expect(list.tail.next_node).to eq nil
		end
		it "expects @tail.bale to be node3" do
			list.append(node2)
			list.append(node3)
			expect(list.tail.value).to eq node3
		end
		it "expects @head.next_node to be eq to 2nd item" do
			list.append(node2)
			list.append(node3)
			expect(list.head.next_node.value).to eq node2
		end
	end

	context "#prepend" do
		

		it "expects head node to become prepended node" do
			list.prepend(node2)
			expect(list.head.value).to eq node2
			expect(list.head.next_node.value).to eq node1

		end

	end

	context "#size" do
		
		it "returns the total number of nodes in the list " do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			newList.append(node4)
			newList.append(node5)
			newList.append(node6)
			expect(newList.size).to eq 6
		end
	end

	context "#head and #tail" do
		
		it "list.head to return head node" do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			newList.append(node4)
			newList.append(node5)
			newList.append(node6)
			expect(newList.head.value).to eq node1
		end
		it "list.tail to return last node" do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			newList.append(node4)
			newList.append(node5)
			newList.append(node6)
			expect(newList.tail.value).to eq node6
			expect(newList.head.value).to eq node1
		end
	end

	context "#at(index)" do
		
		it "should return the node at a given index" do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			newList.append(node4)
			newList.append(node5)
			newList.append(node6)
			expect(newList.at(1).value).to eq node1 #because it was prepended
		end

		it "should return a error if the argument is too big" do
			expect(list.at(100)).to eq "Index too small"
		end
		it "should return head node for first index" do
			expect(list.at(1)).to eq list.head
		end
	end
	context "#pop" do
		
		it "expects the last node to be node 2" do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			newList.append(node4)
			newList.append(node5)
			newList.append(node6)
			newList.pop
			expect(newList.tail.value).to eq node5
		end
		it "expects the size to decrease by one" do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			newList.append(node4)
			newList.append(node5)
			newList.append(node6)
			expect(newList.size).to eq 6
		end
	end

	context "#contains" do
		

		it "expects list.contains?(node3) to be true" do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			newList.append(node4)
			newList.append(node5)
			newList.append(node6)
			expect(newList.size).to eq 6
			expect(newList.contains?(node2)).to eq true
		end 
		it "expects list.contains? to return false" do
			nodes = Node.new("bla")
			list.append(nodes)
			expect(list.contains?(nodes)).to eq false
		end
	end

	context "#find(data)" do
		
		it "returns index of node containing data" do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			newList.append(node4)
			newList.append(node5)
			newList.append(node6)
			expect(newList.find(node2)).to eq 2
		end

		it "returns nil for no mathching node" do
			
			expect(list.find(node4)).to eq nil
		end
	end

	context "#to_s" do
		

	it "returns nodes in a string form" do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			expect(newList.to_s).to eq "(#{node1}) ->  (#{node2}) ->  (#{newList.tail.value}) ->  nil"

		end
	end

	context "#insert_at" do
		it "inserts a node at a particular index" do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			newList.insert_at(3,node4)
			expect(newList.at(2).next_node.value).to eq node4
		end
	end

	context "#remove_at" do
		it "removes a node at a particular index" do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			newList.append(node4)
			newList.append(node5)
			newList.append(node6)
			newList.remove_at(2)
			expect(newList.at(5).value).to eq node6
		end
		it "removes a node at a particular 1st index" do
			newList = LinkedList.new(node1)
			newList.append(node2)
			newList.append(node3)
			newList.append(node4)
			newList.append(node5)
			newList.append(node6)
			newList.remove_at(1)
			expect(newList.at(1).value).to eq node2
		end
	end

end





