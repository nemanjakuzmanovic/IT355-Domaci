package org.springframework.webflow.samples.booking;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * A flight where users may book flight.
 */
@Entity
public class Flight implements Serializable {
    private Long id;

    private String name;

    private String fromCity;

    private String fromState;

    private String toCity;

    private String toState;

    private BigDecimal price;

    @Id
    @GeneratedValue
    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getFromCity() {
	return fromCity;
    }

    public void setFromCity(String fromCity) {
	this.fromCity = fromCity;
    }

    public String getFromState() {
	return fromState;
    }

    public void setFromState(String fromState) {
	this.fromState = fromState;
    }

    public String getToCity() {
	return toCity;
    }

    public void setToCity(String toCity) {
	this.toCity = toCity;
    }

    public String getToState() {
	return toState;
    }

    public void setToState(String toState) {
	this.toState = toState;
    }

    @Column(precision = 6, scale = 2)
    public BigDecimal getPrice() {
	return price;
    }

    public void setPrice(BigDecimal price) {
	this.price = price;
    }

    public Booking createBooking(User user) {
	return new Booking(this, user);
    }

    @Override
    public String toString() {
	return "Flight(" + name + "," + fromCity + "," + fromState + "," + toCity + "," + toState +")";
    }
}
