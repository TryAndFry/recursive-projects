# Recursive Projects

The included .rb files both contain iterative and recursive algorithms for generating the Fibonacci numbers and for Merge Sorting data

## Fibonacci

The methods return an array containing the first n Fibonacci numbers

## Merge Sort

The methods return a new array of the sorted data. The iterative method utilizes a bottom-up approach while the recursive method utilizes a top-down approach. The iterative method first breaks down the array into slices containing two elemenets each, then merges those elements into a sorted array. Each of those resultig sorted slices then form the new array to be sorted, this time breaking down into slices of 4 elements each. Each half of this slice is already sorted from the previous step, so the slice is split in half and then merged into a sorted array. This process repeats until the slice-basis number is larger than the size of the array. The step is repeated one last time in case the array length is not a multiple of 2, which would mean the each_slice function in ruby would end up with a "tail" that did not get merged into the rest of the array