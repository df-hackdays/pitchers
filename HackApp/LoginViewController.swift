//
//  LoginViewController.swift
//  HackApp
//
//  Created by Nirmal Patel on 2018-09-29.
//  Copyright © 2018 Nirmal Patel. All rights reserved.
//

import UIKit
import StitchCore
import StitchLocalMongoDBService
import StitchRemoteMongoDBService
import MongoSwiftMobile // required for BSON Documents

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var photos: [String] = []
    var quizArray: [Quiz] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? ManagePageViewController {
            destVC.photos = self.photos
            destVC.quizArray = self.quizArray
        }
    }
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let userText = usernameTextField.text else {
            return
        }
        guard let passText = passwordTextField.text else {
            return
        }
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        // Get a previously defined client
        do {
            let client = try Stitch.initializeDefaultAppClient(
                withClientAppID: "digiknow-mcfek"
            )
            // Log-in using an Anonymous authentication provider from Stitch
            // Then create a connection to a remote MongoDB instance
            // Finally pull documents from the remote instance and add them to MongoDB Mobile
            let credential = UserPasswordCredential.init(withUsername: userText, withPassword: passText)
            Stitch.defaultAppClient!.auth.login(withCredential: credential) { result in
                switch result {
                case .success:
                    let atlasMongoClient = client.serviceClient(fromFactory: remoteMongoClientFactory, withName: "mongodb-atlas")
                
                    client.callFunction(withName: "increment", withArgs: [userText, passText]) { result in
                        /* ... */
                    }
                    atlasMongoClient.db("digilearn").collection("digiquiz")
                        .find(Document()).asArray({ result in
//                            print(result)
                            switch result {
                            case .success(let result):
                                for eachDoc in result {
                                    if let quiz = Quiz(document: eachDoc) {
                                        self.quizArray.append(quiz)
                                    }
                                }
                                
                                print(self.quizArray)
                                
                                for (index, _) in self.quizArray.enumerated() {
                                    self.photos.append("photo\(index + 1)")
                                }
                                if self.photos.count > 0 {
                                    DispatchQueue.main.async {
                                        self.activityIndicator.stopAnimating()
                                        self.performSegue(withIdentifier: "showSurveys", sender: nil)
                                    }
                                    
                                }
                            case .failure(let error):
                                print("failed to find documents: \(error)")
                                DispatchQueue.main.async {
                                    self.activityIndicator.stopAnimating()
                                }
                            }
                        })
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
