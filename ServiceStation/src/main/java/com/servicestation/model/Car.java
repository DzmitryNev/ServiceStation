package com.servicestation.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
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
import javax.validation.constraints.Pattern;

@Entity
@Table(name = "car")
public class Car implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "car_id")
    private Long carId;
    
    @Pattern(regexp = "[A-HJ-NPR-Z0-9]{17}")
    @Basic(optional = false)
    @Column(name = "vin")
    private String vin;
    @JoinColumn(name = "client_id", referencedColumnName = "client_id")
    @ManyToOne(optional = false)
    private Client clientId;
    @JoinColumn(name = "model_year_id", referencedColumnName = "model_year_id")
    @ManyToOne(optional = false)
    private ModelYear modelYearId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "carId")
    private List<ServiceOrder> serviceOrderList;

    public Car() {
    }

    public Car(Long carId) {
        this.carId = carId;
    }

    public Car(Long carId, String vin) {
        this.carId = carId;
        this.vin = vin;
    }

    public Long getCarId() {
        return carId;
    }

    public void setCarId(Long carId) {
        this.carId = carId;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public Client getClientId() {
        return clientId;
    }

    public void setClientId(Client clientId) {
        this.clientId = clientId;
    }

    public ModelYear getModelYearId() {
        return modelYearId;
    }

    public void setModelYearId(ModelYear modelYearId) {
        this.modelYearId = modelYearId;
    }

    public List<ServiceOrder> getServiceOrderList() {
        return serviceOrderList;
    }

    public void setServiceOrderList(List<ServiceOrder> serviceOrderList) {
        this.serviceOrderList = serviceOrderList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (carId != null ? carId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Car)) {
            return false;
        }
        Car other = (Car) object;
        if ((this.carId == null && other.carId != null) || (this.carId != null && !this.carId.equals(other.carId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.servicestation.model.Car[ carId=" + carId + " ]";
    }
    
}
