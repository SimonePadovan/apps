<%@ page import="it.bz.apps.core.Language" %>



<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="language.code.label" default="Code" />
		
	</label>
	<g:textField name="code" maxlength="15" value="${languageInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'descr', 'error')} required">
	<label for="descr">
		<g:message code="language.descr.label" default="Descr" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descr" maxlength="200" required="" value="${languageInstance?.descr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="language.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${languageInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

