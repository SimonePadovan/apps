package it.bz.apps.core



import org.junit.*
import grails.test.mixin.*

@TestFor(SoftwareController)
@Mock(Software)
class SoftwareControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/software/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.softwareInstanceList.size() == 0
        assert model.softwareInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.softwareInstance != null
    }

    void testSave() {
        controller.save()

        assert model.softwareInstance != null
        assert view == '/software/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/software/show/1'
        assert controller.flash.message != null
        assert Software.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/software/list'


        populateValidParams(params)
        def software = new Software(params)

        assert software.save() != null

        params.id = software.id

        def model = controller.show()

        assert model.softwareInstance == software
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/software/list'


        populateValidParams(params)
        def software = new Software(params)

        assert software.save() != null

        params.id = software.id

        def model = controller.edit()

        assert model.softwareInstance == software
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/software/list'

        response.reset()


        populateValidParams(params)
        def software = new Software(params)

        assert software.save() != null

        // test invalid parameters in update
        params.id = software.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/software/edit"
        assert model.softwareInstance != null

        software.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/software/show/$software.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        software.clearErrors()

        populateValidParams(params)
        params.id = software.id
        params.version = -1
        controller.update()

        assert view == "/software/edit"
        assert model.softwareInstance != null
        assert model.softwareInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/software/list'

        response.reset()

        populateValidParams(params)
        def software = new Software(params)

        assert software.save() != null
        assert Software.count() == 1

        params.id = software.id

        controller.delete()

        assert Software.count() == 0
        assert Software.get(software.id) == null
        assert response.redirectedUrl == '/software/list'
    }
}
