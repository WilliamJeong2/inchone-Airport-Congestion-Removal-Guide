install.packages("readxl") #엑셀 파일 읽기 위한 패키지 설치
install.packages("ggplot2") #그래프 그리기 위한 패키지 설치
install.packages('googleVis') #aggregate() 함수 사용하기 위한 패키지 설치

rm(list=ls()) #RData 전체 목록 지우기

library(readxl)
library(ggplot2)
library(googleVis)

setwd("C:/Users/user/Documents/카카오톡 받은 파일") #파일 위치
air_delay<-read_excel("air_delay.xls")

v<-colnames(air_delay)
v_14<-c(v[2:13])
v_15<-c(v[14:25])
v_16<-c(v[26:37])
v_17<-c(v[38:49])
v_18<-c(v[50:52])
지연횟수<-air_delay[,c(v_14[1])]
ggplot(air_delay,aes(x=원인,y=지연횟수))+geom_bar(stat="identity")+ggtitle(v_14[1])+geom_point()

search_delay<-function(yyyy,mm)
{
  if(yyyy==2014)
  {
    지연횟수<-air_delay[,c(v_14[mm])]
    ggplot(air_delay,aes(x=원인,y=지연횟수,group=1))+geom_bar(stat="identity")+ggtitle(v_14[mm])+geom_point()
    
  }
  else if(yyyy==2015)
  {
    지연횟수<-air_delay[,c(v_15[mm])]
    ggplot(air_delay,aes(x=원인,y=지연횟수))+geom_bar(stat="identity")+ggtitle(v_15[mm])+geom_point()
    
  }
  else if(yyyy==2016)
  {
    지연횟수<-air_delay[,c(v_16[mm])]
    ggplot(air_delay,aes(x=원인,y=지연횟수))+geom_bar(stat="identity")+ggtitle(v_16[mm])+geom_point()
    
  }
  else if(yyyy==2017)
  {
    지연횟수<-air_delay[,c(v_17[mm])]
    ggplot(air_delay,aes(x=원인,y=지연횟수))+geom_bar(stat="identity")+ggtitle(v_17[mm])+geom_point()
    
  }
  else if(yyyy==2018)
  {
    지연횟수<-air_delay[,c(v_18[mm])]
    ggplot(air_delay,aes(x=원인,y=지연횟수))+geom_bar(stat="identity")+ggtitle(v_18[mm])+geom_point()
    
  }
  else
    cat("다시입력하세요")
}

search_delay(2014,6)
search_delay(2016,5)
search_delay(2018,3)
