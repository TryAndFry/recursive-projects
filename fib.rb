def iterative_fib(n)
  return [] if n <= 0 #check input
  results = [0] 
  until results.size == n
    results.length == 1 ? results.push(1) : results.push(results[-1] + results[-2])
  end
  results
end

def recursive_fib(n)
  return [] if n <= 0 #check input
  return [0,1].slice(0,n) if n <= 2 #base case
  one_less = recursive_fib(n-1)
  one_less.push(one_less[-1] + one_less[-2])
  #recursive_fib(n-1).push(recursive_fib(n-1)[-1] + recursive_fib(n-1)[-2]) 
  #the above line has too many stack calls for n >17, the new implentation performs better
end