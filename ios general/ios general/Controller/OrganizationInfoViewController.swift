import Foundation
import UIKit
import SVProgressHUD

@objc public protocol OrganizationInfoViewControllerProtocol
{
    func setSelectedOrganization(organization: OrganizationMO)
}

class OrganizationInfoViewController: UIViewController
{
    weak var delegate: OrganizationInfoViewControllerProtocol?
    public var currentOrganization: OrganizationMO!
    public static let kEmployeesOrderHasChanged: String = "RandomizeOrderNotificationIdentifier"
    
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
        
        NotificationCenter.default.post(name: Notification.Name(OrganizationInfoViewController.kEmployeesOrderHasChanged), object: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func fetchOrganizationsButtonTapped(_ sender: UIButton)
    {
        var organizations = [OrganizationMO]()
        RequestManager.fetchOrganizations(data: { [weak self] data in
            if let rawOrganizations = data["organizations"] as? [Any]
            {
                if let rawOrganizationsAsArray = rawOrganizations as? [Any]
                {
                    for org in rawOrganizationsAsArray
                    {
                        if let organization = org as? [String: Any]
                        {
                            organizations.append(OrganizationMO.createOrganization(from: organization))
                            AppDelegate.shared().saveContext()
                        }
                    }
                    // TODO: notificate alert to show after data is loaded
                    let alert = UIAlertController(title: "Fetched Organizations", message: "Please choose one", preferredStyle: .actionSheet)
                    
                    for org in organizations
                    {
                        alert.addAction(UIAlertAction(title: org.name, style: .default) { action in
                            NSLog("Tapped: \(org)")
                            self?.delegate?.setSelectedOrganization(organization: org)
                            self?.navigationController?.popToRootViewController(animated: true)
                        })
                    }
                    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
                    self?.present(alert, animated: true)
                }
            }
        })
    }
    
    @IBAction func calculatePrimeNumberButtonTapped(_ sender: Any)
    {
        func calculatePrimeNumber() -> Int
        {
            var primeNumbers = [2]
            var iterator = 1
            while primeNumbers.count < 9999 // 10000th prime number
            {
                if isPrime(number: primeNumbers.last! + iterator)
                {
                    primeNumbers.append(primeNumbers.last! + iterator)
                    iterator = 1
                }
                else
                {
                    iterator += 1
                }
            }
            print("All: \(primeNumbers)")
            print("last prime: \(primeNumbers.last ?? 0)")
            return primeNumbers.last!
        }
        
        func isPrime(number: Int) -> Bool
        {
            if (number % 10) == 0 {return false} // 0: last digit 0
            if (number % 10) % 2 == 0 {return false} // 2: last digit divided by 2
            if (number % 10) == 5 {return false} // 5: last digit 5
            
            for i in 2..<number-1
            {
                if number % i == 0
                {
                    print("false: \(number)")
                    return false
                }
            }
            print("\t is true: \(number)")
            return true
        }
        
        SVProgressHUD.show()
        DispatchQueue.global(qos: .background).async
        {
            let methodStart = Date()
            let result = calculatePrimeNumber()
            let methodFinish = Date()
            let executionTime = methodFinish.timeIntervalSince(methodStart)
            print("Execution time: \(executionTime)")
            DispatchQueue.main.async
            {
                SVProgressHUD.dismiss()
                let alert = UIAlertController(title: "Success!", message: "10000th prime number is \(result)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
}







