=begin
Author: Mike Files
Date: 07/27/2022
Project: Bubble Sorter
Description:
Without using the "sort" method, create a function that swaps two elements at a time.
It only swaps the elements if the one on the left is larger than the one on the right.
=end

def bubble_sort(array_arg)
    i = 0

    # create a loop that goes through the length of the array
    while i < array_arg.length do

        # if the first value is less than OR equal to the second then...
        if array_arg[i] < array_arg[i+1] || array_arg[i] == array_arg[i+1]
            
            # if the subject index is two from the end and it already passed the test above...
            if i == array_arg.length - 2

                # done; exit the loop
                break
            else

                # if not... jump to the next set of elements and re-evaluate
                i += 1
            end
        else
            
            # else... swap the values then start at the beginning of the array again
            first_value = array_arg[i]
            second_value = array_arg[i + 1]
            array_arg[i] = second_value
            array_arg[i + 1] = first_value
            i = 0
        end
    end

    return array_arg
end

print bubble_sort([4,3,78,2,0,2]) #=> [0,2,2,3,4,78]
