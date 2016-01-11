package pl.grafiszti.fitness.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.MembershipTypeEntity;
import pl.grafiszti.fitness.data.repository.MembershipTypeRepository;

@Service
public class MembershipTypeService {
  @Autowired
  MembershipTypeRepository membershipTypeRepository;

  public MembershipTypeEntity findById(Long id) {
    return membershipTypeRepository.findOne(id);
  }

  public void save(MembershipTypeEntity membershipType) {
    membershipTypeRepository.save(membershipType);
  }
}
