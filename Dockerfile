FROM ubuntu:latest
MAINTAINER woxigousade
#添加中文字体
ADD https://raw.githubusercontent.com/SirlyDreamer/Yunzai-Bot/DockerResources/wqy-microhei/wqy-microhei.ttc /usr/share/fonts/wqy-microhei.ttc

#安装jdk11
RUN apt update && apt-get -y install openjdk-11-jdk && git clone https://github.com/woxigousade/chiral-carbon-captcha.git && mvn clean -DskipTests=true package && nohup java -Dspring.profiles.active=prod -jar chiral-carbon-captcha-0.0.1.jar && 1


EXPOSE 9999

ENTRYPOINT ["java","-Dspring.profiles.active=prod","-jar","/app.jar"]
