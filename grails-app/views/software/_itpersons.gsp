<g:javascript>
    var ITchildCount = 0;
    function addITChild() {      
		var templateHtml = '${render( template:"itperson", model:["itperson":it.bz.apps.core.ITPerson.newInstance(),'i':-1]).replaceAll('\r\n', ' ').replaceAll('\n', ' ')}';
		var toAppend = templateHtml.replace(/-1/g, ITchildCount);
        $("#ITchildList").append(toAppend);
        ITchildCount++;
    }    
</g:javascript>

<div id="ITchildList">
    <g:each var="itperson" in="${persons}" status="i">
        <g:render template='itperson' model="['itperson':itperson,'i':i]"/>
    </g:each>
   
    <g:if test="${persons}" >
	   <g:javascript>ITchildCount = ${persons.size()};</g:javascript>
	</g:if>    
	<g:else>
	   <g:javascript>$("#addITPerson").click();</g:javascript>
	</g:else>
</div>
<input id="addITPerson" class="property-value" type="button" value="Add Person" onclick="addITChild();" />
