<%@ page import="it.bz.apps.core.SourcingType" %>



<div class="fieldcontain ${hasErrors(bean: sourcingTypeInstance, field: 'descr', 'error')} required">
	<label for="descr">
		<g:message code="sourcingType.descr.label" default="Descr" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descr" maxlength="200" required="" value="${sourcingTypeInstance?.descr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sourcingTypeInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="sourcingType.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${sourcingTypeInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

