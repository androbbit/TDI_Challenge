Rep = 100000

T = 5
i=0
final_length = c()
while (i < Rep){
      N = 64
      for (j in 1:T) {
      	  coord <- sample(N,2,replace = TRUE)
      	  n1 = coord[1]
      	  n2 = coord[2]
      	  s <- c(n1, n2-n1, N-n2)
      	  N = max(s)

      }     
      final_length[i+1] = N
      i = i+1
}

print("When N=64 and T=5")
paste("mean:",mean(final_length))
paste("sd:",sd(final_length))

prob_length_gt4 = length(final_length[final_length>4])
prob_length_gt8 = length( final_length[final_length>8])

paste("The prob:",prob_length_gt8/prob_length_gt4)



T = 10
i=0
final_length = c()
while (i < Rep){
      N = 1024
      for (j in 1:T) {
      	  coord <- sample(N,2,replace = TRUE)
      	  n1 = coord[1]
      	  n2 = coord[2]
      	  s <- c(n1, n2-n1, N-n2)
      	  N = max(s)

      }     
      final_length[i+1] = N
      i = i+1
}


print("When N=1024 and T=10")
paste("mean:",mean(final_length))
paste("sd:",sd(final_length))
prob_length_gt6 = length(final_length[final_length>6])
prob_length_gt12 = length( final_length[final_length>12])
paste("The prob:",prob_length_gt12/prob_length_gt6)

