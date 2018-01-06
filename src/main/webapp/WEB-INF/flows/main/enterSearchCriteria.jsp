<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<portlet:actionURL var="actionUrl">
	<portlet:param name="execution" value="${flowExecutionKey}" />
</portlet:actionURL>
<form:form modelAttribute="searchCriteria" action="${actionUrl}">
	<h2>Search Flights</h2>
    <span class="errors">
    	<form:errors path="*"/>
    </span>
	<fieldset> 
		<label for="searchString">Search For:</label>
		<form:input path="searchString"/>
		<label for="pageSize">Maximum results:</label>
		<form:select path="pageSize">
			<form:option label="5" value="5"/>
			<form:option label="10" value="10"/>
			<form:option label="20" value="20"/>
		</form:select>
		<input type="submit" class="button" name="_eventId_search" value="Find Flights" />
    </fieldset>
</form:form>

<h2>Current Flight Bookings</h2>
<table class="summary">
	<thead>
		<tr>
			<th>Name</th>
			<th>From City</th>
			<th>From State</th>
                        <th>To City</th>
			<th>To State</th>
			<th>Departure Date</th>
			<th>Return Date</th>
			<th>Confirmation Number</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="booking" items="${bookings}">
			<tr>
				<td>${booking.flight.name}</td>
				<td>${booking.flight.fromCity}</td>
				<td>${booking.flight.fromState}</td>
				<td>${booking.flight.toCity}</td>
				<td>${booking.flight.toState}</td>
				<td>${booking.departureDate}</td>
				<td>${booking.returnDate}</td>
				<td>${booking.id}</td>
				<td>
					<portlet:actionURL var="actionUrl">
						<portlet:param name="execution" value="${flowExecutionKey}" />
						<portlet:param name="_eventId" value="cancelBooking" />
						<portlet:param name="bookingId" value="${booking.id}" />
					</portlet:actionURL>
					<a href="${actionUrl}">Cancel</a>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${empty bookings}">
		<tr>
			<td colspan="7">No booking history</td>
		</tr>
		</c:if>
	</tbody>
</table>
