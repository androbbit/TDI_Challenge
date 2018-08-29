mydata = read.csv("../data.csv") 
newdata = na.omit(mydata) 
paste("The number of complaints with complete information:",nrow(newdata))

boroughs = levels(newdata$Borough)
complaints = c()

for(i in 1:length(boroughs)){
      complaints[i] = nrow(newdata[which(newdata$Borough==boroughs[i]),])
}

total_complaints = sum(complaints)

proportions = c()

for(i in 1:length(boroughs)){
      proportions[i] = complaints[i]/total_complaints
}

paste("The proportion of complaints occur in the borough with the largest number of complaints:", max(proportions))

populations = c(1471160, 2648771, 1664727, NA, 2358582, 479458)
populations = populations/100000
complaints_per_capita = c()


for(i in 1:length(boroughs)){
      complaints_per_capita[i] = complaints[i]/populations[i]
}

paste("The number of complaints per 100k residents were there in the borough with the highest number of complaints per capita:",max(na.omit(complaints_per_capita)))

years_taken = newdata$Close.Year-newdata$Received.Year
paste("The average year it takes:", mean(years_taken))

year = c(2005:2016)
complaints_with_stopfrisk = c()
for(i in 1:length(year)){
      complaints_with_stopfrisk[i] = nrow(newdata[which(newdata$Complaint.Contains.Stop...Frisk.Allegations==TRUE & newdata$Incident.Year==year[i]),])
}

df = data.frame(year,complaints_with_stopfrisk)
colnames(df) = c("year","number")
coeff = coefficients(lm(number~year,data=df))

paste("The predicted number of complaints in 2018:",coeff[2]*2018+coeff[1])

print("The chi-squared value for the given hypothesis:")
chisq.test(newdata$Complaint.Has.Video.Evidence, newdata$Is.Full.Investigation)



number_of_percincts = c(12, 23, 22, 16, 4)
complaints[4] = NA
complaints_no_outNYC = na.omit(complaints)
proportions_no_outNYC = c()

for(i in 1:length(number_of_percincts)){

      proportions_no_outNYC[i] = complaints_no_outNYC[i]/sum(complaints_no_outNYC)
}

officers = c()
officers_per_percinct = c()


for(i in 1:length(number_of_percincts)){
      officers[i] = proportions_no_outNYC[i]*36000
      officers_per_percinct[i] = officers[i]/number_of_percincts[i]
}

paste("The ratio of the highest number of officers per precinct to the lowest number of officers per precinct:",max(officers_per_percinct)/min(officers_per_percinct))