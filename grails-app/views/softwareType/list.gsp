
<%@ page import="it.bz.apps.core.SoftwareType" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'softwareType.label', default: 'SoftwareType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-softwareType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-softwareType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'softwareType.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="descr" title="${message(code: 'softwareType.descr.label', default: 'Descr')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'softwareType.endDate.label', default: 'End Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${softwareTypeInstanceList}" status="i" var="softwareTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${softwareTypeInstance.id}">${fieldValue(bean: softwareTypeInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: softwareTypeInstance, field: "descr")}</td>
					
						<td><g:formatDate date="${softwareTypeInstance.endDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${softwareTypeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
