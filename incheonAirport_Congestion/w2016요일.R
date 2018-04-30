library(readxl)

w201601<- read_excel("C:/Program Files/RStudio/wpeople/w201601.xls")
w201602<- read_excel("C:/Program Files/RStudio/wpeople/w201602.xls")
w201603<- read_excel("C:/Program Files/RStudio/wpeople/w201603.xls")
w201604<- read_excel("C:/Program Files/RStudio/wpeople/w201604.xls")
w201605<- read_excel("C:/Program Files/RStudio/wpeople/w201605.xls")
w201606<- read_excel("C:/Program Files/RStudio/wpeople/w201606.xls")
w201607<- read_excel("C:/Program Files/RStudio/wpeople/w201607.xls")
w201608<- read_excel("C:/Program Files/RStudio/wpeople/w201608.xls")
w201609<- read_excel("C:/Program Files/RStudio/wpeople/w201609.xls")
w201610<- read_excel("C:/Program Files/RStudio/wpeople/w201610.xls")
w201611<- read_excel("C:/Program Files/RStudio/wpeople/w201611.xls")
w201612<- read_excel("C:/Program Files/RStudio/wpeople/w201612.xls")

library(ggplot2)

w201601
w201602
w201603
w201604
w201605
w201606
w201607
w201608
w201609
w201610
w201611
w201612


ggplot(w201601, aes(x=요일, y=합계,group=1))+ggtitle("2016년 1월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red") +geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201602, aes(x=요일, y=합계,group=1))+ggtitle("2016년 2월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201603, aes(x=요일, y=합계,group=1))+ggtitle("2016년 3월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201604, aes(x=요일, y=합계,group=1))+ggtitle("2016년 4월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201605, aes(x=요일, y=합계,group=1))+ggtitle("2016년 5월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201606, aes(x=요일, y=합계,group=1))+ggtitle("2016년 6월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201607, aes(x=요일, y=합계,group=1))+ggtitle("2016년 7월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201608, aes(x=요일, y=합계,group=1))+ggtitle("2016년 8월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201609, aes(x=요일, y=합계,group=1))+ggtitle("2016년 9월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201610, aes(x=요일, y=합계,group=1))+ggtitle("2016년 10월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201611, aes(x=요일, y=합계,group=1))+ggtitle("2016년 11월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201612, aes(x=요일, y=합계,group=1))+ggtitle("2016년 12월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
