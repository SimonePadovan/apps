package it.bz.apps.core

class Software {

	String name
	String descr
	SoftwareType softwareType
	Language language
	SourcingType sourcingType
	DbSchema dbSchema
	String pathBin
	String pathDoc
	String notes
	Date dateCreated
	Date lastUpdated
	Date productionDate
	Date endDate
	
	static hasMany = [ itpersons: ITPerson,  keypersons: KeyPerson, clientorganizations: ClientOrganization, linkedsoftwares: LinkedSoftware]
	
	static def open = {value, self ->
		if (!value) return true
		if (value.endDate && value.endDate <= (self?.dateCreated ?: new Date()))
			return ['validator.closed', self?.dateCreated ?: new Date()]
		return true
	}

	static constraints = {
		name maxSize: 30, unique: true, blank:false
		descr blank:false, maxSize: 500
		softwareType validator:open
		language validator:open
		sourcingType validator:open
		dbSchema nullable:true, validator:open
		pathBin nullable:true, maxSize: 200
		pathDoc nullable:true, maxSize: 200
		notes nullable:true, maxSize: 1000
		productionDate nullable:true
		endDate nullable:true
		itpersons minSize:1 
		clientorganizations minSize:1
	}

	static mapping = {
		language fetch: 'join'
		softwareType fetch: 'join'
		sourcingType fetch: 'join'
		dbSchema fetch: 'join'
		sort "name"
	}		

	String toString() {
		"${this.name}"
	}
}
