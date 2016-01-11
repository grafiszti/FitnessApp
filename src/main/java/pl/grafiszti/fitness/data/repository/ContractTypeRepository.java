package pl.grafiszti.fitness.data.repository;

import org.springframework.data.repository.Repository;

import pl.grafiszti.fitness.data.entity.ContractTypeEntity;

public interface ContractTypeRepository extends Repository<ContractTypeEntity, Long> {
  ContractTypeEntity findById(Long id);

  ContractTypeEntity findByName(String name);

  void save(ContractTypeEntity contractType);
}
