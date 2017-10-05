package com.servicestation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.servicestation.model.Model;

public interface ModelRepository extends JpaRepository<Model, Long>{
	public List<Model> findAllByOrderByModelAsc();
	
	public final static String FIND_BY_MAKE_AND_YEAR = "SELECT ml FROM Year y "
			+ "JOIN y.modelYearList my "
			+ "JOIN my.modelId ml "
			+ "JOIN ml.makeId mk "
			+ " WHERE mk.makeId = :makeId AND y.yearId= :yearId";

	@Query(FIND_BY_MAKE_AND_YEAR)
	public List<Model> findByMakeIdAndYearId(@Param("makeId") Long makeId, @Param("yearId") Long yearId);
}



;