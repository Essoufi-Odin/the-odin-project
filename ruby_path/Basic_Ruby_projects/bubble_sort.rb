# implement bubble sort to an array

def bubble_sort(array)
#define max iterations of the array
max_iterations = array.size - 1
max_iterations.times do
    array.each_with_index do |number, index|
        
        next_element = array[index + 1]
        break if array[index + 1].nil? 
        if number > next_element
         array[index] = next_element
         array[index + 1] = number
        
        end
        
    end
end
array
 
end
p bubble_sort([4,3,78,2,0,2])