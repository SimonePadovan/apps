
<%@ page import="it.bz.apps.core.Software" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'software.label', default: 'Software')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-software" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

		<g:form method="post" >
			<fieldset class="embedded">
				<g:render template="queryForm"/>
				<g:actionSubmit class="buttons" action="queryList" value="${message(code: 'default.button.query.label', default: 'Find')}" />
			</fieldset>
		</g:form>
		
		<div id="list-software" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn action="list"  property="name" title="${message(code: 'software.name.label', default: 'Name')}" />
					
						<g:sortableColumn action="list" property="descr" title="${message(code: 'software.descr.label', default: 'Descr')}" />
					
						<th><g:message code="software.softwareType.label" default="Software Type" /></th>
					
						<th><g:message code="software.sourcingType.label" default="Sourcing Type" /></th>
						
						<th><g:message code="software.itpersons.label" default="IT persons" /></th>
									
					</tr>
				</thead>
				<tbody>
				<g:each in="${softwareInstanceList}" status="i" var="softwareInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${softwareInstance.id}">${fieldValue(bean: softwareInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: softwareInstance, field: "descr")}</td>
					
						<td>${fieldValue(bean: softwareInstance, field: "softwareType")}</td>
					
						<td>${fieldValue(bean: softwareInstance, field: "sourcingType")}</td>
						
						<td>${softwareInstance.itpersons.person}</td>						
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${softwareInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
