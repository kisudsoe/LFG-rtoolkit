#버전 v1.5
#최초작성 2014-03-10 MON
#최종수정 2016-05-02 MON
#작성자 : 김승수
 
### Session 관리 함수 ###
 
  > ls() 					# 기억된 변수의 목록을 표시
  > rm(x) 					# 변수 x를 삭제함
  > rm(list=ls()) 			# 기억된 모든 변수를 삭제
  > search() 				# search path
 
  > save.image() 			# 현재 작업공간을 저장함(Default path: C:\Program Files\R\rw1071) "*.RData" 파일이 생성됨
  > save.image("folder path") # R은 디렉토리 구분을 "\\" 또는 "/"으로 함에 주의

 
### I. 데이터 입출력 함수 ###
 
## I-1. 입력 관련 ##
 
  > scan() 					# 직접 입력을 받기 위한 함수. 엔터키 입력시 종료
  > scan(n=m) 				# m개의 값을 입력
  > scan(what="") 			# 입력값을 문자로 지정
  > scan(sep=",") 			# ,를 기준으로 데이터를 분리하여 입력 받음
 
  > getwd() 				# 현재 작업공간을 확인
  > setwd("C:\Users\PC\Documents\R") # 작업공간을 설정/변경
 
  > read.table("aa.txt") 	# 데이터 프레임으로 aa.txt를 읽어옴
  > read.table("aa.txt", header=T, row.ranmes=1) # 헤더와 행이름 지정
  > read.delim("aa.txt") 	# Tap deliminated 형식을 읽어옴
  > read.csv("aa.csv",header=T) # aa.csv 파일을 읽어옴
 
  > cat(x) 					# x변수의 내용을 화면에 출력
  > cat(x, file="aa.txt") 	# aa.txt에 벡터 x 출력
  > cat(mat, file="aa2.txt") # matrix 데이터도 벡터 형태로만 출력됨
 
 
## I-2. 외부 데이터 입력 관련 ##
 
  > library(foreign) 		# foreign 패키지를 이용
 
  > read.spss("file path") 	# SPSS 파일 읽기
  > read.ssd("file path") 	# SAS 파일 읽기
  > read.mtp("file path") 	# Minitab 파일 읽기
  > read.dta("file path") 	# Stata 파일 읽기
 
 
## I-3. 출력 관련 ##
 
  > write(mat, file="aa.txt") # 작업공간에 aa.txt 이름과 테이블형태로 데이터를 출력
  > write.table(mat, "aa.csv", sep=",", row.names=TRUE) # 작업공간에 aa.csv 파일을 생성


### II. 일반 자료형 함수 ###
 
## II-1. 자료형 확인 ##
 
  > mode(x) 				# 데이터 x의 저장타입(mode)을 확인함
  > str(x) 					# 데이터의 각 열을 구성하는 자료의 mode를 확인
  > class(x) 				# 데이터 x의 저장 형태를 확인함
  > summary(x) 				# x의 자료요약
 
  > length(x) 				# 벡터 x의 길이(length)를 나타내게 함
  > dim(x) 					# 데이터 프레임의 행렬 크기를 표시
 
  > head(x) 				# 데이터의 위쪽 6행을 표시
  > head(x,n=m) 			# 데이터 x의 위쪽 m개 행을 표시
  > tail(x,n=m) 			# 데이터 x의 아래쪽 m개 행을 표시
 
 
## II-2. 벡터 관련 ##
 
# 1) 내장 벡터 #
 
  > letters 				# 알파벳이 저장되어 있는 벡터
  > month.name 				# 12달의 영어이름이 저장되어 있는 벡터
 
 
# 2) 벡터 일반 #
 
  > rnorm(n, mean=x, sd=y)	# mean=x, sd=y를 따르는 n개의 난수 생성
  > rep(x,n) 				# x를 n번 반복하는 벡터를 생성
  > min(x) 					# 최소값
  > max(x) 					# 최대값
  > range(x) 				# 범위
  > sum(x) 					# 벡터 원소들의 합
  > prod(x) 				# 벡터 원소들의 곱
  > median(x) 				# 중간값
  > mean(x) 				# 평균값
  > var(x) 					# 분산
  > sd(x) 					# 표준편차
  > cor(x, y) 				# 상관계수
  > quantile(x) 			# 4분위수
  > c(a,b) 					# 벡터 a와 b를 합침 (추가 2014-10-13)
 
 
# 3) 벡터 논리 #
 
  > which(x == "A")			# 벡터 x에서 "A"의 인덱스 위치를 반환
  > match("A", x) 			# 벡터 x에서 "A"의 인덱스 숫자를 반환
  > intersect(x, y)			# x와 y간의 교집합을 반환
  > setdiff(x, y) 			# x에 대해 y의 차집합을 반환
  > union(x, y) 			# x와 y의 합집합을 반환
  > sort(x) 				# 오름차순 정렬
  > sort(x, decreasing=T) 	# 내림차순 정렬
  > sort(x, na.last=T) 		# 결측치인 NA를 가장 마지막으로 두고 정렬
  > order(x)
  > rank(x)

  
## II-3. 행렬 관련 ##
 
  > matrix(x, nrow=n, ncol=m) # x값을 가지는 n행 m열 행렬을 생성
  > apply(x, 1, fn) 		# x행렬의 각 행에 fn 함수 적용
  > apply(x, 2, fn) 		# x행렬의 각 열에 fn 함수 적용
  > t(x) 					# x행렬의 행과 열을 바꿈
  > x * y 					# 대칭원소간 곱셈을 수행
  > x%*%y 					# 행렬의 곱셈을 수행
  > x + y 					# 대칭 원소간 덧셈을 수행
  > x - y 					# 대칭 원소간 뺄셈
  > x / y 					# 대칭 원소간 나눗셈
	
  > x[n, m] 				# n행 m열의 원소
  > x[, m] 					# m열의 모든 원소
 
 
