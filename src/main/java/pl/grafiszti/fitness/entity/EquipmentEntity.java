package pl.grafiszti.fitness.entity;

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
@Table(name = "equipment")
public class EquipmentEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private Long id;
  private String serialNumber;
  private String name;

  @OneToOne(fetch = FetchType.EAGER)
  private EquipmentTypeEntity equipmentType;
  private Date purchaseDate;
  private Date lastServiceDate;
  private boolean isWorking;

  public EquipmentEntity(String serialNumber, String name, EquipmentTypeEntity eqt,
      Date purchaseDate, Date lastServiceDate, boolean isWorking) {
    this.serialNumber = serialNumber;
    this.name = name;
    this.equipmentType = eqt;
    this.purchaseDate = purchaseDate;
    this.lastServiceDate = lastServiceDate;
    this.isWorking = isWorking;
  }
}
