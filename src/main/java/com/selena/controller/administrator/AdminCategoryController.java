package com.selena.controller.administrator;

import com.selena.controller.BaseController;
import com.selena.model.Categories;
import com.selena.model.Product;
import com.selena.model.SaleOrder;
import com.selena.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
public class AdminCategoryController extends BaseController {
    @Autowired
    private CategoryRepository categoryRepository;

    @RequestMapping(value = { "/admin/category" }, method = RequestMethod.GET)
    public String adminCategoryAdd(final Model model) {
        // khởi tạo 1 product(entity) mới
        Categories newCategory = new Categories();
        model.addAttribute("category", newCategory); // đẩy data xuống view

        // trả về view
        return "administrator/category";
    }

    @RequestMapping(value = { "/admin/category" }, method = RequestMethod.POST)
    public String addCategory(@ModelAttribute("category") Categories categories) {
       categoryRepository.save(categories);
        return "redirect:/admin/product";
    }
}
