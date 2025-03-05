package spring;

import io.micrometer.core.instrument.MeterRegistry;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@Slf4j
@RequiredArgsConstructor
@RestController
public class ObservabilityController {

  private final RestTemplate restTemplate;

  private final MeterRegistry meterRegistry;

  @GetMapping("/")
  public String home() {
    log.info("Accessing home endpoint");
    meterRegistry.counter("home_endpoint_visits").increment();
    return "Hello, Observability!";
  }

  @GetMapping("/external-call")
  public String externalCall() {
    log.warn("Making an external API call");
    meterRegistry.counter("external_calls").increment();
    try {
      String response =
          restTemplate.getForObject("https://jsonplaceholder.typicode.com/todos/1", String.class);
      return "External Call Successful: " + response;
    } catch (Exception e) {
      log.error("External call failed", e);
      meterRegistry.counter("external_calls_failed").increment();
      return "External Call Failed";
    }
  }
}
