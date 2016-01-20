package pl.grafiszti.fitness.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.grafiszti.fitness.data.entity.MembershipTypeEntity;
import pl.grafiszti.fitness.data.service.MembershipTypeService;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class MembershipTypeController {
  private static final String VIEW_NAME = "membershipTypes";

  @Autowired
  MembershipTypeService membershipTypeService;

  @RequestMapping(value = "/membershipTypes", method = {RequestMethod.GET, RequestMethod.POST})
  public String process(Model model) {
    return VIEW_NAME;
  }

  @ModelAttribute("membershipTypes")
  public List<MembershipTypeEntity> getMembershipTypes() {
    return membershipTypeService.findAll();
  }

  @RequestMapping(value = "/addMembershipType", method = RequestMethod.GET)
  public String addMembershipType(@RequestParam(value = "id") Long id,
      @RequestParam(value = "name") String name,
      @RequestParam(value = "lengthInDays") int lengthDays,
      @RequestParam(value = "price") String price, Model model) {
    membershipTypeService.save(new MembershipTypeEntity(id, name, lengthDays, new BigDecimal(price)));
    return VIEW_NAME;
  }

  @RequestMapping(value = "/removeMembershipType", method = RequestMethod.GET)
  public String removeMembershipType(@RequestParam(value = "id") Long id, Model model) {
    membershipTypeService.deleteById(id);
    return VIEW_NAME;
  }

  @ResponseBody
  @RequestMapping(value = "/getMembershipType", method = RequestMethod.GET)
  public MembershipTypeEntity getMembershipType(@RequestParam(value = "id") Long id, Model model) {
    return membershipTypeService.findById(id);
  }

}
