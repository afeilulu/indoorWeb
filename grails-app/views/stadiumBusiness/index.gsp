
<%@ page import="com.chinaairdome.StadiumBusiness" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stadiumBusiness.label', default: 'StadiumBusiness')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-stadiumBusiness" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-stadiumBusiness" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="date" title="${message(code: 'stadiumBusiness.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'stadiumBusiness.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'stadiumBusiness.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="placeStatus" title="${message(code: 'stadiumBusiness.placeStatus.label', default: 'Place Status')}" />
					
						<th><g:message code="stadiumBusiness.stadiumManage.label" default="Stadium Manage" /></th>
					
						<g:sortableColumn property="timeFrom" title="${message(code: 'stadiumBusiness.timeFrom.label', default: 'Time From')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stadiumBusinessInstanceList}" status="i" var="stadiumBusinessInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stadiumBusinessInstance.id}">${fieldValue(bean: stadiumBusinessInstance, field: "date")}</g:link></td>
					
						<td><g:formatDate date="${stadiumBusinessInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${stadiumBusinessInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: stadiumBusinessInstance, field: "placeStatus")}</td>
					
						<td>${fieldValue(bean: stadiumBusinessInstance, field: "stadiumManage")}</td>
					
						<td>${fieldValue(bean: stadiumBusinessInstance, field: "timeFrom")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stadiumBusinessInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
