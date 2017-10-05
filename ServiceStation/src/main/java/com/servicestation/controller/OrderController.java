package com.servicestation.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.servicestation.model.Car;
import com.servicestation.model.ServiceOrder;
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

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String showAllOrders(Model model) {
		model.addAttribute("orders", serviceOrderService.findAll());
		return "allorders";
	}
	
	@RequestMapping(value = "{carId}/add", method = RequestMethod.GET)
	public String showOrderAddForm(@PathVariable("carId") Long carId, Model model) {
		model.addAttribute("car", serviceOrderService.getCar(carId));
		model.addAttribute("order", new ServiceOrder());
		return "orderform";
	}

	@RequestMapping(value = "{carId}", method = RequestMethod.POST)
	public String addOrder(@PathVariable("carId") Long carId, @ModelAttribute("order") @Valid ServiceOrder order,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("car", serviceOrderService.getCar(carId));
			return "orderform";
		} else {
			serviceOrderService.save(order, carId);
			model.addAttribute("carId", carId);
			return "redirect:/orders/{carId}";
		}
	}

	@RequestMapping(value = "{carId}/{serviceOrderId}/delete")
	public String deleteOrder(@PathVariable("carId") Long carId, @PathVariable("serviceOrderId") Long serviceOrderId,
			Model model) {
		serviceOrderService.delete(serviceOrderId);
		model.addAttribute("carId", carId);
		return "redirect:/orders/{carId}";
	}

	@RequestMapping(value = "{carId}/{serviceOrderId}/update", method = RequestMethod.GET)
	public String showOrderUpdateForm(@PathVariable("carId") Long carId,
			@PathVariable("serviceOrderId") Long serviceOrderId, Model model) {
		model.addAttribute("car", serviceOrderService.getCar(carId));
		model.addAttribute("order", serviceOrderService.getServiceOrder(serviceOrderId));
		return "orderupdate";
	}

	@RequestMapping(value = "{carId}/{serviceOrderId}", method = RequestMethod.POST)
	public String updateOrder(@PathVariable("carId") Long carId, @PathVariable("serviceOrderId") Long serviceOrderId,
			@RequestParam(value = "orderStatus") String orderStatus) {
		serviceOrderService.updateStatus(serviceOrderId, orderStatus);
		return "redirect:/orders/{carId}";
	}

	@InitBinder("order")
	public void initBinder(WebDataBinder binder) {
		binder.setDisallowedFields(new String[] { "carId", "orderStatus" });
	}

}
