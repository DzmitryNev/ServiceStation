package com.servicestation.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.servicestation.model.Year;

public interface YearRepository extends JpaRepository<Year, Long> {

}
