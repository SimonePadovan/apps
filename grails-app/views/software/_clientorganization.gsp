<div id="organization${i}" class="property-value">
    <g:select name='clientorganizations[${i}].organization.id' from="${it.bz.organization.core.Organization.listOpenOn(organization?.software?.dateCreated)}" optionKey="id" noSelection="${['':'Select one...']}" value="${organization?.organization?.id}" class="many-to-one"/>
    <g:if test="${organization?.id}">       
      <g:hiddenField name='clientorganizations[${i}].deleted' value="false"/>
      <span onClick="$('#clientorganizations\\[${i}\\]\\.deleted').val('true'); $('#organization${i}').hide()"><img src="${resource(dir:'images/skin', file:'database_delete.png')}" /></span>
    </g:if>
    <g:else>
      <span onClick=$("#organization${i}").remove();><img src="${resource(dir:'images/skin', file:'database_delete.png')}" /></span>    
    </g:else>
</div>
