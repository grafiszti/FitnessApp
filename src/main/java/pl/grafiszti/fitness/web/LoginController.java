package pl.grafiszti.fitness.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
  private static final String VIEW_NAME = "login";

  @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
  public String login(Model model) {
    return VIEW_NAME;
  }
  
  @RequestMapping(value = "/error", method = {RequestMethod.GET, RequestMethod.POST})
  public String error(Model model) {
    return "error";
  }
}
