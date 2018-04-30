install.packages("readxl") # 엑셀 파일 읽을 수 있는 패키지 설치
install.packages("ggplot2") # 파일 분석 하여 그래프로 출력하기 위한 패키지 설치

library(readxl)
w201701 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201701.xls") #2017년 01월 요일 별 승객 인원 통계 엑셀 파일 가져오기
w201702 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201702.xls") #2017년 02월 요일 별 승객 인원 통계 엑셀 파일 가져오기
w201703 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201703.xls") #2017년 03월 요일 별 승객 인원 통계 엑셀 파일 가져오기
w201704 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201704.xls") #2017년 04월 요일 별 승객 인원 통계 엑셀 파일 가져오기
w201705 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201705.xls") #2017년 05월 요일 별 승객 인원 통계 엑셀 파일 가져오기
w201706 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201706.xls") #2017년 06월 요일 별 승객 인원 통계 엑셀 파일 가져오기
w201707 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201707.xls") #2017년 07월 요일 별 승객 인원 통계 엑셀 파일 가져오기
w201708 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201708.xls") #2017년 08월 요일 별 승객 인원 통계 엑셀 파일 가져오기
w201709 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201709.xls") #2017년 09월 요일 별 승객 인원 통계 엑셀 파일 가져오기
w201710 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201710.xls") #2017년 10월 요일 별 승객 인원 통계 엑셀 파일 가져오기
w201711 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201711.xls") #2017년 11월 요일 별 승객 인원 통계 엑셀 파일 가져오기
w201712 <- read_excel("C:/Users/Han S.W/Desktop/airport/w201712.xls") #2017년 12월 요일 별 승객 인원 통계 엑셀 파일 가져오기


library(ggplot2)

ggplot(w201701, aes(x=요일, y=합계,group=1)) 
+ggtitle("2017년 1월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")

+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")

ggplot(w201702, aes(x=요일, y=합계,group=1))+ggtitle("2017년 2월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201703, aes(x=요일, y=합계,group=1))+ggtitle("2017년 3월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201704, aes(x=요일, y=합계,group=1))+ggtitle("2017년 4월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201705, aes(x=요일, y=합계,group=1))+ggtitle("2017년 5월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201706, aes(x=요일, y=합계,group=1))+ggtitle("2017년 6월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201707, aes(x=요일, y=합계,group=1))+ggtitle("2017년 7월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201708, aes(x=요일, y=합계,group=1))+ggtitle("2017년 8월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201709, aes(x=요일, y=합계,group=1))+ggtitle("2017년 9월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201710, aes(x=요일, y=합계,group=1))+ggtitle("2017년 10월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201711, aes(x=요일, y=합계,group=1))+ggtitle("2017년 11월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
ggplot(w201712, aes(x=요일, y=합계,group=1))+ggtitle("2017년 12월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
