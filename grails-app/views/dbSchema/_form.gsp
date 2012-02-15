<%@ page import="it.bz.apps.core.DbSchema" %>



<div class="fieldcontain ${hasErrors(bean: dbSchemaInstance, field: 'descr', 'error')} required">
	<label for="descr">
		<g:message code="dbSchema.descr.label" default="Descr" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descr" maxlength="200" required="" value="${dbSchemaInstance?.descr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dbSchemaInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="dbSchema.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${dbSchemaInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: dbSchemaInstance, field: 'db', 'error')} required">
	<label for="db">
		<g:message code="dbSchema.db.label" default="Db" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="db" name="db.id" from="${it.bz.apps.core.Db.list()}" optionKey="id" required="" value="${dbSchemaInstance?.db?.id}" class="many-to-one"/>
</div>

