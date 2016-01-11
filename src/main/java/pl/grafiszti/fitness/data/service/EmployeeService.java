package pl.grafiszti.fitness.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.EmployeeEntity;
import pl.grafiszti.fitness.data.repository.EmployeeRepository;

@Service
public class EmployeeService {

  @Autowired
  EmployeeRepository employeeRepository;

  public EmployeeEntity findById(Long id) {
    return employeeRepository.findOne(id);
  }

  public void save(EmployeeEntity employee) {
    employeeRepository.save(employee);
  }
}