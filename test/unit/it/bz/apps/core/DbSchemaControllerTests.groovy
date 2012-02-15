package it.bz.apps.core



import org.junit.*
import grails.test.mixin.*

@TestFor(DbSchemaController)
@Mock(DbSchema)
class DbSchemaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dbSchema/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dbSchemaInstanceList.size() == 0
        assert model.dbSchemaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.dbSchemaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dbSchemaInstance != null
        assert view == '/dbSchema/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dbSchema/show/1'
        assert controller.flash.message != null
        assert DbSchema.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dbSchema/list'


        populateValidParams(params)
        def dbSchema = new DbSchema(params)

        assert dbSchema.save() != null

        params.id = dbSchema.id

        def model = controller.show()

        assert model.dbSchemaInstance == dbSchema
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dbSchema/list'


        populateValidParams(params)
        def dbSchema = new DbSchema(params)

        assert dbSchema.save() != null

        params.id = dbSchema.id

        def model = controller.edit()

        assert model.dbSchemaInstance == dbSchema
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dbSchema/list'

        response.reset()


        populateValidParams(params)
        def dbSchema = new DbSchema(params)

        assert dbSchema.save() != null

        // test invalid parameters in update
        params.id = dbSchema.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dbSchema/edit"
        assert model.dbSchemaInstance != null

        dbSchema.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dbSchema/show/$dbSchema.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dbSchema.clearErrors()

        populateValidParams(params)
        params.id = dbSchema.id
        params.version = -1
        controller.update()

        assert view == "/dbSchema/edit"
        assert model.dbSchemaInstance != null
        assert model.dbSchemaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dbSchema/list'

        response.reset()

        populateValidParams(params)
        def dbSchema = new DbSchema(params)

        assert dbSchema.save() != null
        assert DbSchema.count() == 1

        params.id = dbSchema.id

        controller.delete()

        assert DbSchema.count() == 0
        assert DbSchema.get(dbSchema.id) == null
        assert response.redirectedUrl == '/dbSchema/list'
    }
}
