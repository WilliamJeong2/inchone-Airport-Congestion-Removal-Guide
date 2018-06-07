
###### 2001년4월~2017년12월 인천공항 이용자 수 데이터를 받아 
######신경망 모델 중의 하나인 nnet 패키지 함수를 사용하여 
###### 2018년 1~12월 인천공항 이용자 수 예측 

install.packages("xlsx") #엑셀 파일 읽들이기 위한 패키지 설치
install.packages("nnet") #신경망 모델 중의 하나인 nnet 패키지 설치
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_151.jdk/Contents/Home/jre/lib/server/libjvm.dylib') #맥에는 32bit자바가 없어서 따로 지정
library(xlsx) #rJava오류 시 32비트 java다운받기
library(nnet) #신경망 모델 중 하나인 nnet 패키지 사용하기 위한 환경 설정

par(family="NanumGothic")

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

data1$합계<-gsub(",","",data1$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data1$합계<-as.numeric(data1$합계) #인원수를 numeric로
df1<-data.frame(일자=data1$요일,인원수=data1$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

data2$합계<-gsub(",","",data2$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data2$합계<-as.numeric(data2$합계) #인원수를 numeric로
df2<-data.frame(일자=data2$요일,인원수=data2$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

data3$합계<-gsub(",","",data3$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data3$합계<-as.numeric(data3$합계) #인원수를 numeric로
df3<-data.frame(일자=data3$요일,인원수=data3$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

data4$합계<-gsub(",","",data4$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data4$합계<-as.numeric(data4$합계) #인원수를 numeric로
df4<-data.frame(일자=data4$요일,인원수=data4$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

data5$합계<-gsub(",","",data5$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data5$합계<-as.numeric(data5$합계) #인원수를 numeric로
df5<-data.frame(일자=data5$요일,인원수=data5$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

data6$합계<-gsub(",","",data6$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data6$합계<-as.numeric(data6$합계) #인원수를 numeric로
df6<-data.frame(일자=data6$요일,인원수=data6$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

data7$합계<-gsub(",","",data7$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data7$합계<-as.numeric(data7$합계) #인원수를 numeric로
df6<-data.frame(일자=data7$요일,인원수=data7$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

data8$합계<-gsub(",","",data8$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data8$합계<-as.numeric(data8$합계) #인원수를 numeric로
df8<-data.frame(일자=data8$요일,인원수=data8$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

data9$합계<-gsub(",","",data9$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data9$합계<-as.numeric(data9$합계) #인원수를 numeric로
df9<-data.frame(일자=data9$요일,인원수=data9$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

data10$합계<-gsub(",","",data10$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data10$합계<-as.numeric(data10$합계) #인원수를 numeric로
df10<-data.frame(일자=data10$요일,인원수=data10$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

data11$합계<-gsub(",","",data11$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data11$합계<-as.numeric(data11$합계) #인원수를 numeric로
df11<-data.frame(일자=data11$요일,인원수=data11$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

data12$합계<-gsub(",","",data12$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data12$합계<-as.numeric(data12$합계) #인원수를 numeric로
df12<-data.frame(일자=data12$요일,인원수=data12$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경


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

#### 2018년 1~12월 인천공항 이용자수 예측 값####

#인러닝 값 대입
in_learning1<-getDataSet(df1$인원수,1,15,INPUT_NODES) #1월 값들 입력 
in_learning2<-getDataSet(df2$인원수,1,15,INPUT_NODES) #2월 값들 입력
in_learning3<-getDataSet(df3$인원수,1,15,INPUT_NODES) #3월 값들 입력
in_learning4<-getDataSet(df4$인원수,1,16,INPUT_NODES) #4월 값들 입력
in_learning5<-getDataSet(df5$인원수,1,16,INPUT_NODES) #5월 값들 입력
in_learning6<-getDataSet(df6$인원수,1,16,INPUT_NODES) #6월 값들 입력
in_learning7<-getDataSet(df7$인원수,1,16,INPUT_NODES) #7월 값들 입력
in_learning8<-getDataSet(df8$인원수,1,16,INPUT_NODES) #8월 값들 입력
in_learning9<-getDataSet(df9$인원수,1,16,INPUT_NODES) #9월 값들 입력
in_learning10<-getDataSet(df10$인원수,1,16,INPUT_NODES) #10월 값들 입력
in_learning11<-getDataSet(df11$인원수,1,16,INPUT_NODES) #11월 값들 입력
in_learning12<-getDataSet(df12$인원수,1,16,INPUT_NODES) #12월 값들 입력

#아웃러닝 값 대입
out_learning1<-getDataSet(df1$인원수,3,16,OUTPUT_NODES) #1월 값들 출력
out_learning2<-getDataSet(df2$인원수,3,16,OUTPUT_NODES) #2월 값들 출력
out_learning3<-getDataSet(df3$인원수,3,16,OUTPUT_NODES) #3월 값들 출력
out_learning4<-getDataSet(df4$인원수,3,17,OUTPUT_NODES) #4월 값들 출력
out_learning5<-getDataSet(df5$인원수,3,17,OUTPUT_NODES) #5월 값들 출력
out_learning6<-getDataSet(df6$인원수,3,17,OUTPUT_NODES) #6월 값들 출력
out_learning7<-getDataSet(df7$인원수,3,17,OUTPUT_NODES) #7월 값들 출력
out_learning8<-getDataSet(df8$인원수,3,17,OUTPUT_NODES) #8월 값들 출력
out_learning9<-getDataSet(df9$인원수,3,17,OUTPUT_NODES) #9월 값들 출력
out_learning10<-getDataSet(df10$인원수,3,17,OUTPUT_NODES) #10월 값들 출력
out_learning11<-getDataSet(df11$인원수,3,17,OUTPUT_NODES) #11월 값들 출력
out_learning12<-getDataSet(df12$인원수,3,17,OUTPUT_NODES) #12월 값들 출력

#신경망 모델 중 하나인 nnet 패키지 함수를 이용하여 1월~12월 이용자 수 예측값 모델링 설정
model1<-nnet(in_learning1,out_learning1,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model2<-nnet(in_learning2,out_learning2,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model3<-nnet(in_learning3,out_learning3,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model4<-nnet(in_learning4,out_learning4,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model5<-nnet(in_learning5,out_learning5,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model6<-nnet(in_learning6,out_learning6,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model7<-nnet(in_learning7,out_learning7,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model8<-nnet(in_learning8,out_learning8,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model9<-nnet(in_learning9,out_learning9,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model10<-nnet(in_learning10,out_learning10,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model11<-nnet(in_learning11,out_learning11,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model12<-nnet(in_learning12,out_learning12,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)

#in_forecasting 에 1~12월 예측값 대입
in_forecasting1<-getDataSet(df1$인원수,15,16,INPUT_NODES)
in_forecasting2<-getDataSet(df2$인원수,15,16,INPUT_NODES)
in_forecasting3<-getDataSet(df3$인원수,15,16,INPUT_NODES)
in_forecasting4<-getDataSet(df4$인원수,16,17,INPUT_NODES)
in_forecasting5<-getDataSet(df5$인원수,16,17,INPUT_NODES)
in_forecasting6<-getDataSet(df6$인원수,16,17,INPUT_NODES)
in_forecasting7<-getDataSet(df7$인원수,16,17,INPUT_NODES)
in_forecasting8<-getDataSet(df8$인원수,16,17,INPUT_NODES)
in_forecasting9<-getDataSet(df9$인원수,16,17,INPUT_NODES)
in_forecasting10<-getDataSet(df10$인원수,16,17,INPUT_NODES)
in_forecasting11<-getDataSet(df11$인원수,16,17,INPUT_NODES)
in_forecasting12<-getDataSet(df12$인원수,16,17,INPUT_NODES)

#1~12월 이용자 수 예측값 출력
predicted_values1<-predict(model1,in_forecasting1,type="raw")
predicted_values2<-predict(model2,in_forecasting2,type="raw")
predicted_values3<-predict(model3,in_forecasting3,type="raw")
predicted_values4<-predict(model4,in_forecasting4,type="raw")
predicted_values5<-predict(model5,in_forecasting5,type="raw")
predicted_values6<-predict(model6,in_forecasting6,type="raw")
predicted_values7<-predict(model7,in_forecasting7,type="raw")
predicted_values8<-predict(model8,in_forecasting8,type="raw")
predicted_values9<-predict(model9,in_forecasting9,type="raw")
predicted_values10<-predict(model10,in_forecasting10,type="raw")
predicted_values11<-predict(model11,in_forecasting11,type="raw")
predicted_values12<-predict(model12,in_forecasting12,type="raw")
predicted_values1
predicted_values2
predicted_values3
predicted_values4
predicted_values5
predicted_values6
predicted_values7
predicted_values8
predicted_values9
predicted_values10
predicted_values11
predicted_values12

#2018년 1~12월 예측 값들을 predicted_2018에 대입하여 테이블 생성
predicted_2018<-c(predicted_values1, predicted_values2, predicted_values3, predicted_values4, predicted_values5, predicted_values6, predicted_values7, predicted_values8, predicted_values9, predicted_values10, predicted_values11, predicted_values12)

#1월~12월 범위 설정 값 테이블 생성
month_2018<-1:12

#Year2018에 2018년 1~12월 까지의 이용자 수 범위와 예측값 가지는 테이블 생성
Year2018<-data.frame(predicted_2018,month_2018)

#Year2018 테이블 출력
View(Year2018)

#예측값을 기준으로 예측값이 낮은 순 부터 높은 순으로 1~12월 출력(오름차순)
aggregate(month_2018~predicted_2018, Year2018, max)

#2018년 1월~12월 예측값 점,선 그래프 출력
plot(predicted_2018, xlab = "2018년", ylab = "인원수", ylim=c(500000,4000000),type = "o", col = "blue", axes=FALSE)

#x축에 1월~12월 범위 출력
axis(1,at=1:12, lab=c("1","2","3","4","5","6","7","8","9","10","11","12"))

#y축에 최대값 최솟값 설정
axis(2,ylim=c(500000,4000000))

#1월~12월 큰 빨간 점으로 잘 보이게 표시
lines(1:1,predicted_values1,type="o",lwd = "10", col="red")
lines(2:2,predicted_values2,type="o",lwd = "10", col="red")
lines(3:3,predicted_values3,type="o",lwd = "10", col="red")
lines(4:4,predicted_values4,type="o",lwd = "10", col="red")
lines(5:5,predicted_values5,type="o",lwd = "10", col="red")
lines(6:6,predicted_values6,type="o",lwd = "10", col="red")
lines(7:7,predicted_values7,type="o",lwd = "10", col="red")
lines(8:8,predicted_values8,type="o",lwd = "10", col="red")
lines(9:9,predicted_values9,type="o",lwd = "10", col="red")
lines(10:10,predicted_values10,type="o",lwd = "10", col="red")
lines(11:11,predicted_values11,type="o",lwd = "10", col="red")
lines(12:12,predicted_values12,type="o",lwd = "10", col="red")
grid() #표의 범위 잘 보이도록 설정

###############세부 적으로 2018년 1월~12월 각 달의 요일 별 이용자 수 예측 #############
측
# 2018년 1월 월요일~일요일 사용자 수 예측
data1$월요일<-gsub(",","",data1$월요일) #월요일의 3자리 단위로 있는 ,를 삭제
data1$월요일<-as.numeric(data1$월요일) #화요일를 numeric로
df_mon1<-data.frame(일자=data1$요일,월요일=data1$월요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data1$화요일<-gsub(",","",data1$화요일) #월요일의 3자리 단위로 있는 ,를 삭제
data1$화요일<-as.numeric(data1$화요일) #화요일를 numeric로
df_tue1<-data.frame(일자=data1$요일,화요일=data1$화요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data1$수요일<-gsub(",","",data1$수요일) #월요일의 3자리 단위로 있는 ,를 삭제
data1$수요일<-as.numeric(data1$수요일) #화요일를 numeric로
df_wed1<-data.frame(일자=data1$요일,수요일=data1$수요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data1$목요일<-gsub(",","",data1$목요일) #월요일의 3자리 단위로 있는 ,를 삭제
data1$목요일<-as.numeric(data1$목요일) #화요일를 numeric로
df_thu1<-data.frame(일자=data1$요일,목요일=data1$목요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data1$금요일<-gsub(",","",data1$금요일) #월요일의 3자리 단위로 있는 ,를 삭제
data1$금요일<-as.numeric(data1$금요일) #화요일를 numeric로
df_fri1<-data.frame(일자=data1$요일,금요일=data1$금요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data1$토요일<-gsub(",","",data1$토요일) #월요일의 3자리 단위로 있는 ,를 삭제
data1$토요일<-as.numeric(data1$토요일) #화요일를 numeric로
df_sat1<-data.frame(일자=data1$요일,토요일=data1$토요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data1$일요일<-gsub(",","",data1$일요일) #월요일의 3자리 단위로 있는 ,를 삭제
data1$일요일<-as.numeric(data1$일요일) #화요일를 numeric로
df_sun1<-data.frame(일자=data1$요일,일요일=data1$일요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

# 2018년 2월 월요일~일요일 사용자 수 예측
data2$합계<-gsub(",","",data2$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data2$합계<-as.numeric(data2$합계) #인원수를 numeric로
df2<-data.frame(일자=data2$요일,인원수=data2$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경


# 2018년 3월 월요일~일요일 사용자 수 예측
data3$합계<-gsub(",","",data3$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data3$합계<-as.numeric(data3$합계) #인원수를 numeric로
df3<-data.frame(일자=data3$요일,인원수=data3$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

# 2018년 4월 월요일~일요일 사용자 수 예측
data4$합계<-gsub(",","",data4$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data4$합계<-as.numeric(data4$합계) #인원수를 numeric로
df4<-data.frame(일자=data4$요일,인원수=data4$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

# 2018년 5월 월요일~일요일 사용자 수 예측
data5$합계<-gsub(",","",data5$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data5$합계<-as.numeric(data5$합계) #인원수를 numeric로
df5<-data.frame(일자=data5$요일,인원수=data5$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경


# 2018년 6월 월요일~일요일 사용자 수 예측
data6$합계<-gsub(",","",data6$합계) #인원수의 3자리 단위로 있는 ,를 삭제
data6$합계<-as.numeric(data6$합계) #인원수를 numeric로
df6<-data.frame(일자=data6$요일,인원수=data6$합계) # 요일->일자로, 합계->인원수로 컬럼 이름 변경

# 2018년 7월 월요일~일요일 사용자 수 예측
data7$월요일<-gsub(",","",data7$월요일) #월요일의 3자리 단위로 있는 ,를 삭제
data7$월요일<-as.numeric(data7$월요일) #화요일를 numeric로
df_mon7<-data.frame(일자=data7$요일,월요일=data7$월요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data7$화요일<-gsub(",","",data7$화요일) #월요일의 3자리 단위로 있는 ,를 삭제
data7$화요일<-as.numeric(data7$화요일) #화요일를 numeric로
df_tue7<-data.frame(일자=data7$요일,화요일=data7$화요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

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

# 2018년 8월 월요일~일요일 사용자 수 예측
data8$월요일<-gsub(",","",data8$월요일) #월요일의 3자리 단위로 있는 ,를 삭제
data8$월요일<-as.numeric(data8$월요일) #화요일를 numeric로
df_mon8<-data.frame(일자=data8$요일,월요일=data8$월요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data8$화요일<-gsub(",","",data8$화요일) #월요일의 3자리 단위로 있는 ,를 삭제
data8$화요일<-as.numeric(data8$화요일) #화요일를 numeric로
df_tue8<-data.frame(일자=data8$요일,화요일=data8$화요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data8$수요일<-gsub(",","",data8$수요일) #월요일의 3자리 단위로 있는 ,를 삭제
data8$수요일<-as.numeric(data8$수요일) #화요일를 numeric로
df_wed8<-data.frame(일자=data8$요일,수요일=data8$수요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data8$목요일<-gsub(",","",data8$목요일) #월요일의 3자리 단위로 있는 ,를 삭제
data8$목요일<-as.numeric(data8$목요일) #화요일를 numeric로
df_thu8<-data.frame(일자=data8$요일,목요일=data8$목요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data8$금요일<-gsub(",","",data8$금요일) #월요일의 3자리 단위로 있는 ,를 삭제
data8$금요일<-as.numeric(data8$금요일) #화요일를 numeric로
df_fri8<-data.frame(일자=data8$요일,금요일=data8$금요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data8$토요일<-gsub(",","",data8$토요일) #월요일의 3자리 단위로 있는 ,를 삭제
data8$토요일<-as.numeric(data8$토요일) #화요일를 numeric로
df_sat8<-data.frame(일자=data8$요일,토요일=data8$토요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data8$일요일<-gsub(",","",data8$일요일) #월요일의 3자리 단위로 있는 ,를 삭제
data8$일요일<-as.numeric(data8$일요일) #화요일를 numeric로
df_sun8<-data.frame(일자=data8$요일,일요일=data8$일요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

# 2018년 9월 월요일~일요일 사용자 수 예측
data9$월요일<-gsub(",","",data9$월요일) #월요일의 3자리 단위로 있는 ,를 삭제
data9$월요일<-as.numeric(data9$월요일) #화요일를 numeric로
df_mon9<-data.frame(일자=data9$요일,월요일=data9$월요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data9$화요일<-gsub(",","",data9$화요일) #월요일의 3자리 단위로 있는 ,를 삭제
data9$화요일<-as.numeric(data9$화요일) #화요일를 numeric로
df_tue9<-data.frame(일자=data9$요일,화요일=data9$화요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data9$수요일<-gsub(",","",data9$수요일) #월요일의 3자리 단위로 있는 ,를 삭제
data9$수요일<-as.numeric(data9$수요일) #화요일를 numeric로
df_wed9<-data.frame(일자=data9$요일,수요일=data9$수요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data9$목요일<-gsub(",","",data9$목요일) #월요일의 3자리 단위로 있는 ,를 삭제
data9$목요일<-as.numeric(data9$목요일) #화요일를 numeric로
df_thu9<-data.frame(일자=data9$요일,목요일=data9$목요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data9$금요일<-gsub(",","",data9$금요일) #월요일의 3자리 단위로 있는 ,를 삭제
data9$금요일<-as.numeric(data9$금요일) #화요일를 numeric로
df_fri9<-data.frame(일자=data9$요일,금요일=data9$금요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data9$토요일<-gsub(",","",data9$토요일) #월요일의 3자리 단위로 있는 ,를 삭제
data9$토요일<-as.numeric(data9$토요일) #화요일를 numeric로
df_sat9<-data.frame(일자=data9$요일,토요일=data9$토요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data9$일요일<-gsub(",","",data9$일요일) #월요일의 3자리 단위로 있는 ,를 삭제
data9$일요일<-as.numeric(data9$일요일) #화요일를 numeric로
df_sun9<-data.frame(일자=data9$요일,일요일=data9$일요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

# 2018년 10월 월요일~일요일 사용자 수 예측
data10$월요일<-gsub(",","",data10$월요일) #월요일의 3자리 단위로 있는 ,를 삭제
data10$월요일<-as.numeric(data10$월요일) #화요일를 numeric로
df_mon10<-data.frame(일자=data10$요일,월요일=data10$월요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data10$화요일<-gsub(",","",data10$화요일) #월요일의 3자리 단위로 있는 ,를 삭제
data10$화요일<-as.numeric(data10$화요일) #화요일를 numeric로
df_tue10<-data.frame(일자=data10$요일,화요일=data10$화요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data10$수요일<-gsub(",","",data10$수요일) #월요일의 3자리 단위로 있는 ,를 삭제
data10$수요일<-as.numeric(data10$수요일) #화요일를 numeric로
df_wed10<-data.frame(일자=data10$요일,수요일=data10$수요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data10$목요일<-gsub(",","",data10$목요일) #월요일의 3자리 단위로 있는 ,를 삭제
data10$목요일<-as.numeric(data10$목요일) #화요일를 numeric로
df_thu10<-data.frame(일자=data10$요일,목요일=data10$목요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data10$금요일<-gsub(",","",data10$금요일) #월요일의 3자리 단위로 있는 ,를 삭제
data10$금요일<-as.numeric(data10$금요일) #화요일를 numeric로
df_fri10<-data.frame(일자=data10$요일,금요일=data10$금요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data10$토요일<-gsub(",","",data10$토요일) #월요일의 3자리 단위로 있는 ,를 삭제
data10$토요일<-as.numeric(data10$토요일) #화요일를 numeric로
df_sat10<-data.frame(일자=data10$요일,토요일=data10$토요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data10$일요일<-gsub(",","",data10$일요일) #월요일의 3자리 단위로 있는 ,를 삭제
data10$일요일<-as.numeric(data10$일요일) #화요일를 numeric로
df_sun10<-data.frame(일자=data10$요일,일요일=data10$일요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

# 2018년 11월 월요일~일요일 사용자 수 예측
data11$월요일<-gsub(",","",data11$월요일) #월요일의 3자리 단위로 있는 ,를 삭제
data11$월요일<-as.numeric(data11$월요일) #화요일를 numeric로
df_mon11<-data.frame(일자=data11$요일,월요일=data11$월요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data11$화요일<-gsub(",","",data11$화요일) #월요일의 3자리 단위로 있는 ,를 삭제
data11$화요일<-as.numeric(data11$화요일) #화요일를 numeric로
df_tue11<-data.frame(일자=data11$요일,화요일=data11$화요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data11$수요일<-gsub(",","",data11$수요일) #월요일의 3자리 단위로 있는 ,를 삭제
data11$수요일<-as.numeric(data11$수요일) #화요일를 numeric로
df_wed11<-data.frame(일자=data11$요일,수요일=data11$수요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data11$목요일<-gsub(",","",data11$목요일) #월요일의 3자리 단위로 있는 ,를 삭제
data11$목요일<-as.numeric(data11$목요일) #화요일를 numeric로
df_thu11<-data.frame(일자=data11$요일,목요일=data11$목요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data11$금요일<-gsub(",","",data11$금요일) #월요일의 3자리 단위로 있는 ,를 삭제
data11$금요일<-as.numeric(data11$금요일) #화요일를 numeric로
df_fri11<-data.frame(일자=data11$요일,금요일=data11$금요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data11$토요일<-gsub(",","",data11$토요일) #월요일의 3자리 단위로 있는 ,를 삭제
data11$토요일<-as.numeric(data11$토요일) #화요일를 numeric로
df_sat11<-data.frame(일자=data11$요일,토요일=data11$토요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data11$일요일<-gsub(",","",data11$일요일) #월요일의 3자리 단위로 있는 ,를 삭제
data11$일요일<-as.numeric(data11$일요일) #화요일를 numeric로
df_sun11<-data.frame(일자=data11$요일,일요일=data11$일요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

# 2018년 12월 월요일~일요일 사용자 수 예측
data12$월요일<-gsub(",","",data12$월요일) #월요일의 3자리 단위로 있는 ,를 삭제
data12$월요일<-as.numeric(data12$월요일) #화요일를 numeric로
df_mon12<-data.frame(일자=data12$요일,월요일=data12$월요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data12$화요일<-gsub(",","",data12$화요일) #월요일의 3자리 단위로 있는 ,를 삭제
data12$화요일<-as.numeric(data12$화요일) #화요일를 numeric로
df_tue12<-data.frame(일자=data12$요일,화요일=data12$화요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data12$수요일<-gsub(",","",data12$수요일) #월요일의 3자리 단위로 있는 ,를 삭제
data12$수요일<-as.numeric(data12$수요일) #화요일를 numeric로
df_wed12<-data.frame(일자=data12$요일,수요일=data12$수요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data12$목요일<-gsub(",","",data12$목요일) #월요일의 3자리 단위로 있는 ,를 삭제
data12$목요일<-as.numeric(data12$목요일) #화요일를 numeric로
df_thu12<-data.frame(일자=data12$요일,목요일=data12$목요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data12$금요일<-gsub(",","",data12$금요일) #월요일의 3자리 단위로 있는 ,를 삭제
data12$금요일<-as.numeric(data12$금요일) #화요일를 numeric로
df_fri12<-data.frame(일자=data12$요일,금요일=data12$금요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data12$토요일<-gsub(",","",data12$토요일) #월요일의 3자리 단위로 있는 ,를 삭제
data12$토요일<-as.numeric(data12$토요일) #화요일를 numeric로
df_sat12<-data.frame(일자=data12$요일,토요일=data12$토요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

data12$일요일<-gsub(",","",data12$일요일) #월요일의 3자리 단위로 있는 ,를 삭제
data12$일요일<-as.numeric(data12$일요일) #화요일를 numeric로
df_sun12<-data.frame(일자=data12$요일,일요일=data12$일요일) # 요일->일자로, 월요일->월요일로 컬럼 이름 변경

#인러닝 값 대입
#2018년 1월 월요일~일요일 
in_learning_mon1<-getDataSet(df_mon1$월요일,1,15,INPUT_NODES) #1월 값들 입력
in_learning_tue1<-getDataSet(df_tue1$화요일,1,15,INPUT_NODES) #1월 값들 입력
in_learning_wed1<-getDataSet(df_wed1$수요일,1,15,INPUT_NODES) #1월 값들 입력
in_learning_thu1<-getDataSet(df_thu1$목요일,1,15,INPUT_NODES) #1월 값들 입력
in_learning_fri1<-getDataSet(df_fri1$금요일,1,15,INPUT_NODES) #1월 값들 입력
in_learning_sat1<-getDataSet(df_sat1$토요일,1,15,INPUT_NODES) #1월 값들 입력
in_learning_sun1<-getDataSet(df_sun1$일요일,1,15,INPUT_NODES) #1월 값들 입력
in_learning2<-getDataSet(df2$인원수,1,15,INPUT_NODES) #2월 값들 입력
in_learning3<-getDataSet(df3$인원수,1,15,INPUT_NODES) #3월 값들 입력
in_learning4<-getDataSet(df4$인원수,1,16,INPUT_NODES) #4월 값들 입력
in_learning5<-getDataSet(df5$인원수,1,16,INPUT_NODES) #5월 값들 입력
in_learning6<-getDataSet(df6$인원수,1,16,INPUT_NODES) #6월 값들 입력

#2018년 7월 월요일~일요일
in_learning_mon7<-getDataSet(df_mon7$월요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_tue7<-getDataSet(df_tue7$화요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_wed7<-getDataSet(df_wed7$수요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_thu7<-getDataSet(df_thu7$목요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_fri7<-getDataSet(df_fri7$금요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_sat7<-getDataSet(df_sat7$토요일,1,15,INPUT_NODES) #7월 값들 입력
in_learning_sun7<-getDataSet(df_sun7$일요일,1,15,INPUT_NODES) #7월 값들 입력

#2018년 8월 월요일~일요일
in_learning_mon8<-getDataSet(df_mon8$월요일,1,15,INPUT_NODES) #8월 값들 입력
in_learning_tue8<-getDataSet(df_tue8$화요일,1,15,INPUT_NODES) #8월 값들 입력
in_learning_wed8<-getDataSet(df_wed8$수요일,1,15,INPUT_NODES) #8월 값들 입력
in_learning_thu8<-getDataSet(df_thu8$목요일,1,15,INPUT_NODES) #8월 값들 입력
in_learning_fri8<-getDataSet(df_fri8$금요일,1,15,INPUT_NODES) #8월 값들 입력
in_learning_sat8<-getDataSet(df_sat8$토요일,1,15,INPUT_NODES) #8월 값들 입력
in_learning_sun8<-getDataSet(df_sun8$일요일,1,15,INPUT_NODES) #8월 값들 입력

#2018년 9월 월요일~일요일
in_learning_mon9<-getDataSet(df_mon9$월요일,1,15,INPUT_NODES) #9월 값들 입력
in_learning_tue9<-getDataSet(df_tue9$화요일,1,15,INPUT_NODES) #9월 값들 입력
in_learning_wed9<-getDataSet(df_wed9$수요일,1,15,INPUT_NODES) #9월 값들 입력
in_learning_thu9<-getDataSet(df_thu9$목요일,1,15,INPUT_NODES) #9월 값들 입력
in_learning_fri9<-getDataSet(df_fri9$금요일,1,15,INPUT_NODES) #9월 값들 입력
in_learning_sat9<-getDataSet(df_sat9$토요일,1,15,INPUT_NODES) #9월 값들 입력
in_learning_sun9<-getDataSet(df_sun9$일요일,1,15,INPUT_NODES) #9월 값들 입력

#2018년 10월 월요일~일요일
in_learning_mon10<-getDataSet(df_mon10$월요일,1,15,INPUT_NODES) #10월 값들 입력
in_learning_tue10<-getDataSet(df_tue10$화요일,1,15,INPUT_NODES) #10월 값들 입력
in_learning_wed10<-getDataSet(df_wed10$수요일,1,15,INPUT_NODES) #10월 값들 입력
in_learning_thu10<-getDataSet(df_thu10$목요일,1,15,INPUT_NODES) #10월 값들 입력
in_learning_fri10<-getDataSet(df_fri10$금요일,1,15,INPUT_NODES) #10월 값들 입력
in_learning_sat10<-getDataSet(df_sat10$토요일,1,15,INPUT_NODES) #10월 값들 입력
in_learning_sun10<-getDataSet(df_sun10$일요일,1,15,INPUT_NODES) #10월 값들 입력

#2018년 11월 월요일~일요일
in_learning_mon11<-getDataSet(df_mon11$월요일,1,15,INPUT_NODES) #11월 값들 입력
in_learning_tue11<-getDataSet(df_tue11$화요일,1,15,INPUT_NODES) #11월 값들 입력
in_learning_wed11<-getDataSet(df_wed11$수요일,1,15,INPUT_NODES) #11월 값들 입력
in_learning_thu11<-getDataSet(df_thu11$목요일,1,15,INPUT_NODES) #11월 값들 입력
in_learning_fri11<-getDataSet(df_fri11$금요일,1,15,INPUT_NODES) #11월 값들 입력
in_learning_sat11<-getDataSet(df_sat11$토요일,1,15,INPUT_NODES) #11월 값들 입력
in_learning_sun11<-getDataSet(df_sun11$일요일,1,15,INPUT_NODES) #11월 값들 입력

#2018년 12월 월요일~일요일
in_learning_mon12<-getDataSet(df_mon12$월요일,1,15,INPUT_NODES) #12월 값들 입력
in_learning_tue12<-getDataSet(df_tue12$화요일,1,15,INPUT_NODES) #12월 값들 입력
in_learning_wed12<-getDataSet(df_wed12$수요일,1,15,INPUT_NODES) #12월 값들 입력
in_learning_thu12<-getDataSet(df_thu12$목요일,1,15,INPUT_NODES) #12월 값들 입력
in_learning_fri12<-getDataSet(df_fri12$금요일,1,15,INPUT_NODES) #12월 값들 입력
in_learning_sat12<-getDataSet(df_sat12$토요일,1,15,INPUT_NODES) #12월 값들 입력
in_learning_sun12<-getDataSet(df_sun12$일요일,1,15,INPUT_NODES) #12월 값들 입력


#아웃러닝 값 대입
#2018년 1월 월요일~일요일
out_learning_mon1<-getDataSet(df_mon1$월요일,3,16,OUTPUT_NODES) #1월 값들 출력
out_learning_tue1<-getDataSet(df_tue1$화요일,3,16,OUTPUT_NODES) #1월 값들 출력
out_learning_wed1<-getDataSet(df_wed1$수요일,3,16,OUTPUT_NODES) #1월 값들 출력
out_learning_thu1<-getDataSet(df_thu1$목요일,3,16,OUTPUT_NODES) #1월 값들 출력
out_learning_fri1<-getDataSet(df_fri1$금요일,3,16,OUTPUT_NODES) #1월 값들 출력
out_learning_sat1<-getDataSet(df_sat1$토요일,3,16,OUTPUT_NODES) #1월 값들 출력
out_learning_sun1<-getDataSet(df_sun1$일요일,3,16,OUTPUT_NODES) #1월 값들 출력
out_learning2<-getDataSet(df2$인원수,3,16,OUTPUT_NODES) #2월 값들 출력
out_learning3<-getDataSet(df3$인원수,3,16,OUTPUT_NODES) #3월 값들 출력
out_learning4<-getDataSet(df4$인원수,3,17,OUTPUT_NODES) #4월 값들 출력
out_learning5<-getDataSet(df5$인원수,3,17,OUTPUT_NODES) #5월 값들 출력
out_learning6<-getDataSet(df6$인원수,3,17,OUTPUT_NODES) #6월 값들 출력

#2018년 7월 월요일~일요일
out_learning_mon7<-getDataSet(df_mon7$월요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_tue7<-getDataSet(df_tue7$화요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_wed7<-getDataSet(df_wed7$수요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_thu7<-getDataSet(df_thu7$목요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_fri7<-getDataSet(df_fri7$금요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_sat7<-getDataSet(df_sat7$토요일,3,16,OUTPUT_NODES) #7월 값들 출력
out_learning_sun7<-getDataSet(df_sun7$일요일,3,16,OUTPUT_NODES) #7월 값들 출력

#2018년 8월 월요일~일요일
out_learning_mon8<-getDataSet(df_mon8$월요일,3,16,OUTPUT_NODES) #8월 값들 출력
out_learning_tue8<-getDataSet(df_tue8$화요일,3,16,OUTPUT_NODES) #8월 값들 출력
out_learning_wed8<-getDataSet(df_wed8$수요일,3,16,OUTPUT_NODES) #8월 값들 출력
out_learning_thu8<-getDataSet(df_thu8$목요일,3,16,OUTPUT_NODES) #8월 값들 출력
out_learning_fri8<-getDataSet(df_fri8$금요일,3,16,OUTPUT_NODES) #8월 값들 출력
out_learning_sat8<-getDataSet(df_sat8$토요일,3,16,OUTPUT_NODES) #8월 값들 출력
out_learning_sun8<-getDataSet(df_sun8$일요일,3,16,OUTPUT_NODES) #8월 값들 출력

#2018년 9월 월요일~일요일
out_learning_mon9<-getDataSet(df_mon9$월요일,3,16,OUTPUT_NODES) #9월 값들 출력
out_learning_tue9<-getDataSet(df_tue9$화요일,3,16,OUTPUT_NODES) #9월 값들 출력
out_learning_wed9<-getDataSet(df_wed9$수요일,3,16,OUTPUT_NODES) #9월 값들 출력
out_learning_thu9<-getDataSet(df_thu9$목요일,3,16,OUTPUT_NODES) #9월 값들 출력
out_learning_fri9<-getDataSet(df_fri9$금요일,3,16,OUTPUT_NODES) #9월 값들 출력
out_learning_sat9<-getDataSet(df_sat9$토요일,3,16,OUTPUT_NODES) #9월 값들 출력
out_learning_sun9<-getDataSet(df_sun9$일요일,3,16,OUTPUT_NODES) #9월 값들 출력

#2018년 10월 월요일~일요일
out_learning_mon10<-getDataSet(df_mon10$월요일,3,16,OUTPUT_NODES) #10월 값들 출력
out_learning_tue10<-getDataSet(df_tue10$화요일,3,16,OUTPUT_NODES) #10월 값들 출력
out_learning_wed10<-getDataSet(df_wed10$수요일,3,16,OUTPUT_NODES) #10월 값들 출력
out_learning_thu10<-getDataSet(df_thu10$목요일,3,16,OUTPUT_NODES) #10월 값들 출력
out_learning_fri10<-getDataSet(df_fri10$금요일,3,16,OUTPUT_NODES) #10월 값들 출력
out_learning_sat10<-getDataSet(df_sat10$토요일,3,16,OUTPUT_NODES) #10월 값들 출력
out_learning_sun10<-getDataSet(df_sun10$일요일,3,16,OUTPUT_NODES) #10월 값들 출력

#2018년 11월 월요일~일요일
out_learning_mon11<-getDataSet(df_mon11$월요일,3,16,OUTPUT_NODES) #11월 값들 출력
out_learning_tue11<-getDataSet(df_tue11$화요일,3,16,OUTPUT_NODES) #11월 값들 출력
out_learning_wed11<-getDataSet(df_wed11$수요일,3,16,OUTPUT_NODES) #11월 값들 출력
out_learning_thu11<-getDataSet(df_thu11$목요일,3,16,OUTPUT_NODES) #11월 값들 출력
out_learning_fri11<-getDataSet(df_fri11$금요일,3,16,OUTPUT_NODES) #11월 값들 출력
out_learning_sat11<-getDataSet(df_sat11$토요일,3,16,OUTPUT_NODES) #11월 값들 출력
out_learning_sun11<-getDataSet(df_sun11$일요일,3,16,OUTPUT_NODES) #11월 값들 출력

#2018년 12월 월요일~일요일
out_learning_mon12<-getDataSet(df_mon12$월요일,3,16,OUTPUT_NODES) #12월 값들 출력
out_learning_tue12<-getDataSet(df_tue12$화요일,3,16,OUTPUT_NODES) #12월 값들 출력
out_learning_wed12<-getDataSet(df_wed12$수요일,3,16,OUTPUT_NODES) #12월 값들 출력
out_learning_thu12<-getDataSet(df_thu12$목요일,3,16,OUTPUT_NODES) #12월 값들 출력
out_learning_fri12<-getDataSet(df_fri12$금요일,3,16,OUTPUT_NODES) #12월 값들 출력
out_learning_sat12<-getDataSet(df_sat12$토요일,3,16,OUTPUT_NODES) #12월 값들 출력
out_learning_sun12<-getDataSet(df_sun12$일요일,3,16,OUTPUT_NODES) #12월 값들 출력

#신경망 모델 중 하나인 nnet 패키지 함수를 이용하여 1월~12월 이용자 수 예측값 모델링 설정
# 2018년 1월 월요일~일요일
model_mon1<-nnet(in_learning_mon1,out_learning_mon1,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_tue1<-nnet(in_learning_mon1,out_learning_mon1,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_wed1<-nnet(in_learning_mon1,out_learning_mon1,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_thu1<-nnet(in_learning_mon1,out_learning_mon1,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_fri1<-nnet(in_learning_mon1,out_learning_mon1,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sat1<-nnet(in_learning_mon1,out_learning_mon1,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sun1<-nnet(in_learning_mon1,out_learning_mon1,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model2<-nnet(in_learning2,out_learning2,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model3<-nnet(in_learning3,out_learning3,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model4<-nnet(in_learning4,out_learning4,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model5<-nnet(in_learning5,out_learning5,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model6<-nnet(in_learning6,out_learning6,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)

#2018년 7월 월요일~일요일
model_mon7<-nnet(in_learning_mon7,out_learning_mon7,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_tue7<-nnet(in_learning_tue7,out_learning_tue7,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_wed7<-nnet(in_learning_wed7,out_learning_wed7,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_thu7<-nnet(in_learning_thu7,out_learning_thu7,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_fri7<-nnet(in_learning_fri7,out_learning_fri7,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sat7<-nnet(in_learning_sat7,out_learning_sat7,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sun7<-nnet(in_learning_sun7,out_learning_sun7,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)

#2018년 8월 월요일~일요일
model_mon8<-nnet(in_learning_mon8,out_learning_mon8,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_tue8<-nnet(in_learning_tue8,out_learning_tue8,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_wed8<-nnet(in_learning_wed8,out_learning_wed8,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_thu8<-nnet(in_learning_thu8,out_learning_thu8,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_fri8<-nnet(in_learning_fri8,out_learning_fri8,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sat8<-nnet(in_learning_sat8,out_learning_sat8,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sun8<-nnet(in_learning_sun8,out_learning_sun8,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)

#2018년 9월 월요일~일요일
model_mon9<-nnet(in_learning_mon9,out_learning_mon9,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_tue9<-nnet(in_learning_tue9,out_learning_tue9,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_wed9<-nnet(in_learning_wed9,out_learning_wed9,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_thu9<-nnet(in_learning_thu9,out_learning_thu9,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_fri9<-nnet(in_learning_fri9,out_learning_fri9,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sat9<-nnet(in_learning_sat9,out_learning_sat9,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sun9<-nnet(in_learning_sun9,out_learning_sun9,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)

#2018년 10월 월요일~일요일
model_mon10<-nnet(in_learning_mon10,out_learning_mon10,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_tue10<-nnet(in_learning_tue10,out_learning_tue10,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_wed10<-nnet(in_learning_wed10,out_learning_wed10,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_thu10<-nnet(in_learning_thu10,out_learning_thu10,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_fri10<-nnet(in_learning_fri10,out_learning_fri10,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sat10<-nnet(in_learning_sat10,out_learning_sat10,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sun10<-nnet(in_learning_sun10,out_learning_sun10,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)

#2018년 11월 월요일~일요일
model_mon11<-nnet(in_learning_mon11,out_learning_mon11,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_tue11<-nnet(in_learning_tue11,out_learning_tue11,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_wed11<-nnet(in_learning_wed11,out_learning_wed11,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_thu11<-nnet(in_learning_thu11,out_learning_thu11,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_fri11<-nnet(in_learning_fri11,out_learning_fri11,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sat11<-nnet(in_learning_sat11,out_learning_sat11,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sun11<-nnet(in_learning_sun11,out_learning_sun11,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)

#2018년 12월 월요일~일요일
model_mon12<-nnet(in_learning_mon12,out_learning_mon12,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_tue12<-nnet(in_learning_tue12,out_learning_tue12,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_wed12<-nnet(in_learning_wed12,out_learning_wed12,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_thu12<-nnet(in_learning_thu12,out_learning_thu12,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_fri12<-nnet(in_learning_fri12,out_learning_fri12,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sat12<-nnet(in_learning_sat12,out_learning_sat12,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)
model_sun12<-nnet(in_learning_sun12,out_learning_sun12,size=HIDDEN_NODES,linout = TRUE,rang = 0.1,skip=TRUE,maxit = ITERATION)

#in_forecasting 에 1~12월 예측값 대입
#2018년 1월 월요일~일요일 예측값 대입
in_forecasting_mon1<-getDataSet(df_mon1$월요일,15,16,INPUT_NODES)
in_forecasting_tue1<-getDataSet(df_tue1$화요일,15,16,INPUT_NODES)
in_forecasting_wed1<-getDataSet(df_wed1$수요일,15,16,INPUT_NODES)
in_forecasting_thu1<-getDataSet(df_thu1$목요일,15,16,INPUT_NODES)
in_forecasting_fri1<-getDataSet(df_fri1$금요일,15,16,INPUT_NODES)
in_forecasting_sat1<-getDataSet(df_sat1$토요일,15,16,INPUT_NODES)
in_forecasting_sun1<-getDataSet(df_sun1$일요일,15,16,INPUT_NODES)
in_forecasting2<-getDataSet(df2$인원수,15,16,INPUT_NODES)
in_forecasting3<-getDataSet(df3$인원수,15,16,INPUT_NODES)
in_forecasting4<-getDataSet(df4$인원수,16,17,INPUT_NODES)
in_forecasting5<-getDataSet(df5$인원수,16,17,INPUT_NODES)
in_forecasting6<-getDataSet(df6$인원수,16,17,INPUT_NODES)

#2018년 7월 월요일~일요일 예측값 대입
in_forecasting_mon7<-getDataSet(df_mon7$월요일,15,16,INPUT_NODES)
in_forecasting_tue7<-getDataSet(df_tue7$화요일,15,16,INPUT_NODES)
in_forecasting_wed7<-getDataSet(df_wed7$수요일,15,16,INPUT_NODES)
in_forecasting_thu7<-getDataSet(df_thu7$목요일,15,16,INPUT_NODES)
in_forecasting_fri7<-getDataSet(df_fri7$금요일,15,16,INPUT_NODES)
in_forecasting_sat7<-getDataSet(df_sat7$토요일,15,16,INPUT_NODES)
in_forecasting_sun7<-getDataSet(df_sun7$일요일,15,16,INPUT_NODES)

#2018년 8월 월요일~일요일 예측값 대입
in_forecasting_mon8<-getDataSet(df_mon8$월요일,15,16,INPUT_NODES)
in_forecasting_tue8<-getDataSet(df_tue8$화요일,15,16,INPUT_NODES)
in_forecasting_wed8<-getDataSet(df_wed8$수요일,15,16,INPUT_NODES)
in_forecasting_thu8<-getDataSet(df_thu8$목요일,15,16,INPUT_NODES)
in_forecasting_fri8<-getDataSet(df_fri8$금요일,15,16,INPUT_NODES)
in_forecasting_sat8<-getDataSet(df_sat8$토요일,15,16,INPUT_NODES)
in_forecasting_sun8<-getDataSet(df_sun8$일요일,15,16,INPUT_NODES)

#2018년 9월 월요일~일요일 예측값 대입
in_forecasting_mon9<-getDataSet(df_mon9$월요일,15,16,INPUT_NODES)
in_forecasting_tue9<-getDataSet(df_tue9$화요일,15,16,INPUT_NODES)
in_forecasting_wed9<-getDataSet(df_wed9$수요일,15,16,INPUT_NODES)
in_forecasting_thu9<-getDataSet(df_thu9$목요일,15,16,INPUT_NODES)
in_forecasting_fri9<-getDataSet(df_fri9$금요일,15,16,INPUT_NODES)
in_forecasting_sat9<-getDataSet(df_sat9$토요일,15,16,INPUT_NODES)
in_forecasting_sun9<-getDataSet(df_sun9$일요일,15,16,INPUT_NODES)

#2018년 10월 월요일~일요일 예측값 대입
in_forecasting_mon10<-getDataSet(df_mon10$월요일,15,16,INPUT_NODES)
in_forecasting_tue10<-getDataSet(df_tue10$화요일,15,16,INPUT_NODES)
in_forecasting_wed10<-getDataSet(df_wed10$수요일,15,16,INPUT_NODES)
in_forecasting_thu10<-getDataSet(df_thu10$목요일,15,16,INPUT_NODES)
in_forecasting_fri10<-getDataSet(df_fri10$금요일,15,16,INPUT_NODES)
in_forecasting_sat10<-getDataSet(df_sat10$토요일,15,16,INPUT_NODES)
in_forecasting_sun10<-getDataSet(df_sun10$일요일,15,16,INPUT_NODES)

#2018년 11월 월요일~일요일 예측값 대입
in_forecasting_mon11<-getDataSet(df_mon11$월요일,15,16,INPUT_NODES)
in_forecasting_tue11<-getDataSet(df_tue11$화요일,15,16,INPUT_NODES)
in_forecasting_wed11<-getDataSet(df_wed11$수요일,15,16,INPUT_NODES)
in_forecasting_thu11<-getDataSet(df_thu11$목요일,15,16,INPUT_NODES)
in_forecasting_fri11<-getDataSet(df_fri11$금요일,15,16,INPUT_NODES)
in_forecasting_sat11<-getDataSet(df_sat11$토요일,15,16,INPUT_NODES)
in_forecasting_sun11<-getDataSet(df_sun11$일요일,15,16,INPUT_NODES)

#2018년 12월 월요일~일요일 예측값 대입
in_forecasting_mon12<-getDataSet(df_mon12$월요일,15,16,INPUT_NODES)
in_forecasting_tue12<-getDataSet(df_tue12$화요일,15,16,INPUT_NODES)
in_forecasting_wed12<-getDataSet(df_wed12$수요일,15,16,INPUT_NODES)
in_forecasting_thu12<-getDataSet(df_thu12$목요일,15,16,INPUT_NODES)
in_forecasting_fri12<-getDataSet(df_fri12$금요일,15,16,INPUT_NODES)
in_forecasting_sat12<-getDataSet(df_sat12$토요일,15,16,INPUT_NODES)
in_forecasting_sun12<-getDataSet(df_sun12$일요일,15,16,INPUT_NODES)

#1~12월 이용자 수 예측값 출력
#2018년 1월 월요일~일요일 예측값 출력
predicted_values_mon1<-predict(model_mon1,in_forecasting_mon1,type="raw")
predicted_values_tue1<-predict(model_tue1,in_forecasting_mon1,type="raw")
predicted_values_wed1<-predict(model_wed1,in_forecasting_mon1,type="raw")
predicted_values_thu1<-predict(model_thu1,in_forecasting_mon1,type="raw")
predicted_values_fri1<-predict(model_fri1,in_forecasting_mon1,type="raw")
predicted_values_sat1<-predict(model_sat1,in_forecasting_mon1,type="raw")
predicted_values_sun1<-predict(model_sun1,in_forecasting_mon1,type="raw")
predicted_values<-predict(model2,in_forecasting2,type="raw")
predicted_values3<-predict(model3,in_forecasting3,type="raw")
predicted_values4<-predict(model4,in_forecasting4,type="raw")
predicted_values5<-predict(model5,in_forecasting5,type="raw")
predicted_values6<-predict(model6,in_forecasting6,type="raw")

#2018년 7월 월요일~일요일 예측값 출력
predicted_values_mon7<-predict(model_mon7,in_forecasting_mon7,type="raw")
predicted_values_tue7<-predict(model_tue7,in_forecasting_tue7,type="raw")
predicted_values_wed7<-predict(model_wed7,in_forecasting_wed7,type="raw")
predicted_values_thu7<-predict(model_thu7,in_forecasting_thu7,type="raw")
predicted_values_fri7<-predict(model_fri7,in_forecasting_fri7,type="raw")
predicted_values_sat7<-predict(model_sat7,in_forecasting_sat7,type="raw")
predicted_values_sun7<-predict(model_sun7,in_forecasting_sun7,type="raw")

#2018년 8월 월요일~일요일 예측값 출력
predicted_values_mon8<-predict(model_mon8,in_forecasting_mon8,type="raw")
predicted_values_tue8<-predict(model_tue8,in_forecasting_tue8,type="raw")
predicted_values_wed8<-predict(model_wed8,in_forecasting_wed8,type="raw")
predicted_values_thu8<-predict(model_thu8,in_forecasting_thu8,type="raw")
predicted_values_fri8<-predict(model_fri8,in_forecasting_fri8,type="raw")
predicted_values_sat8<-predict(model_sat8,in_forecasting_sat8,type="raw")
predicted_values_sun8<-predict(model_sun8,in_forecasting_sun8,type="raw")

#2018년 9월 월요일~일요일 예측값 출력
predicted_values_mon9<-predict(model_mon9,in_forecasting_mon9,type="raw")
predicted_values_tue9<-predict(model_tue9,in_forecasting_tue9,type="raw")
predicted_values_wed9<-predict(model_wed9,in_forecasting_wed9,type="raw")
predicted_values_thu9<-predict(model_thu9,in_forecasting_thu9,type="raw")
predicted_values_fri9<-predict(model_fri9,in_forecasting_fri9,type="raw")
predicted_values_sat9<-predict(model_sat9,in_forecasting_sat9,type="raw")
predicted_values_sun9<-predict(model_sun9,in_forecasting_sun9,type="raw")

#2018년 10월 월요일~일요일 예측값 출력
predicted_values_mon10<-predict(model_mon10,in_forecasting_mon10,type="raw")
predicted_values_tue10<-predict(model_tue10,in_forecasting_tue10,type="raw")
predicted_values_wed10<-predict(model_wed10,in_forecasting_wed10,type="raw")
predicted_values_thu10<-predict(model_thu10,in_forecasting_thu10,type="raw")
predicted_values_fri10<-predict(model_fri10,in_forecasting_fri10,type="raw")
predicted_values_sat10<-predict(model_sat10,in_forecasting_sat10,type="raw")
predicted_values_sun10<-predict(model_sun10,in_forecasting_sun10,type="raw")

#2018년 11월 월요일~일요일 예측값 출력
predicted_values_mon11<-predict(model_mon11,in_forecasting_mon11,type="raw")
predicted_values_tue11<-predict(model_tue11,in_forecasting_tue11,type="raw")
predicted_values_wed11<-predict(model_wed11,in_forecasting_wed11,type="raw")
predicted_values_thu11<-predict(model_thu11,in_forecasting_thu11,type="raw")
predicted_values_fri11<-predict(model_fri11,in_forecasting_fri11,type="raw")
predicted_values_sat11<-predict(model_sat11,in_forecasting_sat11,type="raw")
predicted_values_sun11<-predict(model_sun11,in_forecasting_sun11,type="raw")

#2018년 12월 월요일~일요일 예측값 출력
predicted_values_mon12<-predict(model_mon12,in_forecasting_mon12,type="raw")
predicted_values_tue12<-predict(model_tue12,in_forecasting_tue12,type="raw")
predicted_values_wed12<-predict(model_wed12,in_forecasting_wed12,type="raw")
predicted_values_thu12<-predict(model_thu12,in_forecasting_thu12,type="raw")
predicted_values_fri12<-predict(model_fri12,in_forecasting_fri12,type="raw")
predicted_values_sat12<-predict(model_sat12,in_forecasting_sat12,type="raw")
predicted_values_sun12<-predict(model_sun12,in_forecasting_sun12,type="raw")

predicted_values_mon1
predicted_values2
predicted_values3
predicted_values4
predicted_values5
predicted_values6

predicted_values_mon7
predicted_values_tue7
predicted_values_wed7
predicted_values_thu7
predicted_values_fri7
predicted_values_sat7
predicted_values_sun7

predicted_values_mon8
predicted_values_tue8
predicted_values_wed8
predicted_values_thu8
predicted_values_fri8
predicted_values_sat8
predicted_values_sun8

predicted_values_mon9
predicted_values_tue9
predicted_values_wed9
predicted_values_thu9
predicted_values_fri9
predicted_values_sat9
predicted_values_sun9

predicted_values_mon10
predicted_values_tue10
predicted_values_wed10
predicted_values_thu10
predicted_values_fri10
predicted_values_sat10
predicted_values_sun10

predicted_values_mon11
predicted_values_tue11
predicted_values_wed11
predicted_values_thu11
predicted_values_fri11
predicted_values_sat11
predicted_values_sun11

predicted_values_mon12
predicted_values_tue12
predicted_values_wed12
predicted_values_thu12
predicted_values_fri12
predicted_values_sat12
predicted_values_sun12

#2018년 1~12월 예측 값들을 predicted_2018에 대입하여 테이블 생성
predicted_2018_1<-c(predicted_values_mon1,predicted_values_tue1,predicted_values_wed1,predicted_values_thu1,predicted_values_fri1,predicted_values_sat1,predicted_values_sun1)
#월요일~일요일 범위 설정 값 테이블 생성
day_2018<-c("월요일","화요일","수요일","목요일","금요일","토요일","일요일")

View(predicted_2018_1)
#Year2018에 2018년 1~12월 까지의 이용자 수 범위와 예측값 가지는 테이블 생성
#1월 월요일~일요일 예측값
Year2018_1<-data.frame(day_2018,predicted_2018_1)

#Year2018 테이블 출력
View(Year2018_1)

#예측값을 기준으로 예측값이 낮은 순 부터 높은 순으로 1~12월 출력(오름차순)
aggregate(day_2018~predicted_2018_1, Year2018_1, max)

#2018년 1월~12월 예측값 점,선 그래프 출력
plot(predicted_2018_1, xlab = "2018년1월", ylab = "인원수", ylim=c(300000,600000),type = "o", col = "red", axes=FALSE)

plot(predicted_2018_1)
#x축에 월요일~일요일 범위 출력
axis(1,at=1:7, lab=c("월요일","화요일","수요일","목요일","금요일","토요일","일요일"))

#y축에 최대값 최솟값 설정
axis(2,ylim=c(300000,600000))
grid()
