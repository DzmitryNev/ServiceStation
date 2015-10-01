package com.servicestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.servicestation.model.Car;
import com.servicestation.model.Client;
import com.servicestation.model.Make;
import com.servicestation.model.Model;
import com.servicestation.model.Year;
import com.servicestation.repository.CarRepository;
import com.servicestation.repository.ClientRepository;
import com.servicestation.repository.MakeRepository;
import com.servicestation.repository.ModelRepository;
import com.servicestation.repository.ServiceOrderRepository;
import com.servicestation.repository.YearRepository;

@Service
public class CarService {
	@Autowired
	private ServiceOrderRepository orderRepository;
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

	public Client getClient(Long clientId) {
		return clientRepository.findOne(clientId);
	}

	public List<Car> findByClientId(Long clientId) {
		return carRepository.findByClientId(getClient(clientId));
	}

	public List<Year> findAllYears() {
		return yearRepository.findAll();
	}

	public List<Make> findAllMakes() {
		return makeRepository.findAll();
	}

	public List<Model> findAllModels() {
		return modelRepository.findAll();
	}

	public boolean delete(Long carId) {
		Car car = carRepository.findOne(carId);
		if (orderRepository.findByCarId(car).isEmpty()) {
			carRepository.delete(carId);
			return true;
		} else
			return false;
		
	}

}
