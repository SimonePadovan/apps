package it.bz.apps.core

import java.util.Date;

class SoftwareType {
	
	String code
	String descr
	Date endDate
	
	static constraints = {
	  code unique:true, maxSize: 15, blank:false
	  descr blank:false, maxSize: 200
	  endDate nullable:true
	}
		
	String toString() { "${this.code}" }
	
	static def listOpenOn(Date validOn) {
		return SoftwareType.createCriteria().list{
				or {
					isNull("endDate")
					gt ("endDate", validOn ?: new Date())					
				}
		}
	}	
}
