class Node
	attr_reader :pos, :left, :right, :up, :down
	
	def initialize(pos)
		@pos = pos
		@left = nil
		@right = nil
		@up = nil
		@down = nil
		#create_relationships
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

class Board
	def create_nodes
		x_axis = ["a","b","c","d","e","f","g","h"]
		y_axis = [1..8]
		count = 1
		x_axis.each do |x|
			y_axis.each do |x, y|
				name = x + y.to_s
				node = Node.new([0,0])
				@node = name
				puts "#{count}: #{name.inspect}"
				count +=1
			end
		end
		puts @name.to_s
	end
end

class Array
	def verify_relationship(r)
		r.each {|i| i<0||i>7 ? (return false) : true}
	end
end

board = Board.new
board.create_nodes

=begin
a1 = Node.new([0,0])
puts a1.inspect
puts

a2 = Node.new([0,1])
puts a2.inspect
=end