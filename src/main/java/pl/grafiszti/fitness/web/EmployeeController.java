package pl.grafiszti.fitness.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.grafiszti.fitness.data.entity.ContractTypeEntity;
import pl.grafiszti.fitness.data.entity.EmployeeEntity;
import pl.grafiszti.fitness.data.service.ContractTypeService;
import pl.grafiszti.fitness.data.service.EmployeeService;

@Controller
public class EmployeeController {
  private static final String VIEW_NAME = "employees";
  private static final String EMPLOYEES = VIEW_NAME;
  private static final String CONTRACT_TYPES = "contractTypes";

  @Autowired
  EmployeeService employeeService;

  @Autowired
  ContractTypeService contractTypeService;

  @RequestMapping(value = "/employees", method = RequestMethod.GET)
  public String process(Model model) {
    return VIEW_NAME;
  }

  @ModelAttribute(EMPLOYEES)
  public List<EmployeeEntity> getEmployees() {
    return employeeService.findAll();
  }
  
  @ModelAttribute(CONTRACT_TYPES)
  public List<ContractTypeEntity> getContractTypes(){
    return contractTypeService.findAll();
  }

  @RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
  public String addEmployee(@RequestParam(value = "id") Long id,
      @RequestParam(value = "name") String name, @RequestParam(value = "surname") String surname,
      @RequestParam(value = "dateOfEmployment") String dateOfEmployment, @RequestParam(
          value = "contractTypeId") Long contractTypeId,
      @RequestParam(value = "salaryHour") Integer salaryHour, Model model) {
    employeeService.save(new EmployeeEntity(id, name, surname, new Date(),
        contractTypeService.findById(contractTypeId), salaryHour));
    return VIEW_NAME;
  }

  @ResponseBody
  @RequestMapping(value = "/getEmployee", method = RequestMethod.GET)
  public EmployeeEntity getEmployeeById(@RequestParam(value = "id") Long id, Model model) {
    return employeeService.findEmployeeById(id);
  }

  @RequestMapping(value = "/removeEmployee", method = RequestMethod.GET)
  public String removeEmployee(@RequestParam(value = "id") Long id, Model model) {
    employeeService.deleteById(id);
    return VIEW_NAME;
  }
}
