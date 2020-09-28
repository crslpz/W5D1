class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key.hash) || count == num_buckets
      i = key.hash % num_buckets
      @store[i] << key.hash
      @count += 1
    end

    if @count == num_buckets
      resize!
    end
  end

  def include?(key)
    i = key.hash % num_buckets
    @store[i].include?(key.hash)
  end

  def remove(key)

    unless !include?(key)
      i = key.hash % num_buckets
      @store[i].delete(key.hash)
      @count -= 1
    end
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
    prev_length = prev.length
    @count = 0
    @store = Array.new(prev_length*2) { Array.new }
    prev.flatten.each {|key| insert(key.hash)}
  end
end
