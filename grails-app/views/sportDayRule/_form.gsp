<%@ page import="com.chinaairdome.SportDayRule" %>



<div class="fieldcontain ${hasErrors(bean: sportDayRuleInstance, field: 'isAdopted', 'error')} ">
	<label for="isAdopted">
		<g:message code="sportDayRule.isAdopted.label" default="Is Adopted" />
		
	</label>
	<g:checkBox name="isAdopted" value="${sportDayRuleInstance?.isAdopted}" />

</div>

<div class="fieldcontain ${hasErrors(bean: sportDayRuleInstance, field: 'memo', 'error')} required">
	<label for="memo">
		<g:message code="sportDayRule.memo.label" default="Memo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="memo" required="" value="${sportDayRuleInstance?.memo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportDayRuleInstance, field: 'minOrderUnit', 'error')} required">
	<label for="minOrderUnit">
		<g:message code="sportDayRule.minOrderUnit.label" default="Min Order Unit" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="minOrderUnit" from="${com.chinaairdome.MinOrderUnit?.values()}" keys="${com.chinaairdome.MinOrderUnit.values()*.name()}" required="" value="${sportDayRuleInstance?.minOrderUnit?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: sportDayRuleInstance, field: 'ruleJson', 'error')} required">
	<label for="ruleJson">
		<g:message code="sportDayRule.ruleJson.label" default="Rule Json" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ruleJson" required="" value="${sportDayRuleInstance?.ruleJson}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportDayRuleInstance, field: 'sport', 'error')} required">
	<label for="sport">
		<g:message code="sportDayRule.sport.label" default="Sport" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sport" name="sport.id" from="${com.chinaairdome.Sport.list()}" optionKey="id" required="" value="${sportDayRuleInstance?.sport?.id}" class="many-to-one"/>

</div>

