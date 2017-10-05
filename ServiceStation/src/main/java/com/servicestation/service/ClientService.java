package com.servicestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.servicestation.model.Client;
import com.servicestation.repository.ClientRepository;

@Service
public class ClientService {
	@Autowired
	private ClientRepository clientRepository;

	public void save(Client client) {
		clientRepository.save(client);
	}

	public List<Client> findAll() {
		return clientRepository.findAll();
	}

	public List<Client> findClient(String firstName, String lastName) {
		
		return clientRepository.findByFirstNameAndLastName(firstName, lastName);
	}
}
