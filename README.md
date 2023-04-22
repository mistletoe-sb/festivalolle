# festivalolle
KOSA Final Project of Team Joyous

## 프로젝트 개요

본 프로젝트는 한국소프트웨어산업협회(KOSA) JAVA 개발자 양성과정 최종 프로젝트입니다. 

+ 프로젝트 명 : 축제올래 (영문명 : festivalolle)

+ 팀 명 : Joyous

## 기간

+ 2023.03.08 ~ 2023.04.28

## 구성원

+ 이기쁨 : PM, Agile 방법 프로젝트 진행 및 관리, 사용자/관리자 화면 로그인 및 회원가입, QR 생성, 문자 인증, WAS 구축 및 프로젝트 배포

+ 이수봉 : PL, 개발환경구성, DB 설계 및 구축, 축제정보 조회, 북마크/리뷰, 이미지 출력 비동기 처리, 모바일 UI/UX 구현, Scrolling Pagination

+ 정재웅 : PA, Oracle Job Scheduler 생성, Pixso를 이용한 UI 디자인, Kakao Post Code API 이용, 관리자 화면 축제 관리, 사용자 마이페이지

+ 이혜성 : PA, 관리자 화면 구매자 목록/리뷰 관리, ID/PW 찾기, Pixso를 이용한 UI 디자인, DB 데이터 수집/생성, Logo 및 Intro image 제작

## 개발환경

+ OS : Windows 10 Pro

+ DBMS : Oracle Database 11g Express Edition

+ WAS : Apache Tomcat 9.0.71

+ 개발언어 : Java 1.8 (Adopt OpenJDK 8u352_b08)

+ IDE : Eclipse 2022-12R, Oracle SQL Developer 20.4

+ Framework : Spring Framework 5.3.20

+ Cloud Service : Amazon EC2(DB 및 WAS 각각 구축 - 총 2개)

+ 적용 기술 : MyBatis 3.5.6, JSP 2.3, Apache Commons-dbcp2 2.9.0, HTML/CSS/JS, JQuery 3.6.3, AJAX, Bootstrap 5.2.3 

## 디렉토리 구조

+ C:

  + joyous_labs
  
    + adoptjdk_8u352b08 : JDK bin 경로
    
    + apache-tomcat-9.0.71 : local tomcat 경로(개발 및 테스트용)
    
    + eclipse2022-12R : 이클립스 실행 파일 경로
    
    + maven_reposit : maven repository cache 경로
    
      + settings.xml : localRepository 경로 설정 파일
    
    + workspace_joyous : workspace 경로
    
      + festivalolle
  
  
