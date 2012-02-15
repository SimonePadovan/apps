package it.bz.apps.core

class DbSchemaController extends BaseController {

	// Imposto model di BaseController
	def beforeInterceptor = {
		model = DbSchema
	}
	
}
