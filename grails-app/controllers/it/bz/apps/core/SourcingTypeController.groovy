package it.bz.apps.core

class SourcingTypeController extends BaseController {

		// Imposto model di BaseController
	def beforeInterceptor = {
		model = SourcingType
	}
}
