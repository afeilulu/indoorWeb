
<%@ page import="com.chinaairdome.Stadium" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'stadium.label', default: 'Stadium')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-stadium" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-stadium" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list stadium">
			
				<g:if test="${stadiumInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="stadium.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${stadiumInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="stadium.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${stadiumInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="stadium.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${stadiumInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="stadium.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${stadiumInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumInstance?.lat}">
				<li class="fieldcontain">
					<span id="lat-label" class="property-label"><g:message code="stadium.lat.label" default="Lat" /></span>
					
						<span class="property-value" aria-labelledby="lat-label"><g:fieldValue bean="${stadiumInstance}" field="lat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumInstance?.lng}">
				<li class="fieldcontain">
					<span id="lng-label" class="property-label"><g:message code="stadium.lng.label" default="Lng" /></span>
					
						<span class="property-value" aria-labelledby="lng-label"><g:fieldValue bean="${stadiumInstance}" field="lng"/></span>
                </li>
				</g:if>
			
				<g:if test="${stadiumInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="stadium.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${stadiumInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="stadium.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${stadiumInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stadiumInstance?.picUrl}">
				<li class="fieldcontain">
					<span id="picUrl-label" class="property-label"><g:message code="stadium.picUrl.label" default="Pic Url" /></span>
					
						<span class="property-value" aria-labelledby="picUrl-label"><g:fieldValue bean="${stadiumInstance}" field="picUrl"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:stadiumInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${stadiumInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
