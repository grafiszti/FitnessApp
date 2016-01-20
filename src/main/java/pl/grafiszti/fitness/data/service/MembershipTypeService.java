package pl.grafiszti.fitness.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.MembershipTypeEntity;
import pl.grafiszti.fitness.data.repository.MembershipTypeRepository;

@Service
public class MembershipTypeService {
  @Autowired
  MembershipTypeRepository membershipTypeRepository;

  public MembershipTypeEntity findById(Long id) {
    return membershipTypeRepository.findById(id);
  }

  public void save(MembershipTypeEntity memebershipType) {
    membershipTypeRepository.save(memebershipType);
  }

  public List<MembershipTypeEntity> findAll() {
    return membershipTypeRepository.findAll();
  }
  
  public void deleteById(Long id){
    membershipTypeRepository.delete(id);
  }
}
