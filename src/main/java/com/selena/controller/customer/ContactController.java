package com.selena.controller.customer;

import com.selena.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class ContactController {

    @RequestMapping(value={"/contact"}, method = RequestMethod.GET)
    public String contact(final Model model,
                                final HttpServletRequest request,
                                final HttpServletResponse response
    ) throws IOException {


        return "customer/contact";
    }
}
