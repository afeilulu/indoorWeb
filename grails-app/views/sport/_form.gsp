<%@ page import="com.chinaairdome.Sport" %>


<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'stadium', 'error')} required">
    <label for="stadium">
        <g:message code="sport.stadium.label" default="Stadium" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="stadium" name="stadium.id" from="${com.chinaairdome.Stadium.list()}" optionKey="id" required="" value="${sportInstance?.stadium?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="sport.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${sportInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'maxFieldCount', 'error')} required">
	<label for="maxFieldCount">
		<g:message code="sport.maxFieldCount.label" default="Max Field Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maxFieldCount" type="number" value="${sportInstance.maxFieldCount}" required=""/>

</div>

