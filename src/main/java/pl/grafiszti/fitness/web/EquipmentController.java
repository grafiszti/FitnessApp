package pl.grafiszti.fitness.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import pl.grafiszti.fitness.data.entity.EmployeeEntity;
import pl.grafiszti.fitness.data.entity.EquipmentEntity;
import pl.grafiszti.fitness.data.entity.EquipmentTypeEntity;
import pl.grafiszti.fitness.data.service.EquipmentService;
import pl.grafiszti.fitness.data.service.EquipmentTypeService;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class EquipmentController {
  private static final String VIEW_NAME = "equipment";

  @Autowired
  EquipmentTypeService eqTypeService;

  @Autowired
  EquipmentService equipmentService;

  @RequestMapping(value = "/equipment", method = RequestMethod.GET)
  public String process(Model model) {
    return VIEW_NAME;
  }

  @RequestMapping(value = "/eqTypes", method = RequestMethod.GET)
  @ResponseBody
  public List<String> getEqTypes() {
    return eqTypeService.findAll().stream().map(EquipmentTypeEntity::getName)
        .collect(Collectors.toList());
  }

  @ModelAttribute("equipments")
  public List<EquipmentEntity> getEquipment() {
    return equipmentService.findAll();
  }

  @RequestMapping(value = "/equipment", method = RequestMethod.POST)
  public String addEquipment(EquipmentEntity equipmentEntity, WebRequest request)
      throws ParseException {
    String typeName = request.getParameter("typeName");
    EquipmentTypeEntity eqType = eqTypeService.findByName(typeName);
    if (eqType == null) {
      eqType = new EquipmentTypeEntity(typeName);
      eqTypeService.save(eqType);
    }

    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String purchaseDateString = request.getParameter("purchaseDateString");
    if (purchaseDateString != null && !"".equals(purchaseDateString)) {
      Date purchaseDate = dateFormat.parse(purchaseDateString);
      equipmentEntity.setPurchaseDate(purchaseDate);
    }
    String lastServiceDateString = request.getParameter("lastServiceDateString");
    if (lastServiceDateString != null && !"".equals(lastServiceDateString)) {
      Date lastServiceDate = dateFormat.parse(lastServiceDateString);
      equipmentEntity.setLastServiceDate(lastServiceDate);
    }

    equipmentEntity.setEquipmentType(eqType);
    equipmentService.save(equipmentEntity);
    return VIEW_NAME;
  }

  @RequestMapping(value = "/equipment", method = RequestMethod.DELETE)
  public String delete(
      @RequestParam(value = "id")
      Long id) {
    equipmentService.delete(id);
    return VIEW_NAME;
  }



  @RequestMapping(value = "/equipment/{id}", method = RequestMethod.GET)
  @ResponseBody
  public EquipmentEntity getEquipment(
      @PathVariable("id")
      Long id) {
    return equipmentService.findById(id);
  }
}
