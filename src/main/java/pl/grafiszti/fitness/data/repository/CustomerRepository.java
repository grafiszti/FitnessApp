package pl.grafiszti.fitness.data.repository;

import org.springframework.data.repository.CrudRepository;

import pl.grafiszti.fitness.entity.CustomerEntity;

public interface CustomerRepository extends CrudRepository<CustomerEntity, Long> {

}
