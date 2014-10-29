
<%@ page import="com.chinaairdome.StadiumBusiness" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stadiumBusiness.label', default: 'StadiumBusiness')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stadiumBusiness" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stadiumBusiness" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stadiumBusiness">
			
				<g:if test="${stadiumBusinessInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="stadiumBusiness.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${stadiumBusinessInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumBusinessInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="stadiumBusiness.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${stadiumBusinessInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumBusinessInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="stadiumBusiness.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${stadiumBusinessInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumBusinessInstance?.placeStatus}">
				<li class="fieldcontain">
					<span id="placeStatus-label" class="property-label"><g:message code="stadiumBusiness.placeStatus.label" default="Place Status" /></span>
					
						<span class="property-value" aria-labelledby="placeStatus-label"><g:fieldValue bean="${stadiumBusinessInstance}" field="placeStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumBusinessInstance?.stadiumManage}">
				<li class="fieldcontain">
					<span id="stadiumManage-label" class="property-label"><g:message code="stadiumBusiness.stadiumManage.label" default="Stadium Manage" /></span>
					
						<span class="property-value" aria-labelledby="stadiumManage-label"><g:link controller="stadiumManage" action="show" id="${stadiumBusinessInstance?.stadiumManage?.id}">${stadiumBusinessInstance?.stadiumManage?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumBusinessInstance?.timeFrom}">
				<li class="fieldcontain">
					<span id="timeFrom-label" class="property-label"><g:message code="stadiumBusiness.timeFrom.label" default="Time From" /></span>
					
						<span class="property-value" aria-labelledby="timeFrom-label"><g:fieldValue bean="${stadiumBusinessInstance}" field="timeFrom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumBusinessInstance?.timeTo}">
				<li class="fieldcontain">
					<span id="timeTo-label" class="property-label"><g:message code="stadiumBusiness.timeTo.label" default="Time To" /></span>
					
						<span class="property-value" aria-labelledby="timeTo-label"><g:fieldValue bean="${stadiumBusinessInstance}" field="timeTo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumBusinessInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="stadiumBusiness.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${stadiumBusinessInstance?.user?.id}">${stadiumBusinessInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:stadiumBusinessInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${stadiumBusinessInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
