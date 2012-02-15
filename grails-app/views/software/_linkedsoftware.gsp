<div id="software${i}" class="property-value">
    <g:select name='linkedsoftwares[${i}].softwareLinked.id' from="${it.bz.apps.core.Software.list()}" optionKey="id" noSelection="${['':'Select one...']}" value="${software?.softwareLinked?.id}" class="many-to-one"/>
    <g:if test="${software?.id}">       
      <g:hiddenField name='linkedsoftwares[${i}].deleted' value="false"/>
      <span onClick="$('#linkedsoftwares\\[${i}\\]\\.deleted').val('true'); $('#software${i}').hide()"><img src="${resource(dir:'images/skin', file:'database_delete.png')}" /></span>
    </g:if>
    <g:else>
      <span onClick=$("#software${i}").remove();><img src="${resource(dir:'images/skin', file:'database_delete.png')}" /></span>    
    </g:else>
</div>
