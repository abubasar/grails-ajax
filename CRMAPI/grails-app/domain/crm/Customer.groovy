package crm

class Customer {
	String firstName
	String lastName
	String email

    static constraints = {
		firstName(nullable:false)
		email(nullable:false)
    }
}
