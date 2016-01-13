
package pl.grafiszti.fitness.web;

import java.util.Date;

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
  public String addEmployee(
      @RequestParam(value = "id") Long id,
      @RequestParam(value = "name") String name, 
      @RequestParam(value = "surname") String surname,
      @RequestParam(value = "dateOfEmployment") String dateOfEmployment, 
      @RequestParam(value = "contractType") String contractTypeName,
      @RequestParam(value = "salaryHour") Integer salaryHour, Model model) {
    employeeService.save(new EmployeeEntity(id, name, surname, new Date(),
        getContractType(contractTypeName), salaryHour));
    initModel(model);
    return VIEW_NAME;
  }
  
//  @RequestMapping(value = "/updateEmployee", method = RequestMethod.GET)
//  public String updateEmployee(
//      @RequestParam(value = "id") Long id,
//      @RequestParam(value = "name") String name, 
//      @RequestParam(value = "surname") String surname,
//      @RequestParam(value = "dateOfEmployment") String dateOfEmployment, 
//      @RequestParam(value = "contractType") String contractTypeName,
//      @RequestParam(value = "salaryHour") Integer salaryHour, Model model) {
//    //EmployeeEntity employee = employeeService.findById(id);
//    //setEmployeeParams(employee, name, surname, dateOfEmployment, contractTypeName, salaryHour);
//    //employeeService.save(employee);
//    //model.addAttribute("employee", employee);
//    return VIEW_NAME;
//  }
  
  private void setEmployeeParams(EmployeeEntity employee, String n, String s, String d, String ctn,
      Integer sh) {
    employee.setName(n);
    employee.setSurname(s);
    employee.setDateOfEmployment(new Date());
    employee.setContractType(getContractType(ctn));
    employee.setSalaryHour(sh);
  }

  private ContractTypeEntity getContractType(String contractTypeName) {
    ContractTypeEntity contractType = contractTypeService.findByName(contractTypeName);
    return contractType == null ? contractTypeService.findById(new Long(1)) : contractType;
  }

  @RequestMapping(value = "/getEmployee", method = RequestMethod.GET)
  public EmployeeEntity getEmployeeById(@RequestParam(value = "id") Long id, Model model) {
    return employeeService.findById(id);
  }

  @RequestMapping(value = "/removeEmployee", method = RequestMethod.GET)
  public String removeEmployee(@RequestParam(value = "id") Long id, Model model) {
    employeeService.deleteById(id);
    initModel(model);
    return VIEW_NAME;
  }

  @RequestMapping(value = "/editEmployee", method = RequestMethod.GET)
  public String editEmployee(@RequestParam(value = "id") Long id, Model model) {
    EmployeeEntity editedEmployee = employeeService.findById(new Long(id));
    model.addAttribute("employee", editedEmployee);
    return "editEmployee";
  }
}
