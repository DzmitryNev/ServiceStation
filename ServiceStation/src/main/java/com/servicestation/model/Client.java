package com.servicestation.model;

import java.util.List;
import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Client implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="client_id")
	private Long clientId;

	@Size(min=2,max=30)
	@Column(name="first_name")
	private String firstName;
	
	@Size(min=2,max=30)
	@Column(name="last_name")
	private String lastName;

	@DateTimeFormat(pattern="yyyy-MM-dd")
	@NotNull @Past
	@Temporal(TemporalType.DATE)
	@Column(name= "date_of_birth")
	private Date dateOfBirth;

	@Size(min=2,max=45)
	private String address;

	
	private String phone;

	@NotEmpty @Email	
	private String email;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "clientId")
	private List<Car> carList;

	public Client() {
	}

	public Client(Long clientId) {
		this.clientId = clientId;
	}

	public Client(Long clientId, String firstName, String lastName, Date dateOfBirth, String address, String phone,
			String email) {
		this.clientId = clientId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.address = address;
		this.phone = phone;
		this.email = email;
	}

	public Long getClientId() {
		return clientId;
	}

	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Car> getCarList() {
		return carList;
	}

	public void setCarList(List<Car> carList) {
		this.carList = carList;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (clientId != null ? clientId.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Client)) {
			return false;
		}
		Client other = (Client) object;
		if ((this.clientId == null && other.clientId != null)
				|| (this.clientId != null && !this.clientId.equals(other.clientId))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "com.example.model.Client[ clientId=" + clientId + " ]";
	}

}
