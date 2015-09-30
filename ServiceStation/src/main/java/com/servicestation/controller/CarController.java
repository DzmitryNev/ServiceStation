package com.servicestation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.servicestation.model.Car;
import com.servicestation.model.Client;
import com.servicestation.repository.CarRepository;
import com.servicestation.repository.ClientRepository;
import com.servicestation.repository.MakeRepository;
import com.servicestation.repository.ModelRepository;
import com.servicestation.repository.YearRepository;

@Controller
@RequestMapping("/cars")
public class CarController {
	@Autowired
	private ClientRepository clientRepository;

	@Autowired
	private CarRepository carRepository;

	@Autowired
	private MakeRepository makeRepository;

	@Autowired
	private ModelRepository modelRepository;

	@Autowired
	private YearRepository yearRepository;

	@RequestMapping(value = "{clientId}", method = RequestMethod.GET)
	public String showCars(@PathVariable("clientId") Long clientId, Model model) {
		Client client = clientRepository.findOne(clientId);
		model.addAttribute("client", client);
		model.addAttribute("cars", carRepository.findByClientId(client));
		return "cars";
	}

	@RequestMapping(value = "{clientId}/add", method = RequestMethod.GET)
	public String constructCar(@PathVariable("clientId") Long clientId, Model model) {
		Car car = new Car();
		model.addAttribute("car", car);
		model.addAttribute("client", clientRepository.findOne(clientId));
		model.addAttribute("years", yearRepository.findAll());
		model.addAttribute("makes", makeRepository.findAll());
		model.addAttribute("models", modelRepository.findAll());
		return "carform";
	}
	@RequestMapping(value = "${car.carId}/delete", method = RequestMethod.POST)
	public String deleteCar(@PathVariable("carId") Long carId, Model model) {
		Car car = carRepository.findOne(carId);
		Long clientId = car.getClientId().getClientId();
		carRepository.delete(carId);
		model.addAttribute("clientId", clientId);
		return "redirect:cars";
	}
}
