package pl.grafiszti.fitness.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.EquipmentEntity;
import pl.grafiszti.fitness.data.repository.EquipmentRepository;

@Service
public class EquipmentService {
  @Autowired
  EquipmentRepository equipmentRepository;

  public EquipmentEntity findById(Long id) {
    return equipmentRepository.findOne(id);
  }

  public void save(EquipmentEntity equipment) {
    equipmentRepository.save(equipment);
  }
}
