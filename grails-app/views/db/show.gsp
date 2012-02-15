
<%@ page import="it.bz.apps.core.Db" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'db.label', default: 'Db')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-db" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-db" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list db">
			
				<g:if test="${dbInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="db.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${dbInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dbInstance?.descr}">
				<li class="fieldcontain">
					<span id="descr-label" class="property-label"><g:message code="db.descr.label" default="Descr" /></span>
					
						<span class="property-value" aria-labelledby="descr-label"><g:fieldValue bean="${dbInstance}" field="descr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dbInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="db.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${dbInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dbInstance?.dbschemas}">
				<li class="fieldcontain">
					<span id="dbschemas-label" class="property-label"><g:message code="db.dbschemas.label" default="Dbschemas" /></span>
					
						<g:each in="${dbInstance.dbschemas}" var="d">
						<span class="property-value" aria-labelledby="dbschemas-label"><g:link controller="dbSchema" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dbInstance?.id}" />
					<g:link class="edit" action="edit" id="${dbInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
