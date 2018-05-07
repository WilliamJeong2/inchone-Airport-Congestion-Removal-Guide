install.packages("readxl") #엑셀 파일 읽기 위한 패키지 설치
install.packages("ggplot2") #그래프 그리기 위한 패키지 설치
install.packages('googleVis') #aggregate() 함수 사용하기 위한 패키지 설치

rm(list=ls()) #RData 전체 목록 지우기

library(readxl)
library(ggplot2)
library(googleVis)

setwd("C:/Users/chosun/Documents/inchone-Airport-Congestion-Removal-Guide/incheonAirport_Congestion/R_Data/") #파일 위치
air_delay<-read_excel("air_delay.xls")

colname<-'air_delay201'
v<-colnames(air_delay)

v_2014<-c(v[2:13])
v_2015<-c(v[14:25])
v_2016<-c(v[26:37])
v_2017<-c(v[38:49])
v_2018<-c(v[50:52])

search_delay<-function(yyyy,mm)
{
  if(yyyy==2014){
    지연횟수<-air_delay[,c(v_14[mm])]
    ggplot(air_delay,aes(x=원인,y=지연횟수))+geom_bar(stat="identity")+ggtitle(paste(v_14[mm],"원인별 지연수"))
  }
  else if(yyyy==2015){
    지연횟수<-air_delay[,c(v_15[mm])]
    ggplot(air_delay,aes(x=원인,y=지연횟수))+geom_bar(stat="identity")+ggtitle(paste(v_15[mm],"원인별 지연수"))
  }
  else if(yyyy==2016){
    지연횟수<-air_delay[,c(v_16[mm])]
    ggplot(air_delay,aes(x=원인,y=지연횟수))+geom_bar(stat="identity")+ggtitle(paste(v_16[mm],"원인별 지연수"))
  }
  else if(yyyy==2017){
    지연횟수<-air_delay[,c(v_17[mm])]
    ggplot(air_delay,aes(x=원인,y=지연횟수))+geom_bar(stat="identity")+ggtitle(paste(v_17[mm],"원인별 지연수"))
  }
  else if(yyyy==2018){
    지연횟수<-air_delay[,c(v_18[mm])]
    ggplot(air_delay,aes(x=원인,y=지연횟수))+geom_bar(stat="identity",fill = "darkblue")+ggtitle(paste(v_18[mm],"원인별 지연수"))
  }
  else
    cat("다시 입력하세요. 범위(2014,01~2018,03)")
}
search_delay(2018,2)
setwd("C:/Users/chosun/Documents/inchone-Airport-Congestion-Removal-Guide/incheonAirport_Congestion/R_Data/airport/")

for(i in 1:3)  #2018년 월별 요일별 인원 파일 불러오기 위한 for 문
{
  oname = paste("w20180",i,sep ="")
  assign(oname, read_excel(paste(oname,".xls",sep="")))
}

for(i in 1:12)  #2017년 월별 요일별 인원 파일 불러오기 위한 for 문
{
  oname = paste("w20170",i,sep ="")
  assign(oname, read_excel(paste(oname,".xls",sep="")))
}

for(i in 1:12)  #2016년 월별 요일별 인원 파일 불러오기 위한 for 문
{
  oname = paste("w20160",i,sep ="")
  assign(oname, read_excel(paste(oname,".xls",sep="")))
}

for(i in 1:12)  #2015년 월별 요일별 인원 파일 불러오기 위한 for 문
{
  oname = paste("w20150",i,sep ="")
  assign(oname, read_excel(paste(oname,".xls",sep="")))
}

for(i in 1:12)  #2014년 월별 요일별 인원 파일 불러오기 위한 for 문
{
  oname = paste("w20140",i,sep ="")
  assign(oname, read_excel(paste(oname,".xls",sep="")))
}

readline("언제 보여줄까? : ")

