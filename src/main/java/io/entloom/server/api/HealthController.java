package io.entloom.server.api;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class HealthController {

    @GetMapping("/hello")
    public Map<String, String> hello() {
        return Map.of(
                "service", "entloom-server",
                "status", "ready",
                "apiVersion", "v1");
    }
}
