class QuickUnionFind
	attr_reader :array, :size 
	def initialize(length) 
		@array = []
		@size = []
		(0..length).each do |x|
			@array[x] = x
			@size[x] = 1
		end
	end 

	def union(child, parent)
		if @size[child] < @size[parent] 
			@array[parent] = @array[child]
			@size[parent] += 1
		else 
			@array[child] = @array[parent]
			@size[child] += 1
		end
	end

	def root(child)
		while @array[child] != child
			child = @array[child]
		end
		child
	end

	def connected(child, parent)
		root(child) == root(parent)
	end


end

