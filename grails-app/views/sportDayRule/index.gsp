
<%@ page import="com.chinaairdome.SportDayRule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sportDayRule.label', default: 'SportDayRule')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sportDayRule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sportDayRule" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="cost" title="${message(code: 'sportDayRule.cost.label', default: 'Cost')}" />
					
						<th><g:message code="sportDayRule.sport.label" default="Sport" /></th>
					
						<g:sortableColumn property="timeFrom" title="${message(code: 'sportDayRule.timeFrom.label', default: 'Time From')}" />
					
						<g:sortableColumn property="timeTo" title="${message(code: 'sportDayRule.timeTo.label', default: 'Time To')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${sportDayRuleInstanceList}" status="i" var="sportDayRuleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sportDayRuleInstance.id}">${fieldValue(bean: sportDayRuleInstance, field: "cost")}</g:link></td>
					
						<td>${fieldValue(bean: sportDayRuleInstance, field: "sport")}</td>
					
						<td>${fieldValue(bean: sportDayRuleInstance, field: "timeFrom")}</td>
					
						<td>${fieldValue(bean: sportDayRuleInstance, field: "timeTo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sportDayRuleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
