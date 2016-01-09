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
		validate(child)
		validate(parent)
		p = root(parent)
		c = root(child)
		if connected(child, parent)
				
		elsif @size[c] < @size[p] 
			@array[p] = c
			@size[p] =@size[p]+ 1
		else 
			@array[c] = root(p)
			@size[c] = @size[c]+ 1
		end
	end

	def root(child)
		validate(child)
		while child != @array[child]
			child = @array[child]
		end
		child
	end

	def connected(child, parent)
		validate(child)
		validate(parent)
		root(child) == root(parent)
	end

	def validate(number)
		unless number < @array.length 
			raise ArgumentError 
		end
	end



end

