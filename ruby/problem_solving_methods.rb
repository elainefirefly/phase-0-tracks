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

=begin
Release 2
pseudocode:
- create a function that takes an array of integers
- check if array is empty or has only one element, if so, return array
- create a boolean flag (swap) to track swapping, initialized to true
- create a while loop that will continue while swap is true
- in the while loop, create an index variable and initialize to 0
- set swap to false
- nest another while loop that will continue until the index reaches the length of the array minus one
- in the nested loop, check if the value of i is greater than the value of i+1 index in the array
- if so, swap the two values and set the swap flag to true
- outside the while loop, return the sorted array
=end

def bubble_sort(arr)
    return arr if arr.empty? || arr.one?
    swap = true
    while swap
        swap = false
        i = 0
        while i < arr.length-1
            if arr[i]>arr[i+1]
                arr[i],arr[i+1] = arr[i+1],arr[i]
                swap=true
            end
            i += 1
        end
    end
    arr
end

array = [76, 3, 87, 12, 4, 99, 22]
p bubble_sort(array)
