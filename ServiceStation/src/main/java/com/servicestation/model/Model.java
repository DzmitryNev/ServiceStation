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

@Entity
public class Model {
	
	@Id
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="model_id")
	private Long modelId;

	private String model;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "modelId")
	private Collection<ModelYear> modelYearCollection;

	@JoinColumn(name = "make_id", referencedColumnName = "make_id")
	@ManyToOne
	private Make makeId;

	public Model() {
	}

	public Model(Long modelId) {
		this.modelId = modelId;
	}

	public Model(Long modelId, String model) {
		this.modelId = modelId;
		this.model = model;
	}

	public Long getModelId() {
		return modelId;
	}

	public void setModelId(Long modelId) {
		this.modelId = modelId;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Collection<ModelYear> getModelYearCollection() {
		return modelYearCollection;
	}

	public void setModelYearCollection(Collection<ModelYear> modelYearCollection) {
		this.modelYearCollection = modelYearCollection;
	}

	public Make getMakeId() {
		return makeId;
	}

	public void setMakeId(Make makeId) {
		this.makeId = makeId;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (modelId != null ? modelId.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Model)) {
			return false;
		}
		Model other = (Model) object;
		if ((this.modelId == null && other.modelId != null)
				|| (this.modelId != null && !this.modelId.equals(other.modelId))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "com.example.model.Model[ modelId=" + modelId + " ]";
	}

}
