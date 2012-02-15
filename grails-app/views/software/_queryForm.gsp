<div class="fieldcontain">
	<label for="name"> <g:message code="software.name.label" default="Name" />
	</label>
	<g:textField name="name" maxlength="30" value="${session.name}" />

	<label for="softwareType"> <g:message code="software.softwareType.label" default="Software Type" />
	</label>
	<g:select name="softwareType" from="${it.bz.apps.core.SoftwareType.list()}" noSelection="${['':'Select one...']}"
		optionKey="id" value="${session.softwareType}" class="many-to-one" />

</div>
<div class="fieldcontain">
	<label for="language"> <g:message code="software.language.label" default="Language" />
	</label>
	<g:select name="language" from="${it.bz.apps.core.Language.list()}" noSelection="${['':'Select one...']}"
		optionKey="id" value="${session.language}" class="many-to-one" />

	<label for="sourcingType"> <g:message code="software.sourcingType.label" default="Sourcing Type" />
	</label>
	<g:select name="sourcingType" noSelection="${['':'Select one...']}" from="${it.bz.apps.core.SourcingType.list()}"
		optionKey="id" value="${session.sourcingType}" class="many-to-one" />

</div>
<div class="fieldcontain">
	<label for="ITPerson"> <g:message code="software.itPerson.label" default="IT person" />
	</label>
	<g:select name="itPerson" from="${it.bz.organization.core.Person.list()}" optionKey="id" noSelection="${['':'Select one...']}"
		value="${session.itPerson}" class="many-to-one" />

	<label for="ClientOrganization"> <g:message	code="software.clientOrganization.label" default="Client organization" />
	</label>
	<g:select name='clientOrganization'	from="${it.bz.organization.core.Organization.list()}" optionKey="id"
		noSelection="${['':'Select one...']}" value="${session.clientOrganization}" class="many-to-one" />
</div>