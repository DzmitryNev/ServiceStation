package com.servicestation.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Make implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="make_id")
	private Long makeId;

	private String make;

	@OneToMany(mappedBy = "makeId")
	private List<Model> modelList;

	public Make() {
	}

	public Make(Long makeId) {
		this.makeId = makeId;
	}

	public Make(Long makeId, String make) {
		this.makeId = makeId;
		this.make = make;
	}

	public Long getMakeId() {
		return makeId;
	}

	public void setMakeId(Long makeId) {
		this.makeId = makeId;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public List<Model> getModelList() {
		return modelList;
	}

	public void setModelList(List<Model> modelList) {
		this.modelList = modelList;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (makeId != null ? makeId.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Make)) {
			return false;
		}
		Make other = (Make) object;
		if ((this.makeId == null && other.makeId != null)
				|| (this.makeId != null && !this.makeId.equals(other.makeId))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "com.example.model.Make[ makeId=" + makeId + " ]";
	}

}
