package com.servicestation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.servicestation.model.Car;
import com.servicestation.model.Client;

public interface CarRepository extends JpaRepository<Car, Long>{
	public List<Car> findByClientId(Client clientId);
}
