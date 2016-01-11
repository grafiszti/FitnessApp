package pl.grafiszti.fitness.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "customer")
public class CustomerEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  Long id;
  String name;
  String surname;
  String adress;

  public CustomerEntity(String name, String surname, String adress) {
    this.name = name;
    this.surname = surname;
    this.adress = adress;
  }

}
