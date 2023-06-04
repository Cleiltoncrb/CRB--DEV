package com.example.demo.Controllers;


import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ExampleController
 * 
 * @author Daniel Padua
 */
@RestController
@RequestMapping("api/example")
public class ExamplerController {

	@GetMapping("/hello-world")
	public ResponseEntity<String> get() {
		return ResponseEntity.ok("Hellorld!");
	}
    @GetMapping("/user/{id}") 
	public ResponseEntity<String> get(@PathVariable Integer id) {
		id = 89;
        id = (id + 5);
        return ResponseEntity.ok(id.toString());
	}
}