# 再帰
def fact(num)
  raise ArgumentError, 'nは0以上の値でなければなりません' if num < 0
  return 1 if num.zero?
  num * fact(num - 1)
end

# refinementsで!メソッドを上書きする
class Array
  def my_include?(target_element)
    each do |elm|
      return true if elm === target_element
    end
    false
  end
end

class Array
  def my_concat(another)
    mycopy = inject([]) {|accum, elm| accum.push elm }
    another.inject(mycopy) {|accum, elm| accum.push elm }
  end
  def my_fetch(index)
    each_with_index do |elm, i|
      return elm if i == index
    end
  end
end
