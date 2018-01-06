package org.springframework.webflow.samples.booking;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * A Flight Booking made by a User.
 */
@Entity
@BookingDateRange
public class Booking implements Serializable {
    private Long id;

    private User user;

    private Flight flight;

    @DateTimeFormat(pattern = "MM-dd-yyyy")
    private Date departureDate;

    @DateTimeFormat(pattern = "MM-dd-yyyy")
    private Date returnDate;

    private String creditCard;

    private String creditCardName;

    private int creditCardExpiryMonth;

    private int creditCardExpiryYear;

    private boolean wifi;

    private int travelClass;

    public Booking() {
	Calendar calendar = Calendar.getInstance();
	calendar.add(Calendar.DAY_OF_MONTH, 1);
	setDepartureDate(calendar.getTime());
	calendar.add(Calendar.DAY_OF_MONTH, 1);
	setReturnDate(calendar.getTime());
    }

    public Booking(Flight flight, User user) {
	this();
	this.flight = flight;
	this.user = user;
    }

    @Transient
    public BigDecimal getTotal() {
	return flight.getPrice().multiply(new BigDecimal(getNights()));
    }

    @Transient
    public int getNights() {
	return (int) (returnDate.getTime() - departureDate.getTime()) / 1000 / 60 / 60 / 24;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    @Basic
    @Temporal(TemporalType.DATE)
    @NotNull
    @Future
    public Date getDepartureDate() {
	return departureDate;
    }

    public void setDepartureDate(Date datetime) {
	this.departureDate = datetime;
    }

    @ManyToOne
    public Flight getFlight() {
	return flight;
    }

    public void setFlight(Flight flight) {
	this.flight = flight;
    }

    @ManyToOne
    public User getUser() {
	return user;
    }

    public void setUser(User user) {
	this.user = user;
    }

    @Basic
    @Temporal(TemporalType.DATE)
    @NotNull
    @Future
    public Date getReturnDate() {
	return returnDate;
    }

    public void setReturnDate(Date returnDate) {
	this.returnDate = returnDate;
    }

    @NotEmpty
    public String getCreditCard() {
	return creditCard;
    }

    public void setCreditCard(String creditCard) {
	this.creditCard = creditCard;
    }

    @Transient
    public String getDescription() {
	DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
	return flight == null ? null : flight.getName() + ", " + df.format(getDepartureDate()) + " to "
		+ df.format(getReturnDate());
    }

    public boolean isWifi() {
	return wifi;
    }

    public void setWifi(boolean wifi) {
	this.wifi = wifi;
    }

    public int getTravelClass() {
	return travelClass;
    }

    public void setTravelClass(int travelClass) {
	this.travelClass = travelClass;
    }

    @NotEmpty
    public String getCreditCardName() {
	return creditCardName;
    }

    public void setCreditCardName(String creditCardName) {
	this.creditCardName = creditCardName;
    }

    public int getCreditCardExpiryMonth() {
	return creditCardExpiryMonth;
    }

    public void setCreditCardExpiryMonth(int creditCardExpiryMonth) {
	this.creditCardExpiryMonth = creditCardExpiryMonth;
    }

    public int getCreditCardExpiryYear() {
	return creditCardExpiryYear;
    }

    public void setCreditCardExpiryYear(int creditCardExpiryYear) {
	this.creditCardExpiryYear = creditCardExpiryYear;
    }

    @Override
    public String toString() {
	return "Booking(" + user + "," + flight + ")";
    }

}
