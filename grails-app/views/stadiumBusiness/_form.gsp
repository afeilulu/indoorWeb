<%@ page import="com.chinaairdome.StadiumBusiness" %>



<div class="fieldcontain ${hasErrors(bean: stadiumBusinessInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="stadiumBusiness.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${stadiumBusinessInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumBusinessInstance, field: 'placeStatus', 'error')} required">
	<label for="placeStatus">
		<g:message code="stadiumBusiness.placeStatus.label" default="Place Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="placeStatus" from="${com.chinaairdome.PlaceStatus?.values()}" keys="${com.chinaairdome.PlaceStatus.values()*.name()}" required="" value="${stadiumBusinessInstance?.placeStatus?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumBusinessInstance, field: 'stadiumManage', 'error')} required">
	<label for="stadiumManage">
		<g:message code="stadiumBusiness.stadiumManage.label" default="Stadium Manage" />
		<span class="required-indicator">*</span>
	</label>
    <%
    def stadiumManageList = com.chinaairdome.StadiumManage.createCriteria().list {
        def now = new Date()
        lt("dateStart",now)
        gt("dateEnd",now)
    }
    %>
	<g:select id="stadiumManage" name="stadiumManage.id" from="${stadiumManageList}" optionKey="id" required="" value="${stadiumBusinessInstance?.stadiumManage?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumBusinessInstance, field: 'timeFrom', 'error')} required">
	<label for="timeFrom">
		<g:message code="stadiumBusiness.timeFrom.label" default="Time From" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="timeFrom" type="number" value="${stadiumBusinessInstance.timeFrom}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumBusinessInstance, field: 'timeTo', 'error')} required">
	<label for="timeTo">
		<g:message code="stadiumBusiness.timeTo.label" default="Time To" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="timeTo" type="number" value="${stadiumBusinessInstance.timeTo}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: stadiumBusinessInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="stadiumBusiness.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.chinaairdome.User.list()}" optionKey="id" required="" value="${stadiumBusinessInstance?.user?.id}" class="many-to-one"/>

</div>

