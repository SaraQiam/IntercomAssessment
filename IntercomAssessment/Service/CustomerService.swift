


import Foundation

class CustomerService {
    //Get the file as string lines
    //convert each line to data and then decode to map to customer
    //if mapping of any line fails set success to false
    func getCustomers(completion: @escaping ([Customer]?, Bool) -> Void) {
        if let lines = ReadFile().lineByLineAsString("customers", "txt") {
            var customers = [Customer]()
            var success = true
            for line in lines {
                let data = Data(line.utf8)
                let decoder = JSONDecoder()
                if let response = try? decoder.decode(Customer.self, from: data) {
                    customers.append(response)
                } else {
                    print("Error parsing JSON")
                    success = false
                }
            }
            completion(customers, success)
            
        } else {
            completion(nil, false)
        }
    }
}
