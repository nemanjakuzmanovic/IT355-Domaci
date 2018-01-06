package org.springframework.webflow.samples.booking;

import java.util.Calendar;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class BookingValidator implements Validator {

    public boolean supports(Class clazz) {
	return Booking.class.equals(clazz);
    }

    public void validate(Object obj, Errors errors) {
	Booking booking = (Booking) obj;
	Calendar calendar = Calendar.getInstance();
	calendar.add(Calendar.DAY_OF_MONTH, -1);
	if (booking.getCreditCard() == null || "".equals(booking.getCreditCard())) {
	    errors.rejectValue("creditCard", null, "Credit card number must be provided");
	}
	if (booking.getCreditCardName() == null || "".equals(booking.getCreditCardName())) {
	    errors.rejectValue("creditCardName", null, "Credit card name must be provided");
	}
	if (booking.getDepartureDate() == null || booking.getDepartureDate().before(calendar.getTime())) {
	    errors.rejectValue("departureDate", null, "Departure date must be a future date");
	} else if (booking.getReturnDate()== null || !booking.getDepartureDate().before(booking.getReturnDate())) {
	    errors.rejectValue("returnDate", null, "Return date must be later than departure date");
	}
    }

}
