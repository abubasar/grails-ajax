import crm.Customer

class BootStrap {

    def init = { servletContext ->
		new Customer(firstName:"Arif",lastName:"Islam",email:"ariful.sec@gmail.com").save()
		new Customer(firstName:"Saif",lastName:"Rahman",email:"mutafiz.sec@gmail.com").save()
    }
    def destroy = {
    }
}
