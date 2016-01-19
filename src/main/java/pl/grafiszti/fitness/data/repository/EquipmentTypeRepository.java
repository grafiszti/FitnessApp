package pl.grafiszti.fitness.data.repository;

import java.util.List;

import org.springframework.data.repository.Repository;

import pl.grafiszti.fitness.data.entity.EquipmentTypeEntity;

public interface EquipmentTypeRepository extends Repository<EquipmentTypeEntity, Long> {
  EquipmentTypeEntity findById(Long id);

  EquipmentTypeEntity findByName(String name);

  void save(EquipmentTypeEntity eqType);

  void delete(Long id);

  List<EquipmentTypeEntity> findAll();
}
