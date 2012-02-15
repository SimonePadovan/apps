package it.bz.apps.core

class DbController extends BaseController {

	// Imposto model di BaseController
	def beforeInterceptor = {
		model = Db
	}
	
}