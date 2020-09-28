class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max) {false}
  end
# { 0, 2, 3 }
#[true, false, true, true]
  def insert(num)
    
     raise "Out of bounds" if num > @max || num < 0
     
     @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    
  end

  def insert(num)
    i = num % 20
    
    @store[i] << num
  end

  def remove(num)
    i = num % 20

    @store[i].delete(num)

  end

  def include?(num)
    i = num % 20
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    unless include?(num) || count == num_buckets
      i = num % num_buckets
      @store[i] << num 
      @count += 1
    end

    if @count == num_buckets
      resize!
    end
  end


  def remove(num)


    
    unless !include?(num)
      i = num % num_buckets
      @store[i].delete(num)
      @count -= 1
    end

  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
    
  end

  private

  def [](num)
    
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!

      prev = @store
      @count = 0
      @store = Array.new(prev_length*2) { Array.new }
      prev.flatten.each {|num| insert(num)}
  end
end