a#2018 월별 그래프 
w_2018sub <- function(x){ 
  
  if(x==01){
    ggplot(w201801, aes(x=요일, y=합계,group=1)) +ggtitle("2018년 1월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==02){
    ggplot(w201802, aes(x=요일, y=합계,group=1)) +ggtitle("2018년 2월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==03){
    ggplot(w201803, aes(x=요일, y=합계,group=1)) +ggtitle("2018년 3월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else{
    cat("다시 입력 하세요.")
  }
}

#2018 사용자 수 오름 차순 정렬
w_2018sub2 <- function(x){
  
  if(x==01){
    aggregate(요일~합계, w201801, max)
  }
  
  else if(x==02){
    aggregate(요일~합계, w201802, max)
  }
  
  else if(x==03){
    aggregate(요일~합계, w201803, max)
  }
  
  else{
    cat("다시 입력 하세요.")
  }
}

#2017 월별 그래프 
w_2017sub <- function(x){ 
  
  if(x==01){
    ggplot(w201701, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 1월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==02){
    ggplot(w201702, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 2월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==03){
    ggplot(w201703, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 3월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==04){
    ggplot(w201704, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 4월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==05){
    ggplot(w201705, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 5월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==06){
    ggplot(w201706, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 6월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==07){
    ggplot(w201707, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 7월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==08){
    ggplot(w201708, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 8월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==09){
    ggplot(w201709, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 9월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==10){
    ggplot(w2017010, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 10월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==11){
    ggplot(w2017011, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 11월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==12){
    ggplot(w2017012, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 12월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  else{
    cat("다시 입력 하세요.")
  }
}

#2017 사용자 수 오름 차순 정렬
w_2017sub2 <- function(x){
  
  if(x==01){
    aggregate(요일~합계, w201701, max)
  }
  
  else if(x==02){
    aggregate(요일~합계, w201702, max)
  }
  
  else if(x==03){
    aggregate(요일~합계, w201703, max)
  }
  
  else if(x==04){
    aggregate(요일~합계, w201704, max)
  }
  
  else if(x==05){
    aggregate(요일~합계, w201705, max)
  }
  
  else if(x==06){
    aggregate(요일~합계, w201706, max)
  }
  
  else if(x==07){
    aggregate(요일~합계, w201707, max)
  }
  
  else if(x==08){
    aggregate(요일~합계, w201708, max)
  }
  
  else if(x==09){
    aggregate(요일~합계, w201709, max)
  }
  
  else if(x==10){
    aggregate(요일~합계, w2017010, max)
  }
  
  else if(x==11){
    aggregate(요일~합계, w2017011, max)
  }
  
  else if(x==12){
    aggregate(요일~합계, w2017012, max)
  }
  else{
    cat("다시 입력 하세요.")
  }
}

#2016 월별 그래프 
w_2016sub <- function(x){ 
  
  if(x==01){
    ggplot(w201601, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 1월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==02){
    ggplot(w201602, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 2월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==03){
    ggplot(w201603, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 3월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==04){
    ggplot(w201604, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 4월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==05){
    ggplot(w201605, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 5월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==06){
    ggplot(w201606, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 6월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==07){
    ggplot(w201607, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 7월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==08){
    ggplot(w201608, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 8월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==09){
    ggplot(w201609, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 9월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==10){
    ggplot(w2016010, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 10월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==11){
    ggplot(w2016011, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 11월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==12){
    ggplot(w2016012, aes(x=요일, y=합계,group=1)) +ggtitle("2016년 12월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  else{
    cat("다시 입력 하세요.")
  }
}

#2016 사용자 수 오름 차순 정렬
w_2016sub2 <- function(x){
  
  if(x==01){
    aggregate(요일~합계, w201601, max)
  }
  
  else if(x==02){
    aggregate(요일~합계, w201602, max)
  }
  
  else if(x==03){
    aggregate(요일~합계, w201603, max)
  }
  
  else if(x==04){
    aggregate(요일~합계, w201604, max)
  }
  
  else if(x==05){
    aggregate(요일~합계, w201605, max)
  }
  
  else if(x==06){
    aggregate(요일~합계, w201606, max)
  }
  
  else if(x==07){
    aggregate(요일~합계, w201607, max)
  }
  
  else if(x==08){
    aggregate(요일~합계, w201608, max)
  }
  
  else if(x==09){
    aggregate(요일~합계, w201609, max)
  }
  
  else if(x==10){
    aggregate(요일~합계, w2016010, max)
  }
  
  else if(x==11){
    aggregate(요일~합계, w2016011, max)
  }
  
  else if(x==12){
    aggregate(요일~합계, w2016012, max)
  }
  else{
    cat("다시 입력 하세요.")
  }
}

#2015 월별 그래프 
w_2015sub <- function(x){ 
  
  if(x==01){
    ggplot(w201501, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 1월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==02){
    ggplot(w201502, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 2월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==03){
    ggplot(w201503, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 3월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==04){
    ggplot(w201504, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 4월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==05){
    ggplot(w201505, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 5월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==06){
    ggplot(w201506, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 6월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==07){
    ggplot(w201507, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 7월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==08){
    ggplot(w201508, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 8월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==09){
    ggplot(w201509, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 9월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==10){
    ggplot(w2015010, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 10월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==11){
    ggplot(w2015011, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 11월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==12){
    ggplot(w2015012, aes(x=요일, y=합계,group=1)) +ggtitle("2015년 12월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  else{
    cat("다시 입력 하세요.")
  }
}

#2015 사용자 수 오름 차순 정렬
w_2015sub2 <- function(x){
  
  if(x==01){
    aggregate(요일~합계, w201501, max)
  }
  
  else if(x==02){
    aggregate(요일~합계, w201502, max)
  }
  
  else if(x==03){
    aggregate(요일~합계, w201503, max)
  }
  
  else if(x==04){
    aggregate(요일~합계, w201504, max)
  }
  
  else if(x==05){
    aggregate(요일~합계, w201505, max)
  }
  
  else if(x==06){
    aggregate(요일~합계, w201506, max)
  }
  
  else if(x==07){
    aggregate(요일~합계, w201507, max)
  }
  
  else if(x==08){
    aggregate(요일~합계, w201508, max)
  }
  
  else if(x==09){
    aggregate(요일~합계, w201509, max)
  }
  
  else if(x==10){
    aggregate(요일~합계, w2015010, max)
  }
  
  else if(x==11){
    aggregate(요일~합계, w2015011, max)
  }
  
  else if(x==12){
    aggregate(요일~합계, w2015012, max)
  }
  else{
    cat("다시 입력 하세요.")
  }
}

#2014 월별 그래프 
w_2014sub <- function(x){ 
  
  if(x==01){
    ggplot(w201401, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 1월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==02){
    ggplot(w201402, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 2월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==03){
    ggplot(w201403, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 3월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==04){
    ggplot(w201404, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 4월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==05){
    ggplot(w201405, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 5월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==06){
    ggplot(w201406, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 6월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==07){
    ggplot(w201407, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 7월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==08){
    ggplot(w201408, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 8월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==09){
    ggplot(w201409, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 9월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==10){
    ggplot(w2014010, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 10월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==11){
    ggplot(w2014011, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 11월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  
  else if(x==12){
    ggplot(w2014012, aes(x=요일, y=합계,group=1)) +ggtitle("2014년 12월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
  }
  else{
    cat("다시 입력 하세요.")
  }
}

#2014 사용자 수 오름 차순 정렬
w_2014sub2 <- function(x){
  
  if(x==01){
    aggregate(요일~합계, w201401, max)
  }
  
  else if(x==02){
    aggregate(요일~합계, w201402, max)
  }
  
  else if(x==03){
    aggregate(요일~합계, w201403, max)
  }
  
  else if(x==04){
    aggregate(요일~합계, w201404, max)
  }
  
  else if(x==05){
    aggregate(요일~합계, w201405, max)
  }
  
  else if(x==06){
    aggregate(요일~합계, w201406, max)
  }
  
  else if(x==07){
    aggregate(요일~합계, w201407, max)
  }
  
  else if(x==08){
    aggregate(요일~합계, w201408, max)
  }
  
  else if(x==09){
    aggregate(요일~합계, w201409, max)
  }
  
  else if(x==10){
    aggregate(요일~합계, w2014010, max)
  }
  
  else if(x==11){
    aggregate(요일~합계, w2014011, max)
  }
  
  else if(x==12){
    aggregate(요일~합계, w2014012, max)
  }
  else{
    cat("다시 입력 하세요.")
  }
}

w_week <- function(index,x){
  
  if(index == 2018){
    
    w_2018sub(x) 
    
  }
  else if(index == 2017){
    
    w_2017sub(x)
    
  }
  else if(index == 2016){
    
    w_2016sub(x)
    
  }
  else if(index == 2015){
    
    w_2015sub(x)
    
  }
  else if(index == 2014){
    
    w_2014sub(x)
    
  }
  else if(index == '2018년인원'){
    
    w_2018sub2(x)
    
  }
  else if(index == '2017년인원'){
    
    w_2017sub2(x)
    
  }
  else if(index == '2016년인원'){
    
    w_2016sub2(x)
    
  }
  else if(index == '2015년인원'){
    
    w_2015sub2(x)
    
  }
  else if(index == '2014년인원'){
    
    w_2014sub2(x)
    
  }
  
  else {
    
    cat("다시 입력하세요.")
    
  }
}

