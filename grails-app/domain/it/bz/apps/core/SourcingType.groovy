package it.bz.apps.core

import java.util.Date;

class SourcingType {
	
	String descr
	Date endDate
	
	static constraints = {
	  descr blank:false, maxSize: 200
	  endDate nullable:true
	}
		
	String toString() { "${this.descr}" }

	static def listOpenOn(Date validOn) {
		return SourcingType.createCriteria().list{
				or {
					isNull("endDate")
					gt ("endDate", validOn ?: new Date())					
				}
		}
	}
}
