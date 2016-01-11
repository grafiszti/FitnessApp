package pl.grafiszti.fitness.data.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "membership")
public class MembershipEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;

  @OneToOne(fetch = FetchType.EAGER)
  CustomerEntity customer;

  @OneToOne(fetch = FetchType.EAGER)
  MembershipTypeEntity membershipType;

  Date startDate;

  BigDecimal price;

  public MembershipEntity(CustomerEntity customer, MembershipTypeEntity membershipType,
      Date startDate, BigDecimal price) {
    this.customer = customer;
    this.membershipType = membershipType;
    this.startDate = startDate;
    this.price = price;
  }
}