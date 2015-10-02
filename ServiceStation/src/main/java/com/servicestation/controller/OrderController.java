package com.servicestation.controller;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.servicestation.service.ServiceOrderService;

@Controller
@RequestMapping("/orders")
public class OrderController {
	@Autowired
	ServiceOrderService serviceOrderService;

	@RequestMapping(value = "{carId}", method = RequestMethod.GET)
	public String showOrder(@PathVariable("carId") Long carId, Model model) {
		model.addAttribute("car", serviceOrderService.getCar(carId));
		model.addAttribute("orders", serviceOrderService.findByCarId(carId));
		return "orders";
	}

	@RequestMapping(value = "{carId}/add", method = RequestMethod.GET)
	public String constructOrder(@PathVariable("carId") Long carId, Model model) {
		model.addAttribute("car", serviceOrderService.getCar(carId));
		return "orderform";
	}
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String showAllOrders(Model model) {
		model.addAttribute("orders", serviceOrderService.findAll());
		return "allorders";
	}

	@RequestMapping(value = "{carId}", method = RequestMethod.POST)
	public String addOrder(@PathVariable("carId") Long carId,
			@DateTimeFormat(pattern = "yyyy-MM-dd") @RequestParam(value = "date") Date date,
			@RequestParam(value = "orderAmount") BigDecimal orderAmount,
			@RequestParam(value = "orderStatus") String orderStatus, Model model) {
		serviceOrderService.save(carId, date, orderAmount, orderStatus);
		model.addAttribute("carId", carId);
		return "redirect:/orders/{carId}";
	}

	@RequestMapping(value = "{carId}/{serviceOrderId}", params = "_method=delete")
	public String deleteOrder(@PathVariable("carId") Long carId, @PathVariable("serviceOrderId") Long serviceOrderId,
			Model model) {

		serviceOrderService.delete(serviceOrderId);
		model.addAttribute("carId", carId);
		return "redirect:/orders/{carId}";

	}

}
