package pl.grafiszti.fitness.data.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import pl.grafiszti.fitness.entity.EmployeeEntity;


@Repository
public interface EmployeeRepository extends CrudRepository<EmployeeEntity, Long>{
  List<EmployeeEntity> findAll();
}
