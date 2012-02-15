package it.bz.apps.core

class LanguageController extends BaseController {

		// Imposto model di BaseController
	def beforeInterceptor = {
		model = Language
	}
}
