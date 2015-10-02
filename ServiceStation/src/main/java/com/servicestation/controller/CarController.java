package com.servicestation.controller;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.servicestation.model.Make;
import com.servicestation.model.Year;
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
	public String showCarAddForm(@PathVariable("clientId") Long clientId, Model model) {
		model.addAttribute("client", carService.getClient(clientId));
		return "carform";
	}

	@RequestMapping(value = "{clientId}", method = RequestMethod.POST)
	public String addCar(@PathVariable("clientId") Long clientId,
			@RequestParam(value = "yearId") Long yearId,
			@RequestParam(value = "makeId") Long makeId,
			@RequestParam(value = "modelId") Long modelId, 
			@RequestParam(value = "vin") String vin, Model model) {
		carService.save(clientId, yearId, makeId, modelId,vin);
		model.addAttribute("clientId", clientId);
		return "redirect:/cars/{clientId}";
	}

	@RequestMapping(value = "{clientId}/{carId}/delete")
	public String deleteCar(@PathVariable("clientId") Long clientId, @PathVariable("carId") Long carId, Model model) {
		carService.delete(carId);
		model.addAttribute("clientId", clientId);
		return "redirect:/cars/{clientId}";
	}

	
	@RequestMapping(value = "{clientId}/makes", method = RequestMethod.GET)
	public @ResponseBody String findMakesByYear(@PathVariable("clientId") Long clientId,
			@RequestParam(name = "year", required = true) Long yearId) {
		JSONArray makeArray = new JSONArray();
		for (Make make : carService.findMakesByYear(yearId)) {
			JSONObject makeJSON = new JSONObject();
			makeJSON.put("makeId", make.getMakeId());
			makeJSON.put("make", make.getMake());
			makeArray.put(makeJSON);
		}
		return makeArray.toString();
	}

	@RequestMapping(value = "{clientId}/years", method = RequestMethod.GET)
	public @ResponseBody String findAllYears(@PathVariable("clientId") Long clientId) {
		JSONArray yearArray = new JSONArray();
		for (Year year : carService.findAllYears()) {
			JSONObject yearJSON = new JSONObject();
			yearJSON.put("yearId", year.getYearId());
			yearJSON.put("year", year.getYear());
			yearArray.put(yearJSON);
		}
		return yearArray.toString();
	}


	@RequestMapping(value = "{clientId}/models", method = RequestMethod.GET)
	public @ResponseBody String findModelByMakeAndYear(@PathVariable("clientId") Long clientId,
			@RequestParam(name = "year", required = true) Long yearId,
			@RequestParam(name = "make", required = true) Long makeId) {
		JSONArray modelArray = new JSONArray();
		for (com.servicestation.model.Model model : carService.findModelsByMakeAndYear(yearId, makeId)) {
			JSONObject modelJSON = new JSONObject();
			modelJSON.put("modelId", model.getModelId());
			modelJSON.put("model", model.getModel());
			modelArray.put(modelJSON);
		}
		return modelArray.toString();
	}
	
	@RequestMapping(value = "{clientId}/{carId}/update", method=RequestMethod.GET)
	public String showCarUpdateForm(@PathVariable("clientId") Long clientId, 
			@PathVariable("carId") Long carId, Model model) {
		model.addAttribute("car", carService.getCar(carId));
		model.addAttribute("client", carService.getClient(clientId));
		return "carupdate";
	}

	@RequestMapping(value = "{clientId}/{carId}", method = RequestMethod.POST)
	public String updateCar(@PathVariable("clientId") Long clientId,
			@PathVariable("carId") Long carId,
			@RequestParam(value = "yearId") Long yearId,
			@RequestParam(value = "makeId") Long makeId,
			@RequestParam(value = "modelId") Long modelId, 
			@RequestParam(value = "vin") String vin, Model model) {
		carService.update(carId, yearId, makeId, modelId,vin);
		model.addAttribute("clientId", clientId);
		return "redirect:/cars/{clientId}";
	}
}
