import it.bz.apps.core.*
import it.bz.organization.core.Organization
import it.bz.organization.core.Person

class BootStrap {

    def init = { servletContext ->
		def sourcingType = new SourcingType(descr: 'Outsourcing').save()
		def l = new Language(descr: 'Java EE', code: 'JAVA').save()
		def l2 = new Language(descr: 'closed', code: 'CLOSE', endDate: new Date()-1).save()
		def st = new SoftwareType(descr: 'Web', code:'WEB').save()
		def db1 = new Db(descr: 'dbsd presso 9.5', code:'DBSD').save()
		def dbSchema = new DbSchema(descr:'lavoro_adm', db:db1).save()

		// Decommentare se deployato in Cloud:		
		//def org = Organization.get(1)
		//def p1 = Person.get(1)
		
		// Commentare se deployato in Cloud:
		def org = new Organization(descr:'uffcio xy', code:'19.5').save()
		def p1 = new Person(firstName:'Simone', lastName:'Padovan', username: 'admin', password: 'password',  enabled: true, organization:org).save()		
		def p2 = new Person(firstName:'Pinco', lastName:'Pallino', username: 'pinco', password: 'password',  enabled: true, organization:org).save()
		
		def s1 = new Software(name:'software 1', descr:'xxxxxxxxxxx', language:l, softwareType: st, sourcingType: sourcingType).save()

		new ITPerson(software:s1, person:p1).save()
		new ITPerson(software:s1, person:p2).save()
	}
    def destroy = {
    }
}
