require 'minitest/autorun' 
require_relative '../lib/QuickUnionFind'

describe QuickUnionFind do 
	before do 
		@quf = QuickUnionFind.new(10)
		@quf100 = QuickUnionFind.new(100)
	end
	let (:qufbig) {QuickUnionFind.new(100000) }

	it "should set unions" do 
		@quf.union(1, 0)
		assert_equal @quf.array[1], @quf.array[0]
		assert_equal 0, @quf.array[1]
		assert_equal 0, @quf.array[0]
	end 

	it "should find root" do 
		@quf.union(1, 0)

		result = @quf.root(1)
		assert_equal 0, result
		refute_equal 1, result
	end
	
	it "should know if they are connected" do 
		@quf.union(1, 0)
		@quf.union(5, 0)
		@quf.union(1, 6)
		@quf.union(2, 6)
		@quf.union(5, 6)
		assert_equal true, @quf.connected(1, 0)
		assert_equal true, @quf.connected(0, 1)
		assert_equal true, @quf.connected(5, 2)
	end

	it "should appropriate error" do 
		->{@quf.root(100)}.must_raise ArgumentError
	end




end

