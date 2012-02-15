package it.bz.apps.core



import org.junit.*
import grails.test.mixin.*

@TestFor(SourcingTypeController)
@Mock(SourcingType)
class SourcingTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sourcingType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sourcingTypeInstanceList.size() == 0
        assert model.sourcingTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.sourcingTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sourcingTypeInstance != null
        assert view == '/sourcingType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sourcingType/show/1'
        assert controller.flash.message != null
        assert SourcingType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sourcingType/list'


        populateValidParams(params)
        def sourcingType = new SourcingType(params)

        assert sourcingType.save() != null

        params.id = sourcingType.id

        def model = controller.show()

        assert model.sourcingTypeInstance == sourcingType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sourcingType/list'


        populateValidParams(params)
        def sourcingType = new SourcingType(params)

        assert sourcingType.save() != null

        params.id = sourcingType.id

        def model = controller.edit()

        assert model.sourcingTypeInstance == sourcingType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sourcingType/list'

        response.reset()


        populateValidParams(params)
        def sourcingType = new SourcingType(params)

        assert sourcingType.save() != null

        // test invalid parameters in update
        params.id = sourcingType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sourcingType/edit"
        assert model.sourcingTypeInstance != null

        sourcingType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sourcingType/show/$sourcingType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sourcingType.clearErrors()

        populateValidParams(params)
        params.id = sourcingType.id
        params.version = -1
        controller.update()

        assert view == "/sourcingType/edit"
        assert model.sourcingTypeInstance != null
        assert model.sourcingTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sourcingType/list'

        response.reset()

        populateValidParams(params)
        def sourcingType = new SourcingType(params)

        assert sourcingType.save() != null
        assert SourcingType.count() == 1

        params.id = sourcingType.id

        controller.delete()

        assert SourcingType.count() == 0
        assert SourcingType.get(sourcingType.id) == null
        assert response.redirectedUrl == '/sourcingType/list'
    }
}
