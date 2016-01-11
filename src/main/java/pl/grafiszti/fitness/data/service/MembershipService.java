package pl.grafiszti.fitness.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.MembershipEntity;
import pl.grafiszti.fitness.data.repository.MembershipRepository;

@Service
public class MembershipService {
  @Autowired
  MembershipRepository membershipRepository;

  public MembershipEntity findById(Long id) {
    return membershipRepository.findOne(id);
  }

  public void save(MembershipEntity membership) {
    membershipRepository.save(membership);
  }
}
