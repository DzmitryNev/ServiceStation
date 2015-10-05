package com.servicestation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.servicestation.model.Car;
import com.servicestation.model.ServiceOrder;
import com.servicestation.repository.CarRepository;
import com.servicestation.repository.ServiceOrderRepository;

@Service
public class ServiceOrderService {
	@Autowired
	private ServiceOrderRepository orderRepository;

	@Autowired
	private CarRepository carRepository;

	public List<ServiceOrder> findByCarId(Long carId) {
		return orderRepository.findByCarId(getCar(carId));
	}

	public Car getCar(Long carId) {
		return carRepository.findOne(carId);
	}

	public void delete(Long serviceOrderId) {
		orderRepository.delete(serviceOrderId);
	}

	public List<ServiceOrder> findAll() {
		return orderRepository.findAllByOrderByDateDesc();
	}

	public ServiceOrder getServiceOrder(Long serviceOrderId) {
		return orderRepository.findOne(serviceOrderId);
	}

	public void updateStatus(Long serviceOrderId, String orderStatus) {
		ServiceOrder order = orderRepository.findOne(serviceOrderId);
		order.setOrderStatus(orderStatus);
		orderRepository.save(order);
	}

	public void save(ServiceOrder order, Long carId) {
		order.setCarId(carRepository.findOne(carId));
		order.setOrderStatus("In Progress");
		orderRepository.save(order);		
	}

}
