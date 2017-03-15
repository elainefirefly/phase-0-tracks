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
