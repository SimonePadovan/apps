<%@ page import="it.bz.apps.core.SoftwareType" %>



<div class="fieldcontain ${hasErrors(bean: softwareTypeInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="softwareType.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="15" required="" value="${softwareTypeInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareTypeInstance, field: 'descr', 'error')} required">
	<label for="descr">
		<g:message code="softwareType.descr.label" default="Descr" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descr" maxlength="200" required="" value="${softwareTypeInstance?.descr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareTypeInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="softwareType.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${softwareTypeInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

