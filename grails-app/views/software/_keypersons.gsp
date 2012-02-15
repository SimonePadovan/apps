<g:javascript>
    var KeychildCount = 0;
    function addKeyChild() {      
		var templateHtml = '${render( template:"keyperson", model:["keyperson":it.bz.apps.core.KeyPerson.newInstance(),'i':-1]).replaceAll('\r\n', ' ').replaceAll('\n', ' ')}';
		var toAppend = templateHtml.replace(/-1/g, KeychildCount);
        $("#KeychildList").append(toAppend);
        KeychildCount++;
    }    
</g:javascript>

<div id="KeychildList">
    <g:each var="keyperson" in="${persons}" status="i">
        <g:render template='keyperson' model="['keyperson':keyperson,'i':i]"/>
    </g:each>
   
    <g:if test="${persons}" >
	   <g:javascript>KeychildCount = ${persons.size()};</g:javascript>
	</g:if>    
	<g:else>
	   <g:javascript>$("#addKeyPerson").click();</g:javascript>
	</g:else>
	
</div>
<input id="addKeyPerson" class="property-value" type="button" value="Add Person" onclick="addKeyChild();" />
