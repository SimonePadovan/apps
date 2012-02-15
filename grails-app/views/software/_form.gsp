<%@ page import="it.bz.apps.core.Software" %>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="software.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="30" required=""  value="${softwareInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'descr', 'error')} required">
	<label for="descr">
		<g:message code="software.descr.label" default="Descr" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="descr" cols="40" rows="5" maxlength="500" required="" value="${softwareInstance?.descr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'softwareType', 'error')} required">
	<label for="softwareType">
		<g:message code="software.softwareType.label" default="Software Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="softwareType" name="softwareType.id" from="${it.bz.apps.core.SoftwareType.listOpenOn(softwareInstance?.dateCreated)}" optionKey="id" required="" value="${softwareInstance?.softwareType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'language', 'error')} required">
	<label for="language">
		<g:message code="software.language.label" default="Language" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="language" name="language.id" from="${it.bz.apps.core.Language.listOpenOn(softwareInstance?.dateCreated)}" optionKey="id" required="" value="${softwareInstance?.language?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'sourcingType', 'error')} required">
	<label for="sourcingType">
		<g:message code="software.sourcingType.label" default="Sourcing Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sourcingType" name="sourcingType.id" from="${it.bz.apps.core.SourcingType.listOpenOn(softwareInstance?.dateCreated)}" optionKey="id" required="" value="${softwareInstance?.sourcingType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'dbSchema', 'error')} ">
	<label for="dbSchema">
		<g:message code="software.dbSchema.label" default="Db Schema" />
		
	</label>
	<g:select id="dbSchema" name="dbSchema.id" from="${it.bz.apps.core.DbSchema.listOpenOn(softwareInstance?.dateCreated)}" optionKey="id" value="${softwareInstance?.dbSchema?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'pathBin', 'error')} ">
	<label for="pathBin">
		<g:message code="software.pathBin.label" default="Path Bin" />
		
	</label>
	<g:textField name="pathBin" maxlength="200" value="${softwareInstance?.pathBin}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'pathDoc', 'error')} ">
	<label for="pathDoc">
		<g:message code="software.pathDoc.label" default="Path Doc" />
		
	</label>
	<g:textField name="pathDoc" maxlength="200" value="${softwareInstance?.pathDoc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="software.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="1000" value="${softwareInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'productionDate', 'error')} ">
	<label for="productionDate">
		<g:message code="software.productionDate.label" default="Production Date" />
		
	</label>
	<g:datePicker name="productionDate" precision="day"  value="${softwareInstance?.productionDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="software.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${softwareInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'itpersons', 'error')}">
	<label for="itpersons">
		<g:message code="software.itpersons.label" default="IT Persons" />
	</label>
	<g:render  template="itpersons"  model="['persons':softwareInstance.itpersons]" />
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'keypersons', 'error')}">
	<label for="keypersons">
		<g:message code="software.keypersons.label" default="Key Persons" />
	</label>
	<g:render  template="keypersons"  model="['persons':softwareInstance.keypersons]" />
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'clientorganizations', 'error')}">
	<label for="clientorganizations">
		<g:message code="software.clientorganizations.label" default="Client organizations" />
	</label>
	<g:render  template="clientorganizations"  model="['organizations':softwareInstance.clientorganizations]" />
</div>

<div class="fieldcontain ${hasErrors(bean: softwareInstance, field: 'linkedsoftwares', 'error')}">
	<label for="linkedsoftwares">
		<g:message code="software.linkedsoftwares.label" default="Linked software" />
	</label>
	<g:render  template="linkedsoftwares"  model="['softwares':softwareInstance.linkedsoftwares]" />
</div>
