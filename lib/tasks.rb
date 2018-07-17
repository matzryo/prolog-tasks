module Factorial
  def fact
    raise RangeError, 'nは0以上の値でなければなりません' if self < 0
    return 1 if zero?
    self * (self - 1).fact
  end
end

module MyInclude
  def my_include?(target_element)
    each do |elm|
      return true if elm == target_element
    end
    false
  end
end

module MyConcat
  def my_concat(another)
    mycopy = inject([]) { |accum, elm| accum.push elm }
    another.inject(mycopy) { |accum, elm| accum.push elm }
  end
end

module MyFetch
  def my_fetch(index)
    each_with_index do |elm, i|
      return elm if i == index
    end
  end
end

module MyQuickSort1
  def my_quicksort
    # 非破壊的メソッドにしたい
    dup.my_inner_quicksort
  end

  protected

  def my_inner_quicksort
    return self if length <= 1

    small, large = my_partition

    small.my_quicksort + large.my_quicksort
  end

  private

  def my_partition
    left = 0
    right = length - 1

    while left < right
      left, right = my_search(left, right)
      break if left >= right
      my_swap(left, right)
    end

    [self[0...left], self[left..-1]]
  end

  def pivot
    self[(length / 2)]
  end

  def my_search(left, right)
    left += 1 while self[left] < pivot
    right -= 1 while self[right] > pivot
    [left, right]
  end

  def my_swap(one, another)
    tmp = self[one]
    self[one] = self[another]
    self[another] = tmp
  end
end

module MyQuickSort2
  def my_quicksort2
    return self if length <= 1
    # lastだと、無限再帰になりうる
    pivot = pop
    smaller, larger = partition { |e| e < pivot }
    push pivot
    smaller.my_quicksort2.append + [pivot] + larger.my_quicksort2
  end
end
