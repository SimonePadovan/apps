// Place your Spring DSL code here

beans = {
  customPropertyEditorRegistrar(it.bz.apps.editor.CustomDateEditorRegistrar) { 
     messageSource = ref('messageSource') 
  } 
}
