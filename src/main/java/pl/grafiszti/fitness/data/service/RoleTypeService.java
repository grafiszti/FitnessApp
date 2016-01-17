package pl.grafiszti.fitness.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.RoleTypeEntity;
import pl.grafiszti.fitness.data.repository.RoleTypeRepository;

@Service
public class RoleTypeService {
  @Autowired
  RoleTypeRepository roleTypeRepository;

  public RoleTypeEntity findById(Long id) {
    return roleTypeRepository.findById(id);
  }

  public void save(RoleTypeEntity roleType) {
    roleTypeRepository.save(roleType);
  }
  
  public RoleTypeEntity findByName(String name) {
    return roleTypeRepository.findByName(name);
  }

  public List<RoleTypeEntity> findAll() {
    return roleTypeRepository.findAll();
  }
}
