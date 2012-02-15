package it.bz.apps.core

class LinkedSoftware {
	
    Software softwareLinked
	boolean deleted = false
	
	static transients = [ 'deleted' ]
	
	static belongsTo = [ software:Software ]

	static mapping = {
	//	id composite: ['person', 'software']
		version false
	}

	String toString() {
		"${this.software}.${this.softwareLinked}"
	}
}
