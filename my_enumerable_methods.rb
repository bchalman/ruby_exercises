module Enumerable

  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    new_arr = []
    self.my_each do |i|
      new_arr << i if yield(i)
    end
    new_arr
  end

  def my_all?
    self.my_each { |i| return false if !yield(i) }
    true
  end

  def my_any?
    self.my_each { |i| return true if yield(i) }
    false
  end

  def my_none?
    self.my_any? { |i| return false if yield(i)}
    true
  end

  def my_count(value = nil)
    count = 0
    if block_given?
      count = self.my_select{|i| yield(i)}.length
    elsif value
      count = self.my_select{|i| value == i}.length
    else
      count = self.length
    end
    count
  end

  def my_map (proc = nil)
    mapped_arr = []
    if proc
      self.each { |i| mapped_arr << proc.call(i) }
    elsif block_given?
      self.each { |i| mapped_arr << yield(i)}
    end
    mapped_arr
  end

  def my_inject(default = nil)
    default ? total = default : total = self[0]
    for i in self[1...self.length] do
      total = yield(total, i)
    end
    total
  end

end

def multiply_els(arr)
  arr.my_inject{|total, i| total * i}
end

puts multiply_els([2,4,5])
