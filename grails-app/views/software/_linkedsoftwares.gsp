<g:javascript>
    var LnkchildCount = 0;
    function addLnkChild() {      
		var templateHtml = '${render( template:"linkedsoftware", model:["software":it.bz.apps.core.LinkedSoftware.newInstance(),'i':-1]).replaceAll('\r\n', ' ').replaceAll('\n', ' ')}';
		var toAppend = templateHtml.replace(/-1/g, LnkchildCount);
        $("#LnkchildList").append(toAppend);
        LnkchildCount++;
    }    
</g:javascript>

<div id="LnkchildList">
    <g:each var="software" in="${softwares}" status="i">
        <g:render template='linkedsoftware' model="['software':software,'i':i]"/>
    </g:each>
   
    <g:if test="${softwares}" >
	   <g:javascript>LnkchildCount = ${softwares.size()};</g:javascript>
	</g:if>    
	<g:else>
	   <g:javascript>$("#addSoftware").click();</g:javascript>
	</g:else>
</div>
<input id="addSoftware" class="property-value" type="button" value="Add Software" onclick="addLnkChild();" />
