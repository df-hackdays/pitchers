//
//  RegisterVC.swift
//  HackApp
//
//  Created by Naqi Rizvi on 2018-09-29.
//  Copyright © 2018 Nirmal Patel. All rights reserved.
//

import UIKit
import StitchCore
import StitchLocalMongoDBService
import StitchRemoteMongoDBService

class RegisterVC: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        guard let firstNameText = firstNameTextField.text else {
            return
        }
        guard let lastNameText = lastNameTextField.text else {
            return
        }
        guard let emailAddressText = emailAddressTextField.text else {
            return
        }
        guard let passwordText = passwordTextField.text else {
            return
        }
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        do {
            let client = try Stitch.initializeDefaultAppClient(
                withClientAppID: "digiknow-mcfek"
            )
            let credential = UserPasswordCredential.init(withUsername: "abc@xyz.com", withPassword: "123456")
            Stitch.defaultAppClient!.auth.login(withCredential: credential) { result in
                switch result {
                case .success:
                    client.callFunction(withName: "adduserinfo", withArgs: [firstNameText, lastNameText, emailAddressText, passwordText]) { result in
                        /* ... */
                        switch result {
                        case .success:
                            self.dismiss(animated: true)
                        case .failure(let error):
                            print("failed to login: \(error)")
                            DispatchQueue.main.async {
                                self.activityIndicator.stopAnimating()
                            }
                        }
                    }
                case .failure(let error):
                    print("failed to login: \(error)")
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                    }
                }
            }
        } catch _ {
            print("error")
            self.activityIndicator.stopAnimating()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
