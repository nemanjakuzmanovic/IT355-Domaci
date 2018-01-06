<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h2>Book Flight</h2>

<portlet:actionURL var="actionUrl">
	<portlet:param name="execution" value="${flowExecutionKey}" />
</portlet:actionURL>
<form:form id="booking" modelAttribute="booking" action="${actionUrl}">
		<spring:hasBindErrors name="booking">
			<div class="error">
				<spring:bind path="booking.*">
					<c:forEach items="${status.errorMessages}" var="error">
						<span><c:out value="${error}"/></span><br>
					</c:forEach>
				</spring:bind>
			</div>
		</spring:hasBindErrors>
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
			<tr class="field">
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
	            <td class="label">Nightly rate:</td>
	            <td class="output">
		        	<spring:bind path="booking.flight.price">${status.value}</spring:bind>
	            </td>
	        </tr>
			<tr class="field">
				<td class="label">
					<label for="departureDate">Departure Date:</label>
				</td>
				<td class="input">
					<form:errors path="departureDate" cssClass="errors"/>
					<form:input path="departureDate"/>
				</td>
			</tr>
			<tr class="field">
				<td class="label">
					<label for="returnDate">Return Date:</label>
				</td>
				<td class="input">
					<form:errors path="returnDate" cssClass="errors"/>
					<form:input path="returnDate"/>
				</td>
			</tr>
			<tr class="field">
				<td class="label">
					<label for="travelClass">Travel Class:</label>
				</td>
				<td class="input">
					<form:select id="beds" path="travelClass">
						<form:option label="First Class" value="1"/>
						<form:option label="Business Class" value="2"/>
						<form:option label="Economy Class" value="3"/>
					</form:select>
				</td>
			</tr>
			<tr class="field">
				<td class="label">
					<label for="wifi">Wifi Preference:</label>
				</td>
				<td class="input">
					<form:radiobutton id="smoking" path="wifi" label="Wifi" value="true"/>
					<form:radiobutton path="wifi" label="Non Wifi" value="false"/>
				</td>
			</tr>
			<tr class="field">
				<td class="label">
					<label for="creditCard">Credit Card #:</label>
				</td>
				<td class="input">
					<form:errors path="creditCard" cssClass="errors"/>
					<form:input id="creditCard" path="creditCard"/>
				</td>
			</tr>
			<tr class="field">
				<td class="label">
					<label for="creditCardName">Credit Card Name:</label>
				</td>
				<td class="input">
					<form:errors path="creditCardName" cssClass="errors"/>
					<form:input id="creditCardName" path="creditCardName"/>
				</td>
			</tr>
			<tr class="field">
				<td class="label">
					<label for="creditCardExpiryMonth">Expiration Date:</label>
				</td>
				<td class="input">
					<form:select id="creditCardExpiryMonth" path="creditCardExpiryMonth">
						<form:option label="Jan" value="1"/>
						<form:option label="Feb" value="2"/>
						<form:option label="Mar" value="3"/>
						<form:option label="Apr" value="4"/>
						<form:option label="May" value="5"/>
						<form:option label="Jun" value="6"/>
						<form:option label="Jul" value="7"/>
						<form:option label="Aug" value="8"/>
						<form:option label="Sep" value="9"/>
						<form:option label="Oct" value="10"/>
						<form:option label="Nov" value="11"/>
						<form:option label="Dec" value="12"/>
					</form:select>
					<form:select path="creditCardExpiryYear">
						<form:option label="2008" value="1"/>
						<form:option label="2009" value="2"/>
						<form:option label="2010" value="3"/>
						<form:option label="2011" value="4"/>
						<form:option label="2012" value="5"/>
					</form:select>
				</td>
			</tr>
			<tr class="field">
				<td colspan="2" class="buttonGroup">
					<input type="submit" name="_eventId_proceed" value="Proceed"/>&#160;
					<input type="submit" name="_eventId_cancel" value="Cancel"/>&#160;
				</td>
			</tr>
		</table>
	</fieldset>
</form:form>
