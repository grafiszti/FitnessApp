package pl.grafiszti.fitness.data.entity;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

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
  private MembershipTypeEntity membershipType;

  private Date startDate;


  public MembershipEntity(MembershipTypeEntity membershipType, Date startDate) {
    this.membershipType = membershipType;
    this.startDate = startDate;
  }

  @Transient
  public Date getEndDate() {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(startDate);
    calendar.add(Calendar.DAY_OF_WEEK, membershipType.getLengthDays());
    return calendar.getTime();
  }
}
