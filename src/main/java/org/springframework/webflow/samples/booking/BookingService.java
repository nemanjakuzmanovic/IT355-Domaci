package org.springframework.webflow.samples.booking;

import java.util.List;

/**
 * A service interface for retrieving flights and bookings from a backing repository. Also supports the ability to cancel
 * a booking.
 */
public interface BookingService {

    /**
     * Find user by their username.
     * @param username the user's username
     * @return the user
     */
    public User findUser(String username);

    /**
     * Find bookings made by the given user
     * @param username the user's name
     * @return their bookings
     */
    public List<Booking> findBookings(String username);

    /**
     * Find flights available for booking by some criteria.
     * @param criteria the search criteria
     * @return a list of flights meeting the criteria
     */
    public List<Flight> findFlights(SearchCriteria criteria);

    /**
     * Find flights by their identifier.
     * @param id the flight id
     * @return the flight
     */
    public Flight findFlightById(Long id);

    /**
     * Create a new, transient flight booking instance for the given user.
     * @param flightId the flightId
     * @param userName the user name
     * @return the new transient booking instance
     */
    public Booking createBooking(Long flightId, String userName);

    /**
     * Persist the booking to the database
     * @param booking the booking
     */
    public void persistBooking(Booking booking);

    /**
     * Cancel an existing booking.
     * @param id the booking id
     */
    public void cancelBooking(Long id);

}
