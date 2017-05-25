import Foundation
import UIKit

class OrganizationInfoViewController: UIViewController
{
    public var currentOrganization: OrganizationMO!
    let kEmployeesOrderHasChanged = "RandomizeOrderNotificationIdentifier"
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func calculateSalaryButtonTapped(_ sender: UIButton)
    {
        let sum = currentOrganization.employees!.reduce(0) {$0 + $1.salary}
        let alert = UIAlertController(title: "Calculate Salary", message: "Overall salary is: \(sum)", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func randomizeOrderButtonTapped(_ sender: UIButton)
    {
        NotificationCenter.default.post(name: Notification.Name(kEmployeesOrderHasChanged), object: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
