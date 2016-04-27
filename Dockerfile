FROM nimmis/java:openjdk-8-jdk

RUN apt-get update && apt-get install -y git

WORKDIR /minecraft

COPY BuildTools.jar /minecraft

RUN java -jar BuildTools.jar --rev 1.9

RUN echo "eula=true" > eula.txt

CMD ["java", "-Xms512M", "-Xmx1G", "-XX:+UseConcMarkSweepGC", "-jar", "spigot-1.9.jar"]
