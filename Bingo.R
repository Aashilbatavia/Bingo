#### lab guys ####
players <- c("P1", "P2")

#### generate cards #####
numbers <- seq(1,90,1)
final <- data.frame(matrix("",ncol = 5))
for(i in players){
  card <- sample(numbers, 15, replace = F)
  card <- sort(card)
  grid <- data.frame(matrix(NA, nrow = 3, ncol = 5))
  grid$X1 <-card[1:3]
  grid$X2 <-card[4:6]
  grid$X3 <-card[7:9]
  grid$X4 <-card[10:12]
  grid$X5 <-card[13:15]
  grid <- rbind(c(i,"","","",""), grid)
  grid <- rbind(grid,c("","","","",""))
  final <- rbind(final, grid)
  # write.table(grid, paste("My Music/", i,".txt",sep =""), row.names = F, col.names = F, quote = F)
  # write.table(grid, "P:/Documents/Bingo.txt", row.names = F, col.names = F, quote = F, append = T)
  # assign(i, grid)
}
write.table(final, "P:/Documents/Bingo.txt", row.names = F, col.names = F, quote = F)
rm(grid, card, i)

###### game #####
tracker <- numeric()
terminate <- FALSE

BINGO <- function(){
  while(terminate == FALSE){
  readline(prompt="Press [enter] for the next number")
  if (length(tracker) < 89) {
    x <- sample(numbers, 1, replace = F)
    numbers <- numbers[-which(numbers == x)]
    tracker <- c(tracker, x)
    cat("\n The new number is:", x,"\n\n", sep = " ")
    cat(length(numbers), "/90", cat(" remaining: "), sep = "")
    cat("\n","Previous numbers: ",sort(tracker),"\n", sep = " ")
  } else if(length(tracker) == 89){
    tracker <- c(tracker, numbers)
    cat("\n The last number is:", numbers,"\n\n", sep = " ")
    cat("BINGO: End of the game!")
    terminate <- TRUE
  }
  }
 }
