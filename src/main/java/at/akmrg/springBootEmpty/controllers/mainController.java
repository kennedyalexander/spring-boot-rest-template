package at.akmrg.springBootEmpty.controllers;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by alex on 4/21/17.
 */
@RestController
public class mainController {

	@GetMapping("/getOranges")
	public String getOranges(@RequestParam(value="orange") String orange) {
		return orange;
	}

	@GetMapping("/getLemons")
	public String getLemons() {
		return "Lemons";
	}
}
