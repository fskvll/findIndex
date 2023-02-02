
# input value in the sorted array using a binary search

#slavkovic 2022 - fsst uebung

daten = [17, 11, 22, 45, 78, 8, 7, 9, 2]

# method to sort the array using a heap sort
def heap_sort(daten, n)
  # Start at the last parent node and work backwards
  (n/2 - 1).downto(0) do |i|
    turnheap(daten, n, i)
  end


  print daten;


  # Sort array by swapping the largest value with the last value
  # in the array, then reducing the size of the unsorted portion of
  # the array and repeating
  (n-1).downto(0) do |i|
    daten[0], daten[i] = daten[i], daten[0]
    turnheap(daten, i, 0)
  end
end

# Define method to maintain the max heap property for a node
def turnheap(daten, n, i)
    largest = i
  l = 2 * i + 1
  r = 2 * i + 2

  # Check if the left child is larger than the parent
  if l < n && daten[l] > daten[largest]
    largest = l
  end

  # Check if the right child is larger than the parent
  if r < n && daten[r] > daten[largest]
    largest = r
  end

  # If the largest value is not the parent, swap it with the parent
  # and repeat the process for the subtree rooted at the largest value
  if largest != i
    daten[i], daten[largest] = daten[largest], daten[i]
    turnheap(daten, n, largest)
  end
end


def binary_search(daten, n, value)

  left = 0
  right = n - 1


  while left <= right
    # calculate the middle index
    middle = (left + right) / 2

    # check if the value at the middle index is equal to the search value
    if daten[middle] == value

      return middle
    elsif daten[middle] < value
      # move the left index to the middle + 1 if the value at the middle is less than the search value
      left = middle + 1
    else
      # move the right index to the middle - 1 if the value at the middle is greater than the search value
      right = middle - 1
    end
  end

  # return -1 if value is not found
  return -1
end


# Sort the array using the heap sort method
heap_sort(daten, daten.length)

# Loop to get input values and search for them in sorted array
loop do
  print "Wert = "
  value = gets.to_i
  break if value == -1
  index = binary_search(daten, daten.length, value)
  puts "Index = #{index}"
end
