ARG java_image_tag=17-jammy
#ARG OTEL_JAVA_AGENT_VERSION=2.13.3

FROM eclipse-temurin:${java_image_tag}

ARG JAR_FILE=target/*.jar

COPY ${JAR_FILE} app.jar

#RUN set -ex; \
#    apt-get update; \
#    apt-get install -y maven; \
#
#RUN mvn org.apache.maven.plugins:maven-dependency-plugin:3.8.1:get \
#    -Dartifact=org.apache.iceberg:iceberg-spark-runtime-3.5_2.12:1.7.1 -Ddest=$SPARK_JARS_DIR/iceberg-spark-runtime-3.5_2.12-1.7.1.jar

ADD --chmod=644 https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v2.13.3/opentelemetry-javaagent.jar opentelemetry-javaagent.jar
ENV JAVA_TOOL_OPTIONS=-javaagent:opentelemetry-javaagent.jar
#ENV OTEL_EXPORTER_OTLP_ENDPOINT="http://alloy:4318"
ENV OTEL_EXPORTER_OTLP_ENDPOINT="http://host.docker.internal:4320"

ENTRYPOINT ["java","-jar","app.jar"]