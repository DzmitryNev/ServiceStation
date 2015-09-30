package com.servicestation.model;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "model_year")
public class ModelYear {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "model_year_id")
	private Long modelYearId;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "modelYearId")
	private Collection<Car> carCollection;

	@JoinColumn(name = "model_id", referencedColumnName = "model_id")
	@ManyToOne(optional = false)
	private Model modelId;

	@JoinColumn(name = "year_id", referencedColumnName = "year_id")
	@ManyToOne(optional = false)
	private Year yearId;

	public ModelYear() {
	}

	public ModelYear(Long modelYearId) {
		this.modelYearId = modelYearId;
	}

	public Long getModelYearId() {
		return modelYearId;
	}

	public void setModelYearId(Long modelYearId) {
		this.modelYearId = modelYearId;
	}

	public Collection<Car> getCarCollection() {
		return carCollection;
	}

	public void setCarCollection(Collection<Car> carCollection) {
		this.carCollection = carCollection;
	}

	public Model getModelId() {
		return modelId;
	}

	public void setModelId(Model modelId) {
		this.modelId = modelId;
	}

	public Year getYearId() {
		return yearId;
	}

	public void setYearId(Year yearId) {
		this.yearId = yearId;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (modelYearId != null ? modelYearId.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof ModelYear)) {
			return false;
		}
		ModelYear other = (ModelYear) object;
		if ((this.modelYearId == null && other.modelYearId != null)
				|| (this.modelYearId != null && !this.modelYearId.equals(other.modelYearId))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "com.example.model.ModelYear[ modelYearId=" + modelYearId + " ]";
	}

}
