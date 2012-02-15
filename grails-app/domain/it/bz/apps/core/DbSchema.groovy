package it.bz.apps.core

import java.util.Date;

class DbSchema {
	
	String descr
	Date endDate
	static belongsTo = [db: Db]
	
	static constraints = {
	  descr blank:false, maxSize: 200
	  endDate nullable:true
	}
		
	String toString() { "${this.descr}@${this.db.code}" }
	
	static def listOpenOn(Date validOn) {
		return DbSchema.createCriteria().list{
				or {
					isNull("endDate")
					gt ("endDate", validOn ?: new Date())					
				}
		}
	}
}
