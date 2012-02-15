package it.bz.apps.core

import it.bz.organization.core.Organization

class ClientOrganization {
	
	Organization organization
	boolean deleted = false
	
	static transients = [ 'deleted' ]
	
	static belongsTo = [ software:Software]
	
	static mapping = {
	//	id composite: ['person', 'software']
		version false
	}
	
	String toString() {
		"${this.software}.${this.organization}"
	}

}
