package com.pyramid.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.pyramid.dao.ProductDAO;
import com.pyramid.model.Product;

@Controller
public class ProductController {
	
	@Autowired
	ProductDAO pdao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		return new ModelAndView("redirect:/index.jsp");
	}
	
	@RequestMapping("/add")
	public ModelAndView addProductDetails() {
		return new ModelAndView("add","command",new Product());
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public ModelAndView saveProductDetails( @ModelAttribute("product") Product product) throws DataAccessException, IOException {
		pdao.saveProductDetails(product);
		return new ModelAndView("redirect:/index.jsp");
	}
	
	@RequestMapping("/view")
	public ModelAndView displayProductDetails() {
		List<Product> product_list = pdao.getProductDetails();
		return new ModelAndView("view","productlist",product_list);
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public ModelAndView displayProductCategory(@RequestParam("category") String cat_name) {
		List<Product> product_by_cat = pdao.searchProduct(cat_name);
		return new ModelAndView("viewProduct","product_by_cat_list",product_by_cat);
	}
	

}
