package it.bz.apps.core

import java.util.Date;

class Db {
	
	String code
	String descr
	Date endDate
	
	static hasMany = [ dbschemas: DbSchema]
	
	static constraints = {
	  code unique:true, maxSize: 15, blank:false
	  descr blank:false, maxSize: 200
	  endDate nullable:true
	}

	static def listOpenOn(Date validOn) {
		return Db.createCriteria().list{
				or {
					isNull("endDate")
					gt ("endDate", validOn ?: new Date())					
				}
		}
	}	
	String toString() { "${this.descr}" }
}
