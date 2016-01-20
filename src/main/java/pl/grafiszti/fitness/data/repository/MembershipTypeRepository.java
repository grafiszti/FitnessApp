package pl.grafiszti.fitness.data.repository;

import java.util.List;

import org.springframework.data.repository.Repository;

import pl.grafiszti.fitness.data.entity.MembershipTypeEntity;

public interface MembershipTypeRepository extends Repository<MembershipTypeEntity, Long> {
  MembershipTypeEntity findById(Long id);

  MembershipTypeEntity findByName(String name);

  void save(MembershipTypeEntity membershipType);

  List<MembershipTypeEntity> findAll();

  void delete(Long id);
}
