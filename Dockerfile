ARG java_image_tag=17-jammy

FROM eclipse-temurin:${java_image_tag}

ARG JAR_FILE=target/*.jar

COPY ${JAR_FILE} app.jar

# No need to add the agent to the image, it is auto-configured by the opentelemetry-spring-boot-starter
#ADD --chmod=644 https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v2.13.3/opentelemetry-javaagent.jar opentelemetry-javaagent.jar
#ENV JAVA_TOOL_OPTIONS=-javaagent:opentelemetry-javaagent.jar
#ENV OTEL_EXPORTER_OTLP_ENDPOINT="http://alloy:4318"

ENTRYPOINT ["java","-jar","app.jar"]