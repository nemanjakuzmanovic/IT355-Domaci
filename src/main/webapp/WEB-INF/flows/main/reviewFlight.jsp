<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h2>View Flight</h2>

<portlet:actionURL var="actionUrl">
	<portlet:param name="execution" value="${flowExecutionKey}" />
</portlet:actionURL>
<form:form id="flight" modelAttribute="flight" action="${actionUrl}">
	<input type="hidden" name="execution" value="${flowExecutionKey}" />
	<fieldset>
		<table>
			<tr class="field">
				<td class="label">Name:</td>
				<td class="output">${flight.name}</td>
			</tr>
			<tr class="field">
				<td class="label">From City:</td>
				<td class="output">${flight.fromCity}</td>
			</tr>
			<tr class="field">
				<td class="label">From State:</td>
				<td class="output">${flight.fromState}</td>
			</tr>
			<tr class="field">
				<td class="label">To City:</td>
				<td class="output">${flight.toCity}</td>
			</tr>
			<tr class="field">
				<td class="label">To State:</td>
				<td class="output">${flight.toState}</td>
			</tr>
			
		    <tr class="field">
		        <td class="label">Nightly rate:</td>
		        <td class="output">
		        	<spring:bind path="price">${status.value}</spring:bind>
		        </td>
		    </tr>
			<tr class="field">
				<td colspan="2" class="buttonGroup">
					<input type="submit" name="_eventId_book" value="Book Flight"/>&#160;
					<input type="submit" name="_eventId_cancel" value="Back to Search"/>&#160;
				</td>
			</tr>
		</table>
	</fieldset>
</form:form>
