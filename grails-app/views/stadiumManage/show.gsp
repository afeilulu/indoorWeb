
<%@ page import="com.chinaairdome.StadiumManage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stadiumManage.label', default: 'StadiumManage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stadiumManage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stadiumManage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stadiumManage">
			
				<g:if test="${stadiumManageInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="stadiumManage.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${stadiumManageInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumManageInstance?.dateEnd}">
				<li class="fieldcontain">
					<span id="dateEnd-label" class="property-label"><g:message code="stadiumManage.dateEnd.label" default="Date End" /></span>
					
						<span class="property-value" aria-labelledby="dateEnd-label"><g:formatDate date="${stadiumManageInstance?.dateEnd}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumManageInstance?.dateStart}">
				<li class="fieldcontain">
					<span id="dateStart-label" class="property-label"><g:message code="stadiumManage.dateStart.label" default="Date Start" /></span>
					
						<span class="property-value" aria-labelledby="dateStart-label"><g:formatDate date="${stadiumManageInstance?.dateStart}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumManageInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="stadiumManage.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${stadiumManageInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumManageInstance?.sportDayRule}">
				<li class="fieldcontain">
					<span id="sportDayRule-label" class="property-label"><g:message code="stadiumManage.sportDayRule.label" default="Sport Day Rule" /></span>
					
						<span class="property-value" aria-labelledby="sportDayRule-label"><g:link controller="sportDayRule" action="show" id="${stadiumManageInstance?.sportDayRule?.id}">${stadiumManageInstance?.sportDayRule?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumManageInstance?.stadium}">
				<li class="fieldcontain">
					<span id="stadium-label" class="property-label"><g:message code="stadiumManage.stadium.label" default="Stadium" /></span>
					
						<span class="property-value" aria-labelledby="stadium-label"><g:link controller="stadium" action="show" id="${stadiumManageInstance?.stadium?.id}">${stadiumManageInstance?.stadium?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:stadiumManageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${stadiumManageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
