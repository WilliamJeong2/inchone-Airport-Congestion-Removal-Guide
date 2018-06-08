###### 2018년 1~12월 인천공항 이용자 수 예측 

install.packages("xlsx") #엑셀 파일 읽어 들이기 위한 패키지 설치
install.packages("nnet") #신경망 모델 중의 하나인 nnet 패키지 설치
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_151.jdk/Contents/Home/jre/lib/server/libjvm.dylib') #맥에는 32bit자바가 없어서 따로 지정
library(xlsx) #rJava오류 시 32비트 java다운받기
library(nnet) #신경망 모델 중 하나인 nnet 패키지 사용하기 위한 환경 설정

par(family="NanumGothic")

setwd("/Users/jeong/Documents/inchone-Airport-Congestion-Removal-Guide/incheonAirport_Congestion/predicted_2018/datafile")

data1<-read.xlsx2(file.choose(),1) #2002년~2017년 1월 데이터

data2<-read.xlsx2(file.choose(),1) #2002년~2017년 2월 데이터

data3<-read.xlsx2(file.choose(),1) #2002년~2017년 3월 데이터

data4<-read.xlsx2(file.choose(),1) #2001년~2017년 4월 데이터

data5<-read.xlsx2(file.choose(),1) #2001년~2017년 5월 데이터

data6<-read.xlsx2(file.choose(),1) #2001년~2017년 6월 데이터

data7<-read.xlsx2(file.choose(),1) #2001년~2017년 7월 데이터

data8<-read.xlsx2(file.choose(),1) #2001년~2017년 8월 데이터

data9<-read.xlsx2(file.choose(),1) #2001년~2017년 9월 데이터

data10<-read.xlsx2(file.choose(),1) #2001년~2017년 10월 데이터

data11<-read.xlsx2(file.choose(),1) #2001년~2017년 11월 데이터

data12<-read.xlsx2(file.choose(),1) #2001년~2017년 12월 데이터

#딥 러닝을 위한 getDataSet 함수 
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

#딥 러닝을 위한 INPUT_NODES, HIDDEN_NODES, OUTPUT_NODES 값 설정

INPUT_NODES<-2 # 데이터가 입력 되는 곳
HIDDEN_NODES<-INPUT_NODES*2 # 실질적인 데이터가 처리되는 곳
OUTPUT_NODES<-1 # 예측값이 출력
ITERATION<-500 #500번 반복

###############세부 적으로 2018년 1월~12월 각 달의 요일 별 이용자 수 예측 #############

# 2018년 7월 월요일~일요일 사용자 수 예측

