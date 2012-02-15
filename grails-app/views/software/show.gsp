
<%@ page import="it.bz.apps.core.Software" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'software.label', default: 'Software')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-software" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-software" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list software">
			
				<g:if test="${softwareInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="software.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${softwareInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.descr}">
				<li class="fieldcontain">
					<span id="descr-label" class="property-label"><g:message code="software.descr.label" default="Descr" /></span>
					
						<span class="property-value" aria-labelledby="descr-label"><g:fieldValue bean="${softwareInstance}" field="descr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.softwareType}">
				<li class="fieldcontain">
					<span id="softwareType-label" class="property-label"><g:message code="software.softwareType.label" default="Software Type" /></span>
					
						<span class="property-value" aria-labelledby="softwareType-label"><g:link controller="softwareType" action="show" id="${softwareInstance?.softwareType?.id}">${softwareInstance?.softwareType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.language}">
				<li class="fieldcontain">
					<span id="language-label" class="property-label"><g:message code="software.language.label" default="Language" /></span>
					
						<span class="property-value" aria-labelledby="language-label"><g:link controller="language" action="show" id="${softwareInstance?.language?.id}">${softwareInstance?.language?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.sourcingType}">
				<li class="fieldcontain">
					<span id="sourcingType-label" class="property-label"><g:message code="software.sourcingType.label" default="Sourcing Type" /></span>
					
						<span class="property-value" aria-labelledby="sourcingType-label"><g:link controller="sourcingType" action="show" id="${softwareInstance?.sourcingType?.id}">${softwareInstance?.sourcingType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.dbSchema}">
				<li class="fieldcontain">
					<span id="dbSchema-label" class="property-label"><g:message code="software.dbSchema.label" default="Db Schema" /></span>
					
						<span class="property-value" aria-labelledby="dbSchema-label"><g:link controller="dbSchema" action="show" id="${softwareInstance?.dbSchema?.id}">${softwareInstance?.dbSchema?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.pathBin}">
				<li class="fieldcontain">
					<span id="pathBin-label" class="property-label"><g:message code="software.pathBin.label" default="Path Bin" /></span>
					
						<span class="property-value" aria-labelledby="pathBin-label"><g:fieldValue bean="${softwareInstance}" field="pathBin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.pathDoc}">
				<li class="fieldcontain">
					<span id="pathDoc-label" class="property-label"><g:message code="software.pathDoc.label" default="Path Doc" /></span>
					
						<span class="property-value" aria-labelledby="pathDoc-label"><g:fieldValue bean="${softwareInstance}" field="pathDoc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="software.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${softwareInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.productionDate}">
				<li class="fieldcontain">
					<span id="productionDate-label" class="property-label"><g:message code="software.productionDate.label" default="Production Date" /></span>
					
						<span class="property-value" aria-labelledby="productionDate-label"><g:formatDate date="${softwareInstance?.productionDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="software.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${softwareInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="software.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${softwareInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${softwareInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="software.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${softwareInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
				

				<g:if test="${softwareInstance?.itpersons}">
				<li class="fieldcontain">
					<span id="itpersons-label" class="property-label"><g:message code="software.itpersons.label" default="IT Persons" /></span>
                    <g:each var="b" in="${softwareInstance?.itpersons}">
                       <span class="property-value" aria-labelledby="ITperson-label"><g:link controller="Person" action="show" id="${b.person.id}">${b?.person?.encodeAsHTML()}</g:link></span>
                    </g:each>
				</li>
				</g:if>

				<g:if test="${softwareInstance?.keypersons}">
				<li class="fieldcontain">
					<span id="keypersons-label" class="property-label"><g:message code="software.keypersons.label" default="Key Persons" /></span>
                    <g:each var="b" in="${softwareInstance?.keypersons}">
                       <span class="property-value" aria-labelledby="Keyperson-label"><g:link controller="Person" action="show" id="${b.person.id}">${b?.person?.encodeAsHTML()}</g:link></span>
                    </g:each>
				</li>
				</g:if>

				<g:if test="${softwareInstance?.clientorganizations}">
				<li class="fieldcontain">
					<span id="clientorganization-label" class="property-label"><g:message code="software.clientorganizations.label" default="Client organizations" /></span>
                    <g:each var="b" in="${softwareInstance?.clientorganizations}">
                       <span class="property-value" aria-labelledby="ClientOrganization-label"><g:link controller="Organization" action="show" id="${b.organization.id}">${b?.organization?.encodeAsHTML()}</g:link></span>
                    </g:each>
				</li>
				</g:if>

				<g:if test="${softwareInstance?.linkedsoftwares}">
				<li class="fieldcontain">
					<span id="linkedsoftware-label" class="property-label"><g:message code="software.linkedsoftwares.label" default="Linked software" /></span>
                    <g:each var="b" in="${softwareInstance?.linkedsoftwares}">
                       <span class="property-value" aria-labelledby="LinkedSoftware-label"><g:link controller="Software"  action="show" id="${b.softwareLinked.id}">${b?.softwareLinked?.encodeAsHTML()}</g:link></span>
                    </g:each>
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${softwareInstance?.id}" />
					<g:link class="edit" action="edit" id="${softwareInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
