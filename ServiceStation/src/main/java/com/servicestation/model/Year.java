package com.servicestation.model;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Year {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="year_id")
	private Long yearId;

	private int year;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "yearId")
	private Collection<ModelYear> modelYearCollection;

	public Year() {
	}

	public Year(Long yearId) {
		this.yearId = yearId;
	}

	public Year(Long yearId, int year) {
		this.yearId = yearId;
		this.year = year;
	}

	public Long getYearId() {
		return yearId;
	}

	public void setYearId(Long yearId) {
		this.yearId = yearId;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public Collection<ModelYear> getModelYearCollection() {
		return modelYearCollection;
	}

	public void setModelYearCollection(Collection<ModelYear> modelYearCollection) {
		this.modelYearCollection = modelYearCollection;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (yearId != null ? yearId.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Year)) {
			return false;
		}
		Year other = (Year) object;
		if ((this.yearId == null && other.yearId != null)
				|| (this.yearId != null && !this.yearId.equals(other.yearId))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "com.example.model.Year[ yearId=" + yearId + " ]";
	}

}
