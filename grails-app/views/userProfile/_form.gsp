<%@ page import="com.chinaairdome.UserProfile" %>



<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userProfile.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userProfileInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userProfileInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="userProfile.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${userProfileInstance?.phone}"/>

</div>