#해당 숫자 변경하여 이용 현재 data7 = 7월
data7$월요일<-gsub(",","",data7$월요일) #월요일의 3자리 단위로 있는 ,를 삭제
data7$월요일<-as.numeric(data7$월요일) #화요일를 numeric로
df_mon7<-data.frame(일자=data7$요일,월요일=data7$월요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data7$화요일<-gsub(",","",data7$화요일) #월요일의 3자리 단위로 있는 ,를 삭제
data7$화요일<-as.numeric(data7$화요일) #화요일를 numeric로
df_tue2<-data.frame(일자=data7$요일,화요일=data7$화요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data7$수요일<-gsub(",","",data7$수요일) #월요일의 3자리 단위로 있는 ,를 삭제
data7$수요일<-as.numeric(data7$수요일) #화요일를 numeric로
df_wed7<-data.frame(일자=data7$요일,수요일=data7$수요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data7$목요일<-gsub(",","",data7$목요일) #월요일의 3자리 단위로 있는 ,를 삭제
data7$목요일<-as.numeric(data7$목요일) #화요일를 numeric로
df_thu7<-data.frame(일자=data7$요일,목요일=data7$목요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data7$금요일<-gsub(",","",data7$금요일) #월요일의 3자리 단위로 있는 ,를 삭제
data7$금요일<-as.numeric(data7$금요일) #화요일를 numeric로
df_fri7<-data.frame(일자=data7$요일,금요일=data7$금요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data7$토요일<-gsub(",","",data7$토요일) #월요일의 3자리 단위로 있는 ,를 삭제
data7$토요일<-as.numeric(data7$토요일) #화요일를 numeric로
df_sat7<-data.frame(일자=data7$요일,토요일=data7$토요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data7$일요일<-gsub(",","",data7$일요일) #월요일의 3자리 단위로 있는 ,를 삭제
data7$일요일<-as.numeric(data7$일요일) #화요일를 numeric로
df_sun7<-data.frame(일자=data7$요일,일요일=data7$일요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

#인러닝 값 대입
#2018년 7월 월요일~일요일 
in_learning_mon<-getDataSet(df_mon7$월요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_tue<-getDataSet(df_tue7$화요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_wed<-getDataSet(df_wed7$수요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_thu<-getDataSet(df_thu7$목요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_fri<-getDataSet(df_fri7$금요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_sat<-getDataSet(df_sat7$토요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_sun<-getDataSet(df_sun7$일요일,1,15,INPUT_NODES) #7월 값들 입력

#아웃러닝 값 대입
#2018년 7월 월요일~일요일
out_learning_mon<-getDataSet(df_mon7$월요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_tue<-getDataSet(df_tue7$화요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_wed<-getDataSet(df_wed7$수요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_thu<-getDataSet(df_thu7$목요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_fri<-getDataSet(df_fri7$금요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_sat<-getDataSet(df_sat7$토요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_sun<-getDataSet(df_sun7$일요일,3,16,OUTPUT_NODES) #7월 값들 출력

#신경망 모델 중 하나인 nnet 패키지 함수를 이용하여 1월~12월 이용자 수 예측값 모델링 설정
# 2018년 7월 월요일~일요일
model_mon<-nnet(in_learning_mon,out_learning_mon,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_tue<-nnet(in_learning_tue,out_learning_tue,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_wed<-nnet(in_learning_wed,out_learning_wed,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_thu<-nnet(in_learning_thu,out_learning_thu,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_fri<-nnet(in_learning_fri,out_learning_fri,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sat<-nnet(in_learning_sat,out_learning_sat,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sun<-nnet(in_learning_sun,out_learning_sun,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)

#in_forecasting 에 1~12월 예측값 대입
#2018년 7월 월요일~일요일 예측값 대입
in_forecasting_mon<-getDataSet(df_mon7$월요일,15,16,INPUT_NODES)
in_forecasting_tue<-getDataSet(df_tue7$화요일,15,16,INPUT_NODES)
in_forecasting_wed<-getDataSet(df_wed7$수요일,15,16,INPUT_NODES)
in_forecasting_thu<-getDataSet(df_thu7$목요일,15,16,INPUT_NODES)
in_forecasting_fri<-getDataSet(df_fri7$금요일,15,16,INPUT_NODES)
in_forecasting_sat<-getDataSet(df_sat7$토요일,15,16,INPUT_NODES)
in_forecasting_sun<-getDataSet(df_sun7$일요일,15,16,INPUT_NODES)

#1~12월 이용자 수 예측값 출력
#2018년 7월 월요일~일요일 예측값 출력
predicted_values_mon7<-predict(model_mon,in_forecasting_mon,type="raw")
predicted_values_tue7<-predict(model_tue,in_forecasting_tue,type="raw")
predicted_values_wed7<-predict(model_wed,in_forecasting_wed,type="raw")
predicted_values_thu7<-predict(model_thu,in_forecasting_thu,type="raw")
predicted_values_fri7<-predict(model_fri,in_forecasting_fri,type="raw")
predicted_values_sat7<-predict(model_sat,in_forecasting_sat,type="raw")
predicted_values_sun7<-predict(model_sun,in_forecasting_sun,type="raw")
predicted_values_mon7
predicted_values_tue7
predicted_values_wed7
predicted_values_thu7
predicted_values_fri7
predicted_values_sat7
predicted_values_sun7
#여기까지 하고 나온 값들을 요일별로 정리