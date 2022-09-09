dijkstra <- function(graph, init_node){
  
  # checks the input
  if (init_node <= 0 |         # init_node has to be greater than 0
      !is.numeric(init_node)|  # init_node has to be a numeric value
      !is.data.frame(graph) |  # graph needs to be a data.frame
      any(!is.numeric(c(graph$v1, graph$v2, graph$w))) |  # "v1", "v2" and "w" has to be numeric
      ! any(colnames(graph) %in% c("v1", "v2", "w"))      # graph needs to be named: "v1", "v2" and "w"
  ) { stop()}
  
  # Create empty vectors 
  dist <- c()   # distance vector used to store distances between the initial node and other vertices 
  Q <- c()      # used to store vertices linked to a current vertex that have not been tried
  
  graph_vertices <- unique(graph$v1)  # stores respective vertices 
  for (v in graph_vertices) {       # the for loop used to assign initial values for every vertex in the graph 
    dist[v] <- Inf                  # dist[v] gets Inf and returns it if there are no neighbors to the current vertex
    Q[v] <- v                       # assigns all the vertices in the graph
  }
  
  dist[init_node] <- 0              # distance to the initial node is always zero
  
  while (length(Q) > 0) {           # the while loop will run as long as there are paths to be tried
    u <- Q[which.min(dist[Q])]      # vertex in Q with the minimum distance 
    Q <- Q[Q!=u]                    # removes the selected u from Q 
    
    neighbor <- graph$v2[graph$v1==u] # selecting the neighbors of u
    for (v in neighbor) {             # testing the length of all the paths to the neighbors of u
      alt <- dist[u] + graph$w[graph$v1==v & graph$v2==u]   # the alternative path is the previously selected path and the newly selected path 
      
      if (alt < dist[v]) {            # checks if the alternative path is shorter than the previously selected path
        dist[v] <- alt                # this overwrites the previously selected path with the new shorter path
      }
    }
  }
  return(dist)                        # returns a vector of the shortest distances (stored during the tests)
}


