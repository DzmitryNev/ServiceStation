package com.servicestation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.servicestation.model.Car;
import com.servicestation.service.CarService;

@Controller
@RequestMapping("/cars")
public class CarController {
	@Autowired
	private CarService carService;

	@RequestMapping(value = "{clientId}", method = RequestMethod.GET)
	public String showCars(@PathVariable("clientId") Long clientId, Model model) {
		model.addAttribute("client", carService.getClient(clientId));
		model.addAttribute("cars", carService.findByClientId(clientId));
		return "cars";
	}

	@RequestMapping(value = "{clientId}/add", method = RequestMethod.GET)
	public String constructCar(@PathVariable("clientId") Long clientId, Model model) {
		// carService.save();
		Car car = new Car();
		model.addAttribute("car", car);
		model.addAttribute("client", carService.getClient(clientId));
		model.addAttribute("years", carService.findAllYears());
		model.addAttribute("makes", carService.findAllMakes());
		model.addAttribute("models", carService.findAllModels());
		return "carform";
	}

	@RequestMapping(value = "{clientId}/{carId}", params = "_method=delete")
	public String deleteCar(@PathVariable("clientId") Long clientId, @PathVariable("carId") Long carId, Model model) {
		carService.delete(carId);
		model.addAttribute("clientId", clientId);
		return "redirect:/cars/{clientId}";
	}

}
