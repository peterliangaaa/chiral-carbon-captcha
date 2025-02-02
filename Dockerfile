FROM ubuntu:latest
MAINTAINER woxigousade
#添加中文字体
ADD https://raw.githubusercontent.com/SirlyDreamer/Yunzai-Bot/DockerResources/wqy-microhei/wqy-microhei.ttc /usr/share/fonts/wqy-microhei.ttc

#安装jdk11
RUN apt update && apt-get -y install openjdk-11-jdk git maven && git clone https://github.com/woxigousade/chiral-carbon-captcha.git && cd chiral-carbon-captcha && mvn clean -DskipTests=true package && nohup java -Dspring.profiles.active=prod -jar chiral-carbon-captcha-0.0.1.jar &

EXPOSE 9999
