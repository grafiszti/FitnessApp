package pl.grafiszti.fitness.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.grafiszti.fitness.data.entity.ContractTypeEntity;
import pl.grafiszti.fitness.data.entity.EmployeeEntity;
import pl.grafiszti.fitness.data.repository.ContractTypeRepository;
import pl.grafiszti.fitness.data.repository.EmployeeRepository;

@Controller
public class HomeController {

  @Autowired
  EmployeeRepository employeeRepository;

  @Autowired
  ContractTypeRepository contractTypeRepo;

  @RequestMapping(value = {"/"}, method = RequestMethod.GET)
  public String home(Model model) {
    ContractTypeEntity cte = new ContractTypeEntity("asd");
    contractTypeRepo.save(cte);
    employeeRepository.save(new EmployeeEntity("asd", "asd", new Date(), cte, 1));
    List<EmployeeEntity> emps = employeeRepository.findAll();
    model.addAttribute("emps", emps);
    return "home";
  }
}
