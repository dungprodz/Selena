package com.selena.controller.administrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.selena.controller.BaseController;

@Controller
public class AdminProfileController extends BaseController {
	@RequestMapping(value = ("/admin/profile"), method = RequestMethod.GET)
	public String profile(final Model model,
			final HttpServletRequest request, final HttpServletResponse response) throws IOException {
		
		return "administrator/profile";
	}
}
