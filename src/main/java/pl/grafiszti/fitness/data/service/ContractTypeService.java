package pl.grafiszti.fitness.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.grafiszti.fitness.data.entity.ContractTypeEntity;
import pl.grafiszti.fitness.data.repository.ContractTypeRepository;

@Service
public class ContractTypeService {
  @Autowired
  ContractTypeRepository contractTypeRepository;

  public ContractTypeEntity findById(Long id) {
    return contractTypeRepository.findOne(id);
  }

  public void save(ContractTypeEntity contractType) {
    contractTypeRepository.save(contractType);
  }
}
