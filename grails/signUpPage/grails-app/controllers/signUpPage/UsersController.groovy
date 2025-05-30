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
        // redirect(action: "SignUpForm")

        if(user.validate()) {
            println "\nUser created: ${user.properties}\n"
            render(view: "SignUpForm", model: [user: user, created: true])
        } else {
            println "\nError creating user: ${user.errors}\n"
            render(view: "SignUpForm", model: [user: user, created: false])
        }
    }
}