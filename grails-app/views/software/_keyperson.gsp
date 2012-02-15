<div id="keyperson${i}" class="property-value">
    <g:select name='keypersons[${i}].person.id' from="${it.bz.organization.core.Person.list()}" optionKey="id" noSelection="${['':'Select one...']}" value="${keyperson?.person?.id}" class="many-to-one"/>
    <g:if test="${keyperson?.id}">       
      <g:hiddenField name='keypersons[${i}].deleted' value="false"/>
      <span onClick="$('#keypersons\\[${i}\\]\\.deleted').val('true'); $('#keyperson${i}').hide()"><img src="${resource(dir:'images/skin', file:'database_delete.png')}" /></span>
    </g:if>
    <g:else>
      <span onClick=$("#keyperson${i}").remove();><img src="${resource(dir:'images/skin', file:'database_delete.png')}" /></span>    
    </g:else>
</div>
