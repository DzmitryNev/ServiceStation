package com.servicestation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.servicestation.model.Client;

public interface ClientRepository extends JpaRepository<Client,Long>{
	public List<Client> findByFirstNameAndLastName(String firstName, String lastName);

}
