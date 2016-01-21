package pl.grafiszti.fitness.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.EquipmentTypeEntity;
import pl.grafiszti.fitness.data.repository.EquipmentTypeRepository;

@Service
public class EquipmentTypeService {
  @Autowired
  EquipmentTypeRepository equipmentTypeRepository;

  public EquipmentTypeEntity findById(Long id) {
    return equipmentTypeRepository.findById(id);
  }

  public void save(EquipmentTypeEntity equipmentType) {
    equipmentTypeRepository.save(equipmentType);
  }

  public List<EquipmentTypeEntity> findAll() {
    return equipmentTypeRepository.findAll();
  }
  
  public void deleteById(Long id){
    equipmentTypeRepository.delete(id);
  }

  public EquipmentTypeEntity findByName(String name) {
    return equipmentTypeRepository.findByName(name);
  }
}
