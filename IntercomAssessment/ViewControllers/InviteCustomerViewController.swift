


import UIKit


class InviteCustomerViewController: UIViewController {

    @IBOutlet weak var customerTableView: UITableView!
    var viewModel = InviteCustomerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchAllCustomers()
        customerTableView.tableFooterView = UIView()
    }

}
extension InviteCustomerViewController: InviteCustomerViewModelDelegate {
    func didFetchCustomersToInvite() {
        //reload the table with the list of customers to invite
        customerTableView.reloadData()
    }
}

extension InviteCustomerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.customersToInvite.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customer = viewModel.customersToInvite[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell", for: indexPath)
        cell.textLabel?.text = customer.name
        cell.detailTextLabel?.text = String(customer.userId)
        return cell
    }
}
