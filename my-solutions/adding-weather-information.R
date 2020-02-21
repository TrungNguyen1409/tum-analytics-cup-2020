# weatherData = read_csv('weather_description.csv')
# #weatherDataBackup = weatherData
# weatherData = weatherDataBackup
# weatherData2 = select(weatherData,datetime,Chicago)
# 


weatherData = read_csv('weather.csv')

#Lets start simple
weatherData2 = select(weatherData,`Measurement Timestamp`,`Rain Intensity`,`Interval Rain`,`Total Rain`,`Precipitation Type`)
weatherData3 = mutate(weatherData2,trip_day = as.POSIXct(`Measurement Timestamp`, format="%m/%d/%Y %I:%M:%S %p", tz="UTC"))

hist(weatherData3$`Total Rain`)
hist(filter(weatherData3,`Total Rain` < 20)$`Total Rain`)

filter(weatherData3,`Total Rain` == 0)
theFilter = filter(weatherData3,is.na(`Total Rain`))

weatherData3 %>% dfSummary %>% view()

as.POSIXct(tdClean, format="%m/%d/%Y %I:%M:%S %p", tz="UTC")

weatherData4 = filter(weatherData3,!is.na(`Total Rain`))
weatherData5 = filter(weatherData4,year(trip_day) == 2018 | year(trip_day) == 2019)


weatherDataGrouped = group_by(weatherData5,date(trip_day))
rainSummarized = summarise(weatherDataGrouped, average_rain_day=mean(`Total Rain`))

total <- merge(rainSummarized,trainData,by="trip_day")

df_joined <- trainData %>%
  left_join(
    rainSummarized,
    by=c("trip_day" = "date(trip_day)")
  ) 

trainData = df_joined

theFilter = filter(df_joined,day(trip_start_timestamp) == 05,month(trip_start_timestamp) == 12)

fval = generateFilterValuesData(task, method = c("FSelectorRcpp_gain.ratio", "FSelectorRcpp_information.gain"))

fval$data


#rainSummarized = rename(rainSummarized,time_timestamp = trip_day)

#rainSummarized = names(rainSummarized)[names(rainSummarized) == 'time_timestamp'] <- 'trip_day'

# trainData = mutate(trainData,trip_day = date(trip_start_timestamp))
# 
# trip_
# 
# trainDataJoined = left_join(trainData,rainSummarized,by = "trip_day")
# 
# trainDataJoined <- trainData %>% left_join(rainSummarized, by = c("trip_day" = "trip_day"))
# 
# trainDataJoined = merge(x = trainData, y = rainSummarized, by = "trip_day", all.x = TRUE)
# 
# mutate(trainData,trip_day = ymd(trip_day))
# 
# select
