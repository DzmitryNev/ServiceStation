package com.servicestation.service;

import java.math.BigDecimal;
import java.util.Date;
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

	public void save(Long carId, Date date, BigDecimal orderAmount, String orderStatus) {
		ServiceOrder order = new ServiceOrder();
		order.setCarId(getCar(carId));
		order.setDate(date);
		order.setOrderAmount(orderAmount);
		order.setOrderStatus(orderStatus);
		orderRepository.save(order);
	}

	public void delete(Long serviceOrderId) {
		orderRepository.delete(serviceOrderId);
	}

	public List<ServiceOrder> findAll() {
		return orderRepository.findAllByOrderByDateDesc();
	}

}
