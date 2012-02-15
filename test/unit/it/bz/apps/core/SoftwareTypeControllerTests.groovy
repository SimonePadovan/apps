package it.bz.apps.core



import org.junit.*
import grails.test.mixin.*

@TestFor(SoftwareTypeController)
@Mock(SoftwareType)
class SoftwareTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/softwareType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.softwareTypeInstanceList.size() == 0
        assert model.softwareTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.softwareTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.softwareTypeInstance != null
        assert view == '/softwareType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/softwareType/show/1'
        assert controller.flash.message != null
        assert SoftwareType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/softwareType/list'


        populateValidParams(params)
        def softwareType = new SoftwareType(params)

        assert softwareType.save() != null

        params.id = softwareType.id

        def model = controller.show()

        assert model.softwareTypeInstance == softwareType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/softwareType/list'


        populateValidParams(params)
        def softwareType = new SoftwareType(params)

        assert softwareType.save() != null

        params.id = softwareType.id

        def model = controller.edit()

        assert model.softwareTypeInstance == softwareType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/softwareType/list'

        response.reset()


        populateValidParams(params)
        def softwareType = new SoftwareType(params)

        assert softwareType.save() != null

        // test invalid parameters in update
        params.id = softwareType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/softwareType/edit"
        assert model.softwareTypeInstance != null

        softwareType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/softwareType/show/$softwareType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        softwareType.clearErrors()

        populateValidParams(params)
        params.id = softwareType.id
        params.version = -1
        controller.update()

        assert view == "/softwareType/edit"
        assert model.softwareTypeInstance != null
        assert model.softwareTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/softwareType/list'

        response.reset()

        populateValidParams(params)
        def softwareType = new SoftwareType(params)

        assert softwareType.save() != null
        assert SoftwareType.count() == 1

        params.id = softwareType.id

        controller.delete()

        assert SoftwareType.count() == 0
        assert SoftwareType.get(softwareType.id) == null
        assert response.redirectedUrl == '/softwareType/list'
    }
}
