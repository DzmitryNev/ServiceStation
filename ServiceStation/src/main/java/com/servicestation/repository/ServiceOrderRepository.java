package com.servicestation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.servicestation.model.Car;
import com.servicestation.model.ServiceOrder;

public interface ServiceOrderRepository extends JpaRepository<ServiceOrder, Long> {

	public List<ServiceOrder> findByCarId(Car carId);

	public List<ServiceOrder> findAllByOrderByDateDesc();

}
