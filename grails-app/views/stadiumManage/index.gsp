
<%@ page import="com.chinaairdome.StadiumManage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stadiumManage.label', default: 'StadiumManage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-stadiumManage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-stadiumManage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'stadiumManage.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="dateEnd" title="${message(code: 'stadiumManage.dateEnd.label', default: 'Date End')}" />
					
						<g:sortableColumn property="dateStart" title="${message(code: 'stadiumManage.dateStart.label', default: 'Date Start')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'stadiumManage.lastUpdated.label', default: 'Last Updated')}" />
					
						<th><g:message code="stadiumManage.sportDayRule.label" default="Sport Day Rule" /></th>
					
						<th><g:message code="stadiumManage.stadium.label" default="Stadium" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stadiumManageInstanceList}" status="i" var="stadiumManageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stadiumManageInstance.id}">${fieldValue(bean: stadiumManageInstance, field: "dateCreated")}</g:link></td>
					
						<td><g:formatDate date="${stadiumManageInstance.dateEnd}" /></td>
					
						<td><g:formatDate date="${stadiumManageInstance.dateStart}" /></td>
					
						<td><g:formatDate date="${stadiumManageInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: stadiumManageInstance, field: "sportDayRule")}</td>
					
						<td>${fieldValue(bean: stadiumManageInstance, field: "stadium")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stadiumManageInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
