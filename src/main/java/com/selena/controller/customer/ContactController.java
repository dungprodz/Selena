package com.selena.controller.customer;

import com.selena.controller.BaseController;
import com.selena.model.Contact;
import com.selena.repository.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ContactController extends BaseController {
    @Autowired
    private ContactRepository contactRepository;

    @RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
    public String contact(final Model model,
                          final HttpServletRequest request,
                          final HttpServletResponse response
    ) throws IOException {

        List<Contact> contacts = contactRepository.findAll().stream().sorted(Comparator.comparing(Contact::getId).reversed()).collect(Collectors.toList());
        model.addAttribute("contact", contacts);
        return "customer/contact";
    }
}
