package pl.grafiszti.fitness.web;

import java.util.Date;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.grafiszti.fitness.data.entity.ContractTypeEntity;
import pl.grafiszti.fitness.data.entity.EmployeeEntity;
import pl.grafiszti.fitness.data.service.ContractTypeService;
import pl.grafiszti.fitness.data.service.EmployeeService;

@Slf4j
@Controller
public class EmployeeController {
  private static String VIEW_NAME = "employees";

  @Autowired
  EmployeeService employeeService;

  @Autowired
  ContractTypeService contractTypeService;

  @RequestMapping(value = "/employees", method = RequestMethod.GET)
  public String process(Model model) {
    initModel(model);
    return VIEW_NAME;
  }

  private void initModel(Model model) {
    model.addAttribute("employees", employeeService.findAll());
  }

  @RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
  public String addEmployee(@RequestParam(value = "name") String name, @RequestParam(
      value = "surname") String surname,
      @RequestParam(value = "dateOfEmployment") String dateOfEmployment, @RequestParam(
          value = "contractType") String contractTypeName,
      @RequestParam(value = "salaryHour") Integer salaryHour, Model model) {
    ContractTypeEntity contractType = contractTypeService.findByName(contractTypeName);
    log.debug("Name: " + name + "Surname: " + surname);
    EmployeeEntity newEmployee =
        new EmployeeEntity(name, surname, new Date(), contractType, salaryHour);
    employeeService.save(newEmployee);
    initModel(model);
    return VIEW_NAME;
  }

  @RequestMapping(value = "/removeEmployee", method = RequestMethod.GET)
  public String removeEmployee(@RequestParam(value = "id") Long id, Model model) {
    employeeService.deleteById(id);
    initModel(model);
    return VIEW_NAME;
  }
}
