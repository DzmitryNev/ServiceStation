package com.servicestation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.servicestation.model.Make;

public interface MakeRepository extends JpaRepository<Make, Long> {
	public List<Make> findAllByOrderByMakeAsc();

	public final static String FIND_BY_YEAR = "SELECT distinct mk FROM Year y JOIN y.modelYearList my "
			+ "JOIN my.modelId ml JOIN ml.makeId mk WHERE y.yearId = :yearId";

	@Query(FIND_BY_YEAR)
	public List<Make> findByYearId(@Param("yearId") Long yearId);
}
