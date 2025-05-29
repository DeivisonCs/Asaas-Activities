package signUpPage


class UserController {

    def index() {
        redirect(action: "SignUpForm")
    }

    def signUpForm() {
        render(view: "SignUpForm")
    }

    def save() {
        def user = new User(params)
        redirect(action: "SignUpForm")

        if(user.validate()) {
            println "User created: ${user.properties}"
            render(view: "signUpForm", model: [user: user, created: true])
        } else {
            println "Error creating user: ${user.errors}"
            render(view: "signUpForm", model: [user: user, created: false])
        }
    }
}