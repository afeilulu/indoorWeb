
<%@ page import="com.chinaairdome.SportDayRule" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sportDayRule.label', default: 'SportDayRule')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sportDayRule" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-sportDayRule" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sportDayRule">
			
				<g:if test="${sportDayRuleInstance?.cost}">
				<li class="fieldcontain">
					<span id="cost-label" class="property-label"><g:message code="sportDayRule.cost.label" default="Cost" /></span>
					
						<span class="property-value" aria-labelledby="cost-label"><g:fieldValue bean="${sportDayRuleInstance}" field="cost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sportDayRuleInstance?.sport}">
				<li class="fieldcontain">
					<span id="sport-label" class="property-label"><g:message code="sportDayRule.sport.label" default="Sport" /></span>
					
						<span class="property-value" aria-labelledby="sport-label"><g:link controller="sport" action="show" id="${sportDayRuleInstance?.sport?.id}">${sportDayRuleInstance?.sport?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sportDayRuleInstance?.timeFrom}">
				<li class="fieldcontain">
					<span id="timeFrom-label" class="property-label"><g:message code="sportDayRule.timeFrom.label" default="Time From" /></span>
					
						<span class="property-value" aria-labelledby="timeFrom-label"><g:fieldValue bean="${sportDayRuleInstance}" field="timeFrom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sportDayRuleInstance?.timeTo}">
				<li class="fieldcontain">
					<span id="timeTo-label" class="property-label"><g:message code="sportDayRule.timeTo.label" default="Time To" /></span>
					
						<span class="property-value" aria-labelledby="timeTo-label"><g:fieldValue bean="${sportDayRuleInstance}" field="timeTo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:sportDayRuleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${sportDayRuleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
