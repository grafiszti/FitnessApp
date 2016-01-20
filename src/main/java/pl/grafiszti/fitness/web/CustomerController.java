package pl.grafiszti.fitness.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import pl.grafiszti.fitness.data.entity.CustomerEntity;
import pl.grafiszti.fitness.data.entity.MembershipEntity;
import pl.grafiszti.fitness.data.entity.MembershipTypeEntity;
import pl.grafiszti.fitness.data.service.CustomerService;
import pl.grafiszti.fitness.data.service.MembershipService;
import pl.grafiszti.fitness.data.service.MembershipTypeService;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.websocket.server.PathParam;

@Controller
public class CustomerController {

  private static final String VIEW_NAME = "customer";
  @Autowired
  CustomerService customerService;

  @Autowired
  MembershipTypeService membershipTypeService;

  @Autowired
  MembershipService membershipService;

  @RequestMapping(value = "/customers", method = RequestMethod.GET)
  public String process(Model model) {
    return VIEW_NAME;
  }

  @RequestMapping(value = "/customers", method = RequestMethod.POST)
  public String addEditCustomer(CustomerEntity customerEntity, WebRequest request)
      throws ParseException {
    Long membershipTypeId = Long.valueOf(request.getParameter("membershipType"));
    Date startDate = null;
    if (membershipTypeId > 0) {
      DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      startDate = dateFormat.parse(request.getParameter("membershipDate"));
    } else {
      membershipTypeId = null;
    }

    MembershipEntity membership = customerEntity.getMembership();

    if (membership == null) {
      membership = new MembershipEntity();
    }

    membership.setMembershipType(membershipTypeService.findById(membershipTypeId));
    membership.setStartDate(startDate);
    customerEntity.setMembership(membership);

    membershipService.save(membership);

    customerService.save(customerEntity);

    return VIEW_NAME;
  }

  @RequestMapping(value = "/customers", method = RequestMethod.DELETE)
  public String delete(
      @RequestParam("id")
      Long id, Model model) {
    customerService.delete(id);
    return VIEW_NAME;
  }

  @RequestMapping(value = "/customers/{id}", method = RequestMethod.GET)
  @ResponseBody
  public CustomerEntity getCustomer(
      @PathVariable("id")
      Long id) {
    return customerService.findById(id);
  }


  @ModelAttribute("customers")
  public List<CustomerEntity> getCustomers() {
    return customerService.findAll();
  }

  @ModelAttribute("membershipTypes")
  public List<MembershipTypeEntity> getMembershipTypes() {
    return membershipTypeService.findAll();
  }
}
