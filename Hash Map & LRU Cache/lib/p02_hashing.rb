class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    str = ""
    self.each do |ele|
      str += ele.to_s
    end
    str = str.to_i
    str.hash
  end
end

class String
  def hash
    alpha = ('A'.."z").to_a
    str = ""
    self.each_char do |letter|
      str += alpha.index(letter).to_s
    end
    str = str.to_i
    str.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array = []
    self.each do |k, v|
      array << k.to_s
      array << v.to_s
    end

    array.sort.hash
  end
end
