package pl.grafiszti.fitness.data.repository;

import java.util.List;

import org.springframework.data.repository.Repository;

import pl.grafiszti.fitness.data.entity.EmployeeEntity;

public interface EmployeeRepository extends Repository<EmployeeEntity, Long> {
  List<EmployeeEntity> findAll();

  EmployeeEntity findById(Long id);

  void save(EmployeeEntity employee);

  void delete(Long id);
}
