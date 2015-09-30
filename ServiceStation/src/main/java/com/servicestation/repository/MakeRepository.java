package com.servicestation.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.servicestation.model.Make;

public interface MakeRepository extends JpaRepository<Make, Long> {

}
