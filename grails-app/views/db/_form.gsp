<%@ page import="it.bz.apps.core.Db" %>



<div class="fieldcontain ${hasErrors(bean: dbInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="db.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="15" required="" value="${dbInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dbInstance, field: 'descr', 'error')} required">
	<label for="descr">
		<g:message code="db.descr.label" default="Descr" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descr" maxlength="200" required="" value="${dbInstance?.descr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dbInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="db.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${dbInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: dbInstance, field: 'dbschemas', 'error')} ">
	<label for="dbschemas">
		<g:message code="db.dbschemas.label" default="Dbschemas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${dbInstance?.dbschemas?}" var="d">
    <li><g:link controller="dbSchema" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="dbSchema" action="create" params="['db.id': dbInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'dbSchema.label', default: 'DbSchema')])}</g:link>
</li>
</ul>

</div>