## II-4. 배열 관련 ##
 
  > array(x, dim=c(l,m,n)) 	# x값을 가지는 l행 m열의 n개 배열을 생성
 
 
## II-5. 데이터 프레임 관련 ##
 
  > data.frame(x, y, z)		# x, y, z벡터를 가지는 데이터 프레임 생성
  > as.data.frame(x) 		# x를 데이터 프레임형으로 바꿈
 
  > edit(x) 				# 데이터 프레임 x 를 수정하는 gui 실행
  > view(x) 				# 데이터 프레임 x 를 보여주는 gui 실행
 
  > names(x) 				# 열의 변수명을 반환
  > names(x) = c("new column names") # 데이터 프레임 x의 column names을 새로 정의함 (추가 2014-10-16)
  > names(x)[1] = paste("aa") # x 데이터프레임의 첫번째 열 이름을 "aa"로 지정 (추가 2015-09-02)
  > colnames(x) 			# 열의 이름 반환/지정
  > rownames(x) 			# 행의 이름 반환/지정
  > rownames(data) = data[,1]	# data의 first column 값을 rowname으로 지정

  > grep(text,colnames(data),value=FALSE)	# data의 column 이름에서 text가 포함된 열의 id를 반환 (추가 2015-09-10)
  > grep(text,colnames(data),value=TRUE) 	# data의 column 이름에서 text가 포함된 열의 전체 이름 목록을 반환 (추가 2015-09-10)

  > nrow(x)					# 행의 개수
  > ncol(x) 				# 열의 개수
  > dim(x) 					# 행, 열의 차원(dimension)을 반환
  > mean(x) 				# 모든 열의 평균을 구함

  > rbind(x,y) 				# 두 데이터프레임 x와 y를 row 방향으로 붙임
  > cbind(x,y) 				# 두 데이터프레임 x와 y를 column 방향으로 붙임
	
  > x$a 					# 데이터 프레임의 a열(벡터)을 추출하여 반환
 
  > attach(x) 				# 데이터 프레임의 각 변수를 메모리에 로드
  > detach(x) 				# 로드된 변수를 해제
 
  > data[1] = NULL			# data의 first column을 삭제
  > data[1:n,] 				# data의 1부터 n행까지 내용을 개제 (추가 2014-10-16)

  
## II-6. 데이터 타입 변환 관련 ## (신규 2016-04-26)
 
  > as.factor(x)			# 주어진 객체 x를 팩터로 변환

  > as.numeric(x)			# 주어진 객체 x를 숫자를 저장한 벡터로 변환
  > as.double(x)
  > as.integer(x)

  > as.character(x)			# 주어진 객체 x를 문자열을 저장한 벡터로 변환

  > as.logical(x)



## II-7. 클래스 타입 변환 관련 ## (신규 2016-04-26)

  > as.list					# 벡터 x를 리스트로 변환

  > as.matrix(x)			# 벡터 x를 행렬로 변환
  > cbind(x)				# 열 추가 삽입
  > rbind(x)				# 행 추가 삽입

  > as.array(x)				# 벡터 x를 배열로 변환

  > as.data.frame(x)		# 벡터 x를 데이터 프레임으로 변환
  > unlist(df)				# 데이터 프레임 df를 벡터로 변환

  
### III. 그래프 함수 ###
  
## III-1. Hihg-level 관련 ##
 
  >  dev.new(width=x, height=y) # 가로 x, 세로 y 크기를 가지는 새 그래프창 생성 (추가 2014-10-16)
 
  > plot(x) 				# matrix 또는 data.frame으로 plot을 그림
  > plot(x1, x2) 			# x1과 x2를 각 축으로 dot plot을 그림
  > plot(x, n, m) 			# n에서 m 사이 범위에서 x를 그림
  > plot(data1, data2, xlab="x축 label", ylab="y축 label", main="제목", col=column, las=0/1/2/3)
 
  > barplot(data)
  > boxplot(data)
 
  > hist(data)
  > hist(data, main="제목", xlab="x축", las=0/1/2/3, col="color", prob=TRUE/FALSE)
 
  > plotDensity(data)
  > pie(data)
  > persp(data) 			# perspective plot
 
 
## III-2. Low-level 관련 ##
 
  > points(data)
  > lines(data, col="color")
  > ablines(x=x1)
  > rect(xleft, ybottom, xright, ytop, col=“gray”, lty=0)
  > polygon(x_vec, y_vec, col=“gray”, border=0)
 
  > text(x,y, "text")
  > axis(data)
 
 
## III-3. Trellis (격자) 관련 ##
 
  > xyplot
  > bwplot(data1, data2, data3, layout=c(column, rows, pages), main="제목")
  > histogram(data1, data2, data3, layout=c(column, rows, pages), main="제목")
 
  > par(mfrow=c(1,2)) 		# 1행 2열로 plot 파티션 나누기


## III-4. Graphic device (그림저장) 관련 ## (신규 2014-10-08)
 
  > png('filename.png', width=x, height=y) 	# 가로 x px, 세로 y px 크기의 png 파일 생성 (수정 2014-10-16)
  > dev.off()
 
  > jpg('filename.jpg')
  > dev.off()
 
  > dev.copy(png,filename='filename.png')
  > dev.off()