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
import com.servicestation.repository.ModelYearRepository;
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
	@Autowired
	private ModelYearRepository modelYearRepository;

	public Client getClient(Long clientId) {
		return clientRepository.findOne(clientId);
	}

	public List<Car> findByClientId(Long clientId) {
		return carRepository.findByClientId(getClient(clientId));
	}

	public List<Year> findAllYears() {
		return yearRepository.findAllByOrderByYearDesc();
	}

	public List<Make> findAllMakes() {
		return makeRepository.findAllByOrderByMakeAsc();
	}

	public List<Model> findAllModels() {
		return modelRepository.findAllByOrderByModelAsc();
	}

	public boolean delete(Long carId) {
		Car car = carRepository.findOne(carId);
		if (orderRepository.findByCarId(car).isEmpty()) {
			carRepository.delete(carId);
			return true;
		} else
			return false;

	}

	public List<Make> findMakesByYear(Long yearId) {
		return makeRepository.findByYearId(yearId);
	}

	public List<Model> findModelsByMakeAndYear(Long yearId, Long makeId) {
		return modelRepository.findByMakeIdAndYearId(makeId, yearId);
	}

	public void save(Long clientId, Long yearId, Long makeId, Long modelId,String vin) {
		Year year =yearRepository.findOne(yearId);
		Model model =modelRepository.findOne(modelId);
		Car car = new Car();
		car.setClientId(clientRepository.findOne(clientId));
		car.setModelYearId(modelYearRepository.findByYearIdAndModelId(year,model));
		car.setVin(vin);
		carRepository.save(car);
	}

	public Car getCar(Long carId) {
		return carRepository.findOne(carId);
	}

	public void update(Long carId, Long yearId, Long makeId, Long modelId, String vin) {
		Year year =yearRepository.findOne(yearId);
		Model model =modelRepository.findOne(modelId);
		Car car = carRepository.findOne(carId);
		car.setModelYearId(modelYearRepository.findByYearIdAndModelId(year,model));
		car.setVin(vin);
		carRepository.save(car);
		
	}

}
