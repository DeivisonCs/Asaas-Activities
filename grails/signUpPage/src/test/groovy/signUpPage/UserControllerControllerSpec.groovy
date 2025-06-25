package signUpPage

import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification

class UserControllerControllerSpec extends Specification implements ControllerUnitTest<UserControllerController> {

     void "test index action"() {
        when:
        controller.index()

        then:
        status == 200

     }
}
