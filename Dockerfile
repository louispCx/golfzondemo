FROM tomcat

RUN user add -ms /bin/bash test_user
USER test_user
WORKDIR /home/test_user

COPY . .

RUN apt-get update ; apt-get install maven default-jdk -y ; update-alternatives --config javac

RUN mvn clean package ; cp target/*.war /usr/local/tomcat/webapps/

CMD ["catalina.sh","run"]
