package com.pyramid.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pyramid.dao.CartDAO;
import com.pyramid.dao.ProductDAO;
import com.pyramid.model.Cart;
import com.pyramid.model.Product;

@Controller
public class CartController {

	@Autowired
	CartDAO cdao;
	
	@Autowired
	ProductDAO pdao;
	
	
	@RequestMapping(value={"/addproduct/{p_name}"}, method=RequestMethod.POST)
	public ModelAndView addToCart(@PathVariable(value="p_name") final String name, 
			@RequestParam(value="p_qty") int qty) {
		Product p = pdao.getProductByName(name);
		double total_price = p.getPrice()*qty;
		Cart c = new Cart(name,qty,total_price);
		cdao.addCartDetails(c);
		return new ModelAndView("redirect:/viewCart");
	}
	
	@RequestMapping("/viewCart")
	public ModelAndView displayCartDetails() {
		List<Cart> cart_list = cdao.viewCartDetails();
		return new ModelAndView("viewCart","cartlist",cart_list);
	}
	
	@RequestMapping("/placeOrder")
	public ModelAndView placeOrder() {
		cdao.clearCartDetails();
		return new ModelAndView("registration","message","Successfully Purchased the Products!");
	}
}
