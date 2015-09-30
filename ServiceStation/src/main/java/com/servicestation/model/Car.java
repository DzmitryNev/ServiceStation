package com.servicestation.model;

import java.util.Collection;

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
public class Car {
    
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
    private Collection<ServiceOrder> serviceOrderCollection;

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

    public Collection<ServiceOrder> getServiceOrderCollection() {
        return serviceOrderCollection;
    }

    public void setServiceOrderCollection(Collection<ServiceOrder> serviceOrderCollection) {
        this.serviceOrderCollection = serviceOrderCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (carId != null ? carId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
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
