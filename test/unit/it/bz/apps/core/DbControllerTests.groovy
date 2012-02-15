package it.bz.apps.core



import org.junit.*
import grails.test.mixin.*

@TestFor(DbController)
@Mock(Db)
class DbControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/db/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dbInstanceList.size() == 0
        assert model.dbInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.dbInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dbInstance != null
        assert view == '/db/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/db/show/1'
        assert controller.flash.message != null
        assert Db.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/db/list'


        populateValidParams(params)
        def db = new Db(params)

        assert db.save() != null

        params.id = db.id

        def model = controller.show()

        assert model.dbInstance == db
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/db/list'


        populateValidParams(params)
        def db = new Db(params)

        assert db.save() != null

        params.id = db.id

        def model = controller.edit()

        assert model.dbInstance == db
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/db/list'

        response.reset()


        populateValidParams(params)
        def db = new Db(params)

        assert db.save() != null

        // test invalid parameters in update
        params.id = db.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/db/edit"
        assert model.dbInstance != null

        db.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/db/show/$db.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        db.clearErrors()

        populateValidParams(params)
        params.id = db.id
        params.version = -1
        controller.update()

        assert view == "/db/edit"
        assert model.dbInstance != null
        assert model.dbInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/db/list'

        response.reset()

        populateValidParams(params)
        def db = new Db(params)

        assert db.save() != null
        assert Db.count() == 1

        params.id = db.id

        controller.delete()

        assert Db.count() == 0
        assert Db.get(db.id) == null
        assert response.redirectedUrl == '/db/list'
    }
}
