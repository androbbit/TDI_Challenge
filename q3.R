#import data
bikedata = read.csv("data.csv")

#discard rows with missing information
bikedata = na.omit(bikedata)

#separate the data by year
bikedata_2014 = bikedata[which(bikedata$year==2014),]
bikedata_2015 = bikedata[which(bikedata$year==2015),]
bikedata_2016 = bikedata[which(bikedata$year==2016),]
bikedata_2017 = bikedata[which(bikedata$year==2017),]

#construct frequency table of stations where people get a bike
ftable_2014=as.data.frame(table(bikedata2014$to_station_id))
ftable_2015=as.data.frame(table(bikedata2015$to_station_id))
ftable_2016=as.data.frame(table(bikedata2016$to_station_id))
ftable_2017=as.data.frame(table(bikedata2017$to_station_id))

#get top 5 most used stops
top5_2014 = ftable_start2014[order(-ftable_start2014$Freq),][1:5,]
top5_2015 = ftable_start2015[order(-ftable_start2015$Freq),][1:5,]
top5_2016 = ftable_start2016[order(-ftable_start2016$Freq),][1:5,]
top5_2017 = ftable_start2017[order(-ftable_start2017$Freq),][1:5,]

#get top 5 least used stops
last5_2014 = ftable_start2014[order(ftable_start2014$Freq),][1:5,]
last5_2015 = ftable_start2015[order(ftable_start2015$Freq),][1:5,]
last5_2016 = ftable_start2016[order(ftable_start2016$Freq),][1:5,]
last5_2017 = ftable_start2017[order(ftable_start2017$Freq),][1:5,]

#plotting
top5 = data.frame(top5_2014[,2],top5_2015[,2],top5_2016[,3],top5_2017[,3])
names(top5) = c(2014,2015,2016,2017)
plot1 = barplot(data.matrix(top5)/1000, xlab='Year',ylab='Frequency/1000',main="Top 5 Most Used Stops",beside=T,col=c("darkblue","blue","lightblue","cyan","lightcyan"),ylim=c(0,60))

last5 = data.frame(last5_2014[,2],last5_2015[,2],last5_2016[,3],last5_2017[,3])
names(last5) = c(2014,2015,2016,2017)
plot2 = barplot(data.matrix(last5), xlab='Year',ylab='Frequency',main="Top 5 Least Used Stops",beside=T,col=c("darkblue","blue","lightblue","cyan","lightcyan"),ylim=c(0,250))