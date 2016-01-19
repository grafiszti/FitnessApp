package pl.grafiszti.fitness.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.grafiszti.fitness.data.entity.EquipmentTypeEntity;
import pl.grafiszti.fitness.data.service.EquipmentTypeService;

@Controller
public class EqTypeController {
  private static final String VIEW_NAME = "eqTypes";

  @Autowired
  EquipmentTypeService eqTypeService;

  @RequestMapping(value = "/eqTypes", method = {RequestMethod.GET, RequestMethod.POST})
  public String process(Model model) {
    return VIEW_NAME;
  }

  @ModelAttribute("eqTypes")
  public List<EquipmentTypeEntity> getEqTypes() {
    return eqTypeService.findAll();
  }

  @RequestMapping(value = "/addEqType", method = RequestMethod.GET)
  public String addEqType(@RequestParam(value = "id") Long id,
      @RequestParam(value = "name") String name, Model model) {
    eqTypeService.save(new EquipmentTypeEntity(id, name.toUpperCase()));
    return VIEW_NAME;
  }

  @RequestMapping(value = "/removeEqType", method = RequestMethod.GET)
  public String removeEqType(@RequestParam(value = "id") Long id, Model model) {
    eqTypeService.deleteById(id);
    return VIEW_NAME;
  }

}
