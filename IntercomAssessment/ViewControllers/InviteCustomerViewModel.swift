


import Foundation

protocol InviteCustomerViewModelDelegate: class {
    func didFetchCustomersToInvite()
}

class InviteCustomerViewModel {

    weak var delegate: InviteCustomerViewModelDelegate?
    var customersToInvite = [Customer]()
    var allCustomers = [Customer]()

    func fetchAllCustomers() {
        //Get all customers
        CustomerService().getCustomers() { (customers, success) in
            if success {
                if let customers = customers {
                    self.allCustomers = customers
                    for customer in self.allCustomers {
                        //Calculate distance from customer location to Intercom office location
                        if let distance = CalculateDistance().fromIntercomDublin(customer.latitude, customer.longitude) {
                            customer.distanceFromIntercom = distance
                        }
                    }
                    self.fetchCustomersToInvite()
                }
            } else {
                print("Failed to get customers")
            }
        }
    }

    func fetchCustomersToInvite() {
        //filter from list of all customers where distance is less than or equal to 100 km
        customersToInvite = allCustomers.filter({ $0.distanceFromIntercom <= 100.00 })
        //sort by userId in ascending order
        customersToInvite.sort(by: { $0.userId < $1.userId})
        //inform delegate that list of customers to invite is ready
        self.delegate?.didFetchCustomersToInvite()
    }

}
