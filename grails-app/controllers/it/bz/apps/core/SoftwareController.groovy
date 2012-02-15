package it.bz.apps.core

class SoftwareController extends BaseController {

	// Imposto model di BaseController
	def beforeInterceptor = {
		model = Software
	}
	
	def queryList() {
		session.name = params.name
		session.softwareType = params.softwareType
		session.language = params.language
		session.sourcingType = params.sourcingType
		session.itPerson = params.itPerson
		session.clientOrganization = params.clientOrganization		
		
		render (view: "list", model: list())
	}
	
	protected def doList(params) {
		params.name = session.name ?: params.name 
		params.softwareType = session.softwareType ?: params.softwareType
		params.language = session.language ?: params.language
		params.sourcingType = session.sourcingType ?: params.sourcingType
		params.itPerson = session.itPerson ?: params.itPerson
		params.clientOrganization = session.clientOrganization ?: params.clientOrganization

		Software.createCriteria().list(max:params.max, offset:params.offset) {
			if (params.name)
			  ilike("name", params.name+'%')
		    if (params.softwareType)
			  eq("softwareType.id", new Long(params.softwareType))
			if (params.language)
			  eq("language.id", new Long(params.language))
			if (params.sourcingType)
			  eq("sourcingType.id", new Long(params.sourcingType))

			if (params.itPerson) {
			   itpersons{
				   eq('person.id', new Long(params.itPerson))
			   }
			}  
			if (params.clientOrganization) {
				clientorganizations{
					eq('organization.id', new Long(params.clientOrganization))
				}
			}
 
			if (params.sort)
			  order(params.sort, params.order)
		}
	}
	
	private void deletePersonChildren(def children)
	{
		def toBeDeleted = []
		toBeDeleted += children.findAll{it.deleted || !it.person}		
		toBeDeleted.each { child ->
			children.remove(child)
			child.delete()
		}
	} 

	private void deleteOrganizationChildren(def children)
	{
		def toBeDeleted = []
		toBeDeleted += children.findAll{it.deleted || !it.organization}
		toBeDeleted.each { child ->
			children.remove(child)
			child.delete()
		}
	}

	private void deleteSoftwareChildren(def children)
	{
		def toBeDeleted = []
		toBeDeleted += children.findAll{it.deleted || !it.softwareLinked}
		toBeDeleted.each { child ->
			children.remove(child)
			child.delete()
		}
	}

		
	protected def newInstance()
	{
		def instance = super.newInstance()
		
		deletePersonChildren(instance.itpersons)
		deletePersonChildren(instance.keypersons)
		deleteOrganizationChildren(instance.clientorganizations)
		deleteSoftwareChildren(instance.linkedsoftwares)
		return instance
	}

	protected void setProps(Object instance, Object p) {
		super.setProps(instance, p);

		deletePersonChildren(instance.itpersons)
		deletePersonChildren(instance.keypersons)
		deleteOrganizationChildren(instance.clientorganizations)
		deleteSoftwareChildren(instance.linkedsoftwares)
	}		
	
}
