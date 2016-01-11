package pl.grafiszti.fitness.data.entity;

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
@Table(name = "membership_type")
public class MembershipTypeEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
  private String name;
  private int lengthDays;

  public MembershipTypeEntity(String name, int lengthDays) {
    this.name = name;
    this.lengthDays = lengthDays;
  }
}
