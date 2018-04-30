install.packages("readxl")
install.packages("ggplot2")

library(readxl)
w201801 <- read_excel("/Users/jeong/Documents/inchone-Airport-Congestion-Removal-Guide/incheonAirport_Congestion/R_Data/airport 2018/w201801.xls")
w201802 <- read_excel("/Users/jeong/Documents/inchone-Airport-Congestion-Removal-Guide/incheonAirport_Congestion/R_Data/airport 2018/w201802.xls")
w201803 <- read_excel("/Users/jeong/Documents/inchone-Airport-Congestion-Removal-Guide/incheonAirport_Congestion/R_Data/airport 2018/w201803.xls")

ggplot(w201801, aes(x=요일, y=합계,group=1))+ggtitle("2018년 1월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201802, aes(x=요일, y=합계,group=1))+ggtitle("2017년 2월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201803, aes(x=요일, y=합계,group=1))+ggtitle("2017년 3월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
