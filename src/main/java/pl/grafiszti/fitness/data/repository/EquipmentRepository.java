package pl.grafiszti.fitness.data.repository;

import org.springframework.data.repository.CrudRepository;

import pl.grafiszti.fitness.data.entity.EquipmentEntity;

import java.util.List;

public interface EquipmentRepository extends CrudRepository<EquipmentEntity, Long> {

  List<EquipmentEntity> findAll();
}
