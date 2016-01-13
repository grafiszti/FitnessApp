package pl.grafiszti.fitness.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.EmployeeEntity;
import pl.grafiszti.fitness.data.repository.EmployeeRepository;

@Service
public class EmployeeService {

  @Autowired
  EmployeeRepository employeeRepository;

  public EmployeeEntity findById(Long id) {
    return employeeRepository.findById(id);
  }

  public void save(EmployeeEntity employee) {
    employeeRepository.save(employee);
  }

  public List<EmployeeEntity> findAll() {
    return employeeRepository.findAll();
  }

  public void deleteById(Long id) {
    employeeRepository.deleteById(id);
  }
}
