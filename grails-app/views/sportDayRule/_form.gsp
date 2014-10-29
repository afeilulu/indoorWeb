<%@ page import="com.chinaairdome.SportDayRule" %>



<div class="fieldcontain ${hasErrors(bean: sportDayRuleInstance, field: 'cost', 'error')} required">
	<label for="cost">
		<g:message code="sportDayRule.cost.label" default="Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cost" type="number" value="${sportDayRuleInstance.cost}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportDayRuleInstance, field: 'sport', 'error')} required">
	<label for="sport">
		<g:message code="sportDayRule.sport.label" default="Sport" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sport" name="sport.id" from="${com.chinaairdome.Sport.list()}" optionKey="id" required="" value="${sportDayRuleInstance?.sport?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportDayRuleInstance, field: 'timeFrom', 'error')} required">
	<label for="timeFrom">
		<g:message code="sportDayRule.timeFrom.label" default="Time From" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="timeFrom" type="number" value="${sportDayRuleInstance.timeFrom}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportDayRuleInstance, field: 'timeTo', 'error')} required">
	<label for="timeTo">
		<g:message code="sportDayRule.timeTo.label" default="Time To" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="timeTo" type="number" value="${sportDayRuleInstance.timeTo}" required=""/>

</div>

