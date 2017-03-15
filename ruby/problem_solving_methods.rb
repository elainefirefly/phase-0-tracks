# Release 0
def search_array(arr, num)
    arr.each_with_index do |n, i|
        if n == num
            return i
        end
    end
    nil
end

arr = [42, 89, 23, 1]
p search_array(arr, 1)
p search_array(arr, 24)

# Release 1
def fib(num)
  arr = [0,1]
  i = 0
  while i < num - 2
    arr.push(arr[i] + arr[i+1])
    i += 1
  end
  arr
end

p fib(100).last == 218922995834555169026
