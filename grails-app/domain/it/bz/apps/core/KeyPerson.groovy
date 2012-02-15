package it.bz.apps.core

import it.bz.organization.core.Person

class KeyPerson {

	Person person
	boolean deleted = false
	
	static transients = [ 'deleted' ]
	
	static belongsTo = [ software:Software]

	static mapping = {
	//	id composite: ['person', 'software']
		version false
	}
	
	String toString() {
		"${this.software}.${this.person}"
	}
}
