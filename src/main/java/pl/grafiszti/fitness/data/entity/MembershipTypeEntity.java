package pl.grafiszti.fitness.data.entity;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "membership_type")
public class MembershipTypeEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
  private String name;
  private int lengthDays;
  private BigDecimal price;


  public MembershipTypeEntity(String name, int lengthDays, BigDecimal price) {
    this.name = name;
    this.lengthDays = lengthDays;
    this.price = price;
  }
}
