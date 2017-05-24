//
//  OrganizationInfoViewController.swift
//  ios general
//
//  Created by lokovna on 5/24/17.
//  Copyright © 2017 Darina Locovna. All rights reserved.
//

import Foundation
import UIKit

class OrganizationInfoViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NSLog("OrganizationInfoViewController is here")
    }
    
    @IBAction func calculateSlaryButtonTapped(_ sender: UIButton)
    {
        let alert = UIAlertController(title: "Skin Type", message: "Please Choose Skin Type", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
