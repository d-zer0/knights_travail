class Node
	attr_reader :pos, :left, :right, :up, :down
	
	def initialize(name, pos)
		@name = name
		@pos = pos
		@left = nil
		@right = nil
		@up = nil
		@down = nil
		create_relationships
	end

	def create_relationships
		left = [(pos[0]-1), pos[1]]
		@left = left if left.verify_relationship(left)
		
		right = [(pos[0]+1), pos[1]]
		@right = right if right.verify_relationship(right)

		up = [pos[0], (pos[1]+1)]
		@up = up if up.verify_relationship(up)

		down = [pos[0], (pos[1]-1)]
		@down = down if down.verify_relationship(down)
	end
end

class Array
	def verify_relationship(r)
		r.each {|i| i<0||i>8 ? (return false) : true}
	end
end

class Board
	attr_reader :nodes

	def initialize
		@nodes = Hash.new
		@new_node = nil
	end

	def create_nodes
		x_name = ["a","b","c","d","e","f","g","h"]
		y_name = [1,2,3,4,5,6,7,8]
		x_pos = 1
		x_name.each do |x|
			y_pos = 1
			y_name.each do |y|
				name = "#{x}#{y}"
				@new_node = Node.new(name, [x_pos,y_pos])
				@nodes[[x_pos, y_pos]] = @new_node
				y_pos +=1
			end
			x_pos += 1
		end
	end

	def relate_nodes
		@nodes.each do |k, v|
			if v.left != nil
				nodes.each {|checked| v.left = checked if checked == v.left}
			end
		end
	end
end

board = Board.new
board.create_nodes
board.relate_nodes
board.nodes.each do |node|
	puts node.inspect
	puts
end

#puts board.nodes["a1"].inspect

=begin
a1 = Node.new([0,0])
puts a1.inspect
puts

a2 = Node.new([0,1])
puts a2.inspect
=end