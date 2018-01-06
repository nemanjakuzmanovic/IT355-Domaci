<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<h2>Flight Results</h2>

<portlet:actionURL var="changeSearchUrl">
	<portlet:param name="execution" value="${flowExecutionKey}" />
	<portlet:param name="_eventId" value="changeSearch" />
</portlet:actionURL>
<a href="${changeSearchUrl}">Change Search</a>
	
<table class="summary">
	<thead>
		<tr>
			<th>Name</th>
			<th>From City</th>
			<th>From State</th>
			<th>To City</th>
			<th>To State</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="flight" items="${flights}">
			<tr>
				<td>${flight.name}</td>
				<td>${flight.fromCity}</td>
				<td>${flight.fromState}</td>
				<td>${flight.toCity}</td>
                                <td>${flight.toState}</td>
				<td>
					<portlet:actionURL var="actionUrl">
						<portlet:param name="execution" value="${flowExecutionKey}" />
						<portlet:param name="_eventId" value="select" />
						<portlet:param name="flightId" value="${flight.id}" />
					</portlet:actionURL>
					<a href="${actionUrl}">View Flight</a>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${empty flights}">
		<tr>
			<td colspan="5">No flights found</td>
		</tr>
		</c:if>
	</tbody>
</table>

<c:if test="${searchCriteria.page > 0}">
	<portlet:actionURL var="prevResultsUrl">
		<portlet:param name="execution" value="${flowExecutionKey}" />
		<portlet:param name="_eventId" value="previous" />
	</portlet:actionURL>
	<a href="${prevResultsUrl}">Previous Results</a>
</c:if>
<c:if test="${not empty flights && fn:length(flights) == searchCriteria.pageSize}">
	<portlet:actionURL var="moreResultsUrl">
		<portlet:param name="execution" value="${flowExecutionKey}" />
		<portlet:param name="_eventId" value="next" />
	</portlet:actionURL>
	<a href="${moreResultsUrl}">More Results</a>
</c:if>		

