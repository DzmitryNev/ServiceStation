package com.servicestation.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.servicestation.model.Model;
import com.servicestation.model.ModelYear;
import com.servicestation.model.Year;

public interface ModelYearRepository extends JpaRepository<ModelYear,Long>{

	ModelYear findByYearIdAndModelId(Year year, Model model);

}
