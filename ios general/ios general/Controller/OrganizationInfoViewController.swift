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
        var employees = Array(currentOrganization.employees!)
        
        for i in employees.startIndex ..< employees.endIndex - 1
        {
            let j = Int(arc4random_uniform(UInt32(employees.endIndex - i))) + i
            if i != j
            {
                swap(&employees[i], &employees[j])
            }
        }
        for e in employees
        {
            let x = employees.index(of: e)
            let index = Int64(Int(x!))
            e.orderID = index
            NSLog("OrderID in sortedEmployees: %lld - %@", e.orderID, e)
        }
        AppDelegate.shared().saveContext()
        NotificationCenter.default.post(name: Notification.Name(kEmployeesOrderHasChanged), object: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func fetchOrganizationsButtonTapped(_ sender: UIButton)
    {
        let x: AnyObject = 123 as AnyObject
        RequestManager.fetchOrganizations(["Lol":x])
    }
}







