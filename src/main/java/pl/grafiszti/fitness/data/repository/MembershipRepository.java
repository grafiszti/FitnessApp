package pl.grafiszti.fitness.data.repository;

import org.springframework.data.repository.CrudRepository;

import pl.grafiszti.fitness.entity.MembershipEntity;

public interface MembershipRepository extends CrudRepository<MembershipEntity, Long> {

}
