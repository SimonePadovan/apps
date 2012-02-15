
<%@ page import="it.bz.apps.core.DbSchema" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dbSchema.label', default: 'DbSchema')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dbSchema" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dbSchema" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dbSchema">
			
				<g:if test="${dbSchemaInstance?.descr}">
				<li class="fieldcontain">
					<span id="descr-label" class="property-label"><g:message code="dbSchema.descr.label" default="Descr" /></span>
					
						<span class="property-value" aria-labelledby="descr-label"><g:fieldValue bean="${dbSchemaInstance}" field="descr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dbSchemaInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="dbSchema.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${dbSchemaInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dbSchemaInstance?.db}">
				<li class="fieldcontain">
					<span id="db-label" class="property-label"><g:message code="dbSchema.db.label" default="Db" /></span>
					
						<span class="property-value" aria-labelledby="db-label"><g:link controller="db" action="show" id="${dbSchemaInstance?.db?.id}">${dbSchemaInstance?.db?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dbSchemaInstance?.id}" />
					<g:link class="edit" action="edit" id="${dbSchemaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
