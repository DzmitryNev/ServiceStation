package com.servicestation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.servicestation.model.Year;

public interface YearRepository extends JpaRepository<Year, Long> {
	public List<Year> findAllByOrderByYearDesc();
}
