package pl.grafiszti.fitness.data.repository;

import org.springframework.data.repository.CrudRepository;

import pl.grafiszti.fitness.data.entity.MembershipTypeEntity;

public interface MembershipTypeRepository extends CrudRepository<MembershipTypeEntity, Long> {

}