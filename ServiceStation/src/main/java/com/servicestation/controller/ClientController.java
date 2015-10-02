package com.servicestation.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.servicestation.model.Client;
import com.servicestation.service.ClientService;

@Controller
@RequestMapping("/")
public class ClientController {

	@Autowired
	private ClientService clientService;

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
			clientService.save(client);
		}
		return "redirect:/clients";
	}

	@RequestMapping(value = {"/","clients"}, method = RequestMethod.GET)
	public String getClients(Model model) {
		model.addAttribute("clients", clientService.findAll());
		return "clients";
	}

	@RequestMapping(value = "clients", params = { "firstName", "lastName" }, method = RequestMethod.GET)
	public String showClients(@RequestParam String firstName, @RequestParam String lastName, Model model) {
		if (!firstName.isEmpty() && !lastName.isEmpty())
			model.addAttribute("clients", clientService.findClient(firstName, lastName));
		else
			model.addAttribute("clients", clientService.findAll());
		return "clients";
	}
}
