<%@ page import="com.chinaairdome.Stadium" %>


<div class="fieldcontain ${hasErrors(bean: stadiumInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="stadium.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${stadiumInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumInstance, field: 'city', 'error')} required">
    <label for="city">
        <g:message code="stadium.city.label" default="City" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="city" required="" value="${stadiumInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="stadium.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${stadiumInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumInstance, field: 'lng', 'error')} required">
    <label for="lng">
        <g:message code="stadium.lng.label" default="Lng" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="lng" value="${fieldValue(bean: stadiumInstance, field: 'lng')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumInstance, field: 'lat', 'error')} required">
	<label for="lat">
		<g:message code="stadium.lat.label" default="Lat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lat" value="${fieldValue(bean: stadiumInstance, field: 'lat')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="stadium.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${stadiumInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumInstance, field: 'picUrl', 'error')} required">
	<label for="picUrl">
		<g:message code="stadium.picUrl.label" default="Pic Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="picUrl" required="" value="${stadiumInstance?.picUrl}"/>

</div>

