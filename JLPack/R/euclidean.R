euclidean <- function(a, b){
  # checks the input
  if(any(!is.numeric(c(a, b))) |    # a and b has to be an integer
     any(length(a)!=1|length(b)!=1) # a and b has to be a single value
  ) {stop()}
  
  while (b != 0) { # it runs as long as b is not zero (a smaller divider still exists)
    t <- b         # stores t (temporary value) as the remainder (b from input the first time)
    b <- a %% b    # calculates the remainder from the division of a and b and stores it as b
    a <- t         # stores a as the temporary value for the next division (or the smallest common divisor) 
  }
  return(a)        # returns the smallest common divisor
}

