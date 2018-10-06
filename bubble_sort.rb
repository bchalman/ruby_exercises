def bubble_sort (arr)
  i = 0
  iteration_num = 1
  sorted = false
  until sorted # iteration_num <= arr.length #arr.any? {|a,b| (a <=> b) == 1}
    sorted = true
    while i < (arr.length - iteration_num)
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        sorted = false
      end
      i += 1
    end
    iteration_num +=1
    i=0
  end
  arr
end

def bubble_sort_by(arr)
  i = 0
  iteration_num = 1
  sorted = false
  until sorted # iteration_num <= arr.length
    sorted = true
    while i< (arr.length - iteration_num)
      compare_result = yield(arr[i], arr[i+1])
      if compare_result > 0
        arr[i], arr[i+1] = arr[i+1], arr[i]
        sorted = false
      end
      i += 1
    end
    iteration_num += 1
    i = 0
  end
  arr
end

array1 = [4,5,3,2,1]
array2 = [6,3,4,1,2,5]
p bubble_sort(array1)
p bubble_sort(array2)

array3 = bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end

p array3
