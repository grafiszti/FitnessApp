package pl.grafiszti.fitness.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.EmployeeEntity;
import pl.grafiszti.fitness.data.repository.EmployeeRepository;

@Service
public class EmployeeService implements UserDetailsService {

  @Autowired
  EmployeeRepository employeeRepository;

  public EmployeeEntity findEmployeeById(Long id) {
    return employeeRepository.findOne(id);
  }

  public void save(EmployeeEntity employee) {
    employeeRepository.save(employee);
  }

  public List<EmployeeEntity> findAll() {
    return employeeRepository.findAll();
  }

  public void deleteById(Long id) {
    employeeRepository.delete(id);
  }

  @Override
  public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
    return employeeRepository.findByLogin(login);
  }
}
