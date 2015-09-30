package com.servicestation.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.servicestation.model.Car;
import com.servicestation.model.Client;
import com.servicestation.repository.CarRepository;
import com.servicestation.repository.ClientRepository;
import com.servicestation.repository.MakeRepository;
import com.servicestation.repository.ModelRepository;
import com.servicestation.repository.YearRepository;

@Controller
@RequestMapping("/")
public class ServiceStationController {
	@Autowired
	private ClientRepository clientRepository;

	@Autowired
	private CarRepository carRepository;

	@RequestMapping(value = "clients/add", method = RequestMethod.GET)
	public String constructClient(Model model) {
		model.addAttribute("client", new Client());
		return "clientform";
	}

	@RequestMapping(value = "clients", method = RequestMethod.POST)
	public String addClient(@ModelAttribute @Valid Client client, BindingResult result, Model model) {
		if (result.hasErrors())
			return "clientform";
		else {
			clientRepository.save(client);
		}
		return "redirect:/clients";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getClients(ModelMap model) {
		model.addAttribute("clients", clientRepository.findAll());
		return "clients";
	}

	@RequestMapping(value = "clients", method = RequestMethod.GET)
	public String showClients(Model model) {
		model.addAttribute("clients", clientRepository.findAll());
		return "clients";
	}

}
