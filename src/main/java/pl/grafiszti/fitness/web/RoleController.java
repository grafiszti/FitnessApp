package pl.grafiszti.fitness.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.grafiszti.fitness.data.entity.RoleTypeEntity;
import pl.grafiszti.fitness.data.service.RoleTypeService;

@Controller
public class RoleController {
  private static final String VIEW_NAME = "roles";
  private static final String ROLE_TYPES = "roleTypes";

  @Autowired
  RoleTypeService roleTypeService;

  @RequestMapping(value = "/roles", method = {RequestMethod.GET, RequestMethod.POST})
  public String process(Model model) {
    return VIEW_NAME;
  }

  @ModelAttribute(ROLE_TYPES)
  public List<RoleTypeEntity> getRoleTypes() {
    return roleTypeService.findAll();
  }

  @RequestMapping(value = "/addRole", method = RequestMethod.GET)
  public String addEmployee(@RequestParam(value = "id") Long id,
      @RequestParam(value = "name") String name, Model model) {
    roleTypeService.save(new RoleTypeEntity(id, name.toUpperCase()));
    return VIEW_NAME;
  }

  @RequestMapping(value = "/removeRole", method = RequestMethod.GET)
  public String removeEmployee(@RequestParam(value = "id") Long id, Model model) {
    roleTypeService.deleteById(id);
    return VIEW_NAME;
  }

}
