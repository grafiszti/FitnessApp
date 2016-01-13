package pl.grafiszti.fitness.data.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "employee")
public class EmployeeEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
  private String name;
  private String surname;
  private Date dateOfEmployment;

  @OneToOne(fetch = FetchType.EAGER)
  private ContractTypeEntity contractType;
  private Integer salaryHour;

  public EmployeeEntity(String name, String surname, Date dateOfEmployment,
      ContractTypeEntity contractType, Integer salaryHour) {
    this.name = name;
    this.surname = surname;
    this.dateOfEmployment = dateOfEmployment;
    this.contractType = contractType;
    this.salaryHour = salaryHour;
  }
}
