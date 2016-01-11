package pl.grafiszti.fitness.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.EquipmentTypeEntity;
import pl.grafiszti.fitness.data.repository.EquipmentTypeRepository;

@Service
public class EquipmentTypeService {
  @Autowired
  EquipmentTypeRepository equipmentTypeRepository;

  public EquipmentTypeEntity findById(Long id) {
    return equipmentTypeRepository.findOne(id);
  }

  public void save(EquipmentTypeEntity equipmentType) {
    equipmentTypeRepository.save(equipmentType);
  }
}
