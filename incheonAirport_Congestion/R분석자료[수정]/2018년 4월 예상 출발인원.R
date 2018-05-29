install.packages("xlsx")
install.packages("nnet")
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_151.jdk/Contents/Home/jre/lib/server/libjvm.dylib') #맥에는 32bit자바가 없어서 따로 지정
library(xlsx) #rJava오류 시 32비트 java다운받기
library(nnet)

par(family="NanumGothic")

data<-read.xlsx2(file.choose(),1) #데이터가 될 엑셀 선택
data

data$degree<-gsub(",","",data$degree) #인원수의 3자리 단위로 있는 ,를 삭제
data$degree<-as.numeric(data$degree) #인원수를 numeric로
df<-data.frame(일자=data$date,인원수=data$degree) 
df
plot(df,xlab="일자",ylab="인원수") #일자(date)와 인원수(degree)를 plot함수로 시각화 / 필드멍에 맞춰 변수명 수정

getDataSet<-function(item,from,to,size){ #배열을 한 칸씩 이동하며 정해진 구간을 탐색하는 알고리즘
  dataframe<-NULL
  to<-to-size+1
  for(i in from:to) {
    start<-i
    end<-start+size-1
    temp<-item[c(start:end)]
    dataframe<-rbind(dataframe,t(temp))
  }
  return(dataframe)
}

INPUT_NODES<-2
HIDDEN_NODES<-INPUT_NODES*2
OUTPUT_NODES<-1
ITERATION<-500

in_learning<-getDataSet(df$인원수,1,16,INPUT_NODES)
in_learning

out_learning<-getDataSet(df$인원수,3,17,OUTPUT_NODES)
out_learning

model<-nnet(in_learning,out_learning,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)

in_forecasting<-getDataSet(df$인원수,16,17,INPUT_NODES)
in_forecasting

predicted_values<-predict(model,in_forecasting,type="raw")
predicted_values

real<-df$인원수[1:18]
real

plot(real,xlab="4월",ylab="인원수",ylim=c(500000,3000000),type="o",axes=FALSE)
axis(1,at=1:18, lab=c("2001","2002","2003","2004","2005","2006","2007","2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018"))
axis(2,ylim=c(500000,3000000))
lines(18:18,predicted_values,type="o",col="red")
grid()
