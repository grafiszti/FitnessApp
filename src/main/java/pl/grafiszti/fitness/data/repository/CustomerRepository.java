package pl.grafiszti.fitness.data.repository;

import org.springframework.data.repository.CrudRepository;

import pl.grafiszti.fitness.data.entity.CustomerEntity;

import java.util.List;

public interface CustomerRepository extends CrudRepository<CustomerEntity, Long> {

  List<CustomerEntity> findAll();
}
