package com.servicestation.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.servicestation.model.Car;
import com.servicestation.model.Client;
import com.servicestation.model.ServiceOrder;
import com.servicestation.repository.CarRepository;
import com.servicestation.repository.ServiceOrderRepository;

@Controller
@RequestMapping("/orders")
public class OrderController {
	@Autowired
	private ServiceOrderRepository orderRepository;

	@Autowired
	private CarRepository carRepository;

	@RequestMapping(value = "{carId}", method = RequestMethod.GET)
	public String showOrder(@PathVariable("carId") Long carId, Model model) {
		Car car = carRepository.findOne(carId);
		model.addAttribute("car", car);
		model.addAttribute("orders", orderRepository.findByCarId(car));
		return "orders";
	}

	@RequestMapping(value = "{carId}/add", method = RequestMethod.GET)
	public String constructOrder(@PathVariable("carId") Long carId, Model model) {
		model.addAttribute("car", carRepository.findOne(carId));
		model.addAttribute("carId", carId);
		model.addAttribute("order", new ServiceOrder());
		return "orderform";
	}

	@RequestMapping(value = "{carId}/add", method = RequestMethod.POST)
	public String addOrder(@ModelAttribute ("order") ServiceOrder order, @ModelAttribute ("carId") Long carId, Model model) {
		

		return "orders";
	}

}
