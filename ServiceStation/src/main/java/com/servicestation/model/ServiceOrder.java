package com.servicestation.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "service_order")
public class ServiceOrder{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "service_order_id")
    private Long serviceOrderId;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
	@NotNull
    @Temporal(TemporalType.DATE)
    private Date date;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "order_amount")
    private BigDecimal orderAmount;
    @Basic(optional = false)
    @Column(name = "order_status")
    private String orderStatus;
    @JoinColumn(name = "car_id", referencedColumnName = "car_id")
    @ManyToOne(optional = false)
    private Car carId;

    public ServiceOrder() {
    }

    public ServiceOrder(Long serviceOrderId) {
        this.serviceOrderId = serviceOrderId;
    }

    public ServiceOrder(Long serviceOrderId, Date date, BigDecimal orderAmount, String orderStatus) {
        this.serviceOrderId = serviceOrderId;
        this.date = date;
        this.orderAmount = orderAmount;
        this.orderStatus = orderStatus;
    }

    public Long getServiceOrderId() {
        return serviceOrderId;
    }

    public void setServiceOrderId(Long serviceOrderId) {
        this.serviceOrderId = serviceOrderId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public BigDecimal getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(BigDecimal orderAmount) {
        this.orderAmount = orderAmount;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Car getCarId() {
        return carId;
    }

    public void setCarId(Car carId) {
        this.carId = carId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (serviceOrderId != null ? serviceOrderId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ServiceOrder)) {
            return false;
        }
        ServiceOrder other = (ServiceOrder) object;
        if ((this.serviceOrderId == null && other.serviceOrderId != null) || (this.serviceOrderId != null && !this.serviceOrderId.equals(other.serviceOrderId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.servicestation.model.ServiceOrder[ serviceOrderId=" + serviceOrderId + " ]";
    }
    
}
