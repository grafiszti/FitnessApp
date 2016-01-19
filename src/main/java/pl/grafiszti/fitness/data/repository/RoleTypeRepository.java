package pl.grafiszti.fitness.data.repository;


import java.util.List;

import org.springframework.data.repository.Repository;

import pl.grafiszti.fitness.data.entity.RoleTypeEntity;

public interface RoleTypeRepository extends Repository<RoleTypeEntity, Long> {
  RoleTypeEntity findById(Long id);

  RoleTypeEntity findByName(String name);

  void save(RoleTypeEntity contractType);

  void delete(Long id);

  List<RoleTypeEntity> findAll();
}
