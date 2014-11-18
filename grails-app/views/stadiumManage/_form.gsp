<%@ page import="com.chinaairdome.Stadium; com.chinaairdome.Sport; com.chinaairdome.StadiumManage" %>



<div class="fieldcontain ${hasErrors(bean: stadiumManageInstance, field: 'stadium', 'error')} required">
    <label for="stadium">
        <g:message code="stadiumManage.stadium.label" default="Stadium" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="stadium" name="stadium.id" from="${com.chinaairdome.Stadium.list()}" optionKey="id" required="" value="${stadiumManageInstance?.stadium?.id}" class="many-to-one"
              noSelection="['':'Select ...']"
              onchange="${remoteFunction(action: 'sportById',
                      update: [success: 'sport', failure: 'ohno'],
                      params: '\'id=\' + this.value')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumManageInstance, field: 'sport', 'error')} required">
	<label for="sport">
		<g:message code="stadiumManage.sport.label" default="Sport" />
		<span class="required-indicator">*</span>
	</label>

	%{--<g:select id="sport" name="sport.id" from="${com.chinaairdome.Sport.findAllByStadium(stadiumManageInstance.stadium)}" optionKey="id" required="" value="${stadiumManageInstance?.sport?.id}" class="many-to-one"/>--}%
    <g:select id="sport" name="sport.id" from="${[]}" optionKey="id" required="" value="${stadiumManageInstance?.sport?.id}" class="many-to-one"
              onchange="${remoteFunction(action: 'ruleById',
                      update: [success: 'sportDayRule', failure: 'ohno'],
                      params: '\'id=\' + this.value')}"
    />

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumManageInstance, field: 'sportDayRule', 'error')} required">
	<label for="sportDayRule">
		<g:message code="stadiumManage.sportDayRule.label" default="Sport Day Rule" />
		<span class="required-indicator">*</span>
	</label>
	%{--<g:select id="sportDayRule" name="sportDayRule.id" from="${com.chinaairdome.SportDayRule.list()}" optionKey="id" required="" value="${stadiumManageInstance?.sportDayRule?.id}" class="many-to-one"/>--}%
    <g:select id="sportDayRule" name="sportDayRule.id" from="${[]}" optionKey="id" required="" value="${stadiumManageInstance?.sportDayRule?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stadiumManageInstance, field: 'dateStart', 'error')} required">
    <label for="dateStart">
        <g:message code="stadiumManage.dateStart.label" default="Date Start" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dateStart" precision="day"  value="${stadiumManageInstance?.dateStart}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumManageInstance, field: 'dateEnd', 'error')} required">
    <label for="dateEnd">
        <g:message code="stadiumManage.dateEnd.label" default="Date End" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dateEnd" precision="day"  value="${stadiumManageInstance?.dateEnd}"  />

</div>


