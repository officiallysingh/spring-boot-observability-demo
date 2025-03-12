# Getting Started

### Reference Documentation
For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/3.4.3/maven-plugin)
* [Create an OCI image](https://docs.spring.io/spring-boot/3.4.3/maven-plugin/build-image.html)
* [OTLP for metrics](https://docs.spring.io/spring-boot/3.4.3/reference/actuator/metrics.html#actuator.metrics.export.otlp)
* [Prometheus](https://docs.spring.io/spring-boot/3.4.3/reference/actuator/metrics.html#actuator.metrics.export.prometheus)
* [Spring Web](https://docs.spring.io/spring-boot/3.4.3/reference/web/servlet.html)

### Guides
The following guides illustrate how to use some features concretely:

* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/rest/)

### Maven Parent overrides

Due to Maven's design, elements are inherited from the parent POM to the project POM.
While most of the inheritance is fine, it also inherits unwanted elements like `<license>` and `<developers>` from the parent.
To prevent this, the project POM contains empty overrides for these elements.
If you manually switch to a different parent and actually want the inheritance, you need to remove those overrides.

### Dev setup

To create Docker image of application, run the following command.
```text
docker image build . -t spring-boot-observability-demo:0.0.1 -f Dockerfile
```

IntelliJ IDEA run configurations. Add following VM Argument to run with OpenTelemetry Java agent.
```text
-javaagent:opentelemetry-javaagent.jar
```
