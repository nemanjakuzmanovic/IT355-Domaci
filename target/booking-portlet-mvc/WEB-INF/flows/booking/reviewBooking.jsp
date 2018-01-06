<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h2>Confirm Flight Booking</h2>

<portlet:actionURL var="actionUrl">
	<portlet:param name="execution" value="${flowExecutionKey}" />
</portlet:actionURL>
<form:form id="confirm" modelAttribute="booking" action="${actionUrl}">
	<fieldset>
		<table>
			<tr class="field">
				<td class="label">Name:</td>
				<td class="output">${booking.flight.name}</td>
			</tr>
			<tr class="field">
				<td class="label">From City:</td>
				<td class="output">${booking.flight.fromCity}</td>
			</tr>
			<tr>
				<td class="label">From State:</td>
				<td class="output">${booking.flight.fromState}</td>
			</tr>
			<tr class="field">
				<td class="label">To City:</td>
				<td class="output">${booking.flight.toCity}</td>
			</tr>
			<tr class="field">
				<td class="label">To State:</td>
				<td class="output">${booking.flight.toState}</td>
			</tr>
	        <tr class="field">
	            <td class="label">Total payment:</td>
	            <td class="output">
	            	<spring:bind path="total">${status.value}</spring:bind>
	            </td>
	        </tr>
			<tr class="field">
				<td class="label">Departure Date:</td>
				<td class="output">
					<spring:bind path="departureDate">${status.value}</spring:bind>
				</td>
			</tr>
			<tr class="field">
				<td class="label">Return Date:</td>
				<td class="output">
					<spring:bind path="returnDate">${status.value}</spring:bind>
				</td>
			</tr>
			<tr class="field">
				<td class="label">Credit Card #:</td>
				<td class="output">${booking.creditCard}</td>
			</tr>
			<tr>
				<td colspan="2" class="buttonGroup">
					<input type="submit" name="_eventId_confirm" value="Confim"/>&#160;
					<input type="submit" name="_eventId_revise" value="Revise"/>&#160;
					<input type="submit" name="_eventId_cancel" value="Cancel"/>&#160;
				</td>
			</tr>
		</table>
	</fieldset>
</form:form>
