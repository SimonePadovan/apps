
<%@ page import="it.bz.apps.core.Db" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'db.label', default: 'Db')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-db" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-db" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'db.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="descr" title="${message(code: 'db.descr.label', default: 'Descr')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'db.endDate.label', default: 'End Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dbInstanceList}" status="i" var="dbInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dbInstance.id}">${fieldValue(bean: dbInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: dbInstance, field: "descr")}</td>
					
						<td><g:formatDate date="${dbInstance.endDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dbInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
