package it.bz.apps.core

class SoftwareTypeController extends BaseController{
	// Imposto model di BaseController
	def beforeInterceptor = {
		model = SoftwareType
	}
}
    