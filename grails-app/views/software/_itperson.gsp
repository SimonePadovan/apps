<div id="itperson${i}" class="property-value">
    <g:select name='itpersons[${i}].person.id' from="${it.bz.organization.core.Person.list()}" optionKey="id" noSelection="${['':'Select one...']}" value="${itperson?.person?.id}" class="many-to-one"/>
    <g:if test="${itperson?.id}">       
      <g:hiddenField name='itpersons[${i}].deleted' value="false"/>
      <span onClick="$('#itpersons\\[${i}\\]\\.deleted').val('true'); $('#itperson${i}').hide()"><img src="${resource(dir:'images/skin', file:'database_delete.png')}" /></span>
    </g:if>
    <g:else>
      <span onClick=$("#itperson${i}").remove();><img src="${resource(dir:'images/skin', file:'database_delete.png')}" /></span>    
    </g:else>
</div>
