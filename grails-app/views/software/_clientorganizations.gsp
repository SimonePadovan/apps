<g:javascript>
    var OrgchildCount = 0;
    function addOrgChild() {      
		var templateHtml = '${render( template:"clientorganization", model:["itperson":it.bz.apps.core.ClientOrganization.newInstance(),'i':-1]).replaceAll('\r\n', ' ').replaceAll('\n', ' ')}';
		var toAppend = templateHtml.replace(/-1/g, OrgchildCount);
        $("#OrgchildList").append(toAppend);
        OrgchildCount++;
    }    
</g:javascript>

<div id="OrgchildList">
    <g:each var="organization" in="${organizations}" status="i">
        <g:render template='clientorganization' model="['organization':organization,'i':i]"/>
    </g:each>
   
    <g:if test="${organizations}" >
	   <g:javascript>OrgchildCount = ${organizations.size()};</g:javascript>
	</g:if>    
	<g:else>
	   <g:javascript>$("#addOrganization").click();</g:javascript>
	</g:else>
</div>
<input id="addOrganization" class="property-value" type="button" value="Add Organization" onclick="addOrgChild();" />
