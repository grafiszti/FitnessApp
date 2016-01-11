package pl.grafiszti.fitness.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.CustomerEntity;
import pl.grafiszti.fitness.data.repository.CustomerRepository;

@Service
public class CustomerService {

  @Autowired
  CustomerRepository customerRepository;

  public CustomerEntity findById(Long id) {
    return customerRepository.findOne(id);
  }

  public void save(CustomerEntity customer) {
    customerRepository.save(customer);
  }
}
