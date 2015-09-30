package com.servicestation.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.servicestation.model.Model;

public interface ModelRepository extends JpaRepository<Model, Long>{

}
