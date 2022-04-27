def iterative_merge_sort(arr) #bottom-up approach
  return arr if arr.length <= 1
  iterator = 1
  slice_basis = 2**iterator
  result = arr.clone
  while slice_basis <= arr.length
    slices = result.each_slice(slice_basis).to_a
    result = slices.reduce(Array.new){|basis, slice|
      left_half = slice[0..(slice.length/2.0).floor]
      right_half = slice[(slice.length/2.0).ceil..-1]
      left_half.pop if slice.length.even?
      basis.concat(merge(left_half,right_half))
      basis
    }
    iterator += 1
    slice_basis = 2**iterator
  end
  array_basis = 2**(iterator-1) #perform the slice basis and merge again in case arr.length was not a power of 2
  slices = result.each_slice(array_basis).to_a
  merge(slices[0],slices[1])
end

def recursive_merge_sort(arr) #top-down approach
  left_half = arr[0..(arr.length/2.0).floor]
  right_half = arr[(arr.length/2.0).ceil..-1] #nil if arr is size 1
  left_half.pop if arr.length.even? #both halves include the middle-right value if arr.length is even
  if left_half.length == 1 #right_half has to be size 1 or empty
    return merge(left_half,right_half)
  else
    return merge(recursive_merge_sort(left_half),recursive_merge_sort(right_half))
  end
end

def merge(arr1,arr2) #merge two sorted arrays into a single sorted array
  return arr1 if arr2.nil? || arr2.empty?
  return arr2 if arr1.nil? || arr1.empty?
  i = 0
  j = 0
  result = [];
  while i < arr1.length && j < arr2.length
    if arr1[i] < arr2[j] 
      result.push(arr1[i])
      i += 1
    elsif arr2[j] <= arr1[i]
      result.push(arr2[j])
      j += 1
    end
  end
  result.concat(arr1.slice(i..-1)) if i < arr1.length #concatenate the rest of whichever array is longer
  result.concat(arr2.slice(j..-1)) if j < arr2.length #concatenat the rest of whichever array is longer
  result
end