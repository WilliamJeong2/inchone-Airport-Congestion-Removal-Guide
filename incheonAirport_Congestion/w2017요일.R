install.packages("readxl") # 엑셀 파일 읽을 수 있는 패키지 설치
install.packages("ggplot2") # 파일 분석 하여 그래프로 출력하기 위한 패키지 설치

library(readxl)

w201701 <- read_excel("R_Data/airport 2017/w201701.xls")
w201702 <- read_excel("R_Data/airport 2017/w201702.xls")
w201703 <- read_excel("R_Data/airport 2017/w201703.xls")
w201704 <- read_excel("R_Data/airport 2017/w201704.xls")
w201705 <- read_excel("R_Data/airport 2017/w201705.xls")
w201706 <- read_excel("R_Data/airport 2017/w201706.xls")
w201707 <- read_excel("R_Data/airport 2017/w201707.xls")
w201708 <- read_excel("R_Data/airport 2017/w201708.xls")
w201709 <- read_excel("R_Data/airport 2017/w201709.xls")
w201710 <- read_excel("R_Data/airport 2017/w201710.xls")
w201711 <- read_excel("R_Data/airport 2017/w201711.xls")
w201712 <- read_excel("R_Data/airport 2017/w201712.xls")

library(ggplot2)

ggplot(w201701, aes(x=요일, y=합계,group=1)) +ggtitle("2017년 1월")+geom_line()+geom_line(aes(x=요일, y=출발), colour="red")+geom_line(aes(x=요일,y=도착),colour="blue")+geom_point()+geom_point(aes(x=요일,y=출발),colour="red")+geom_point(aes(x=요일,y=도착),colour="blue")
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
