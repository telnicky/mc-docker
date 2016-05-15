FROM nimmis/java:openjdk-8-jdk

RUN apt-get update && apt-get install -y git

WORKDIR /minecraft

RUN wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar

RUN java -jar BuildTools.jar --rev 1.9

RUN echo "eula=true" > eula.txt

COPY server.properties /minecraft
COPY ops.txt /minecraft
COPY plugins /minecraft/plugins

# For some reason the first time this runs it fails.
RUN java -Xms512M -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot-1.9.jar

COPY config.yml /minecraft/plugins/BukkitGames/config.yml

CMD ["java", "-Xms512M", "-Xmx1G", "-XX:+UseConcMarkSweepGC", "-jar", "spigot-1.9.jar"]
