//
//  testvcViewController.swift
//  HackApp
//
//  Created by Naqi Rizvi on 2018-09-29.
//  Copyright © 2018 Nirmal Patel. All rights reserved.
//

import UIKit
// import the necessary modules to work with Stitch and MongoDB Mobile
import StitchCore
import StitchLocalMongoDBService
import StitchRemoteMongoDBService
import MongoSwiftMobile // required for BSON Documents

class testvcViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Get a previously defined client
        do {
            let client = try Stitch.initializeDefaultAppClient(
                withClientAppID: "digiknow-mcfek"
            )
            // Log-in using an Anonymous authentication provider from Stitch
            // Then create a connection to a remote MongoDB instance
            // Finally pull documents from the remote instance and add them to MongoDB Mobile
            client.auth.login(withCredential: AnonymousCredential()) { result in
                switch result {
                case .success:
                    let atlasMongoClient = client.serviceClient(fromFactory: remoteMongoClientFactory, withName: "mongodb-atlas")
                    
                    // let queryDoc = Document()
                    
                    atlasMongoClient.db("digilearn").collection("digiquiz")
                        .find(Document()).asArray({ result in switch result {
                        case .success(let result):
                            print(result)
                        case .failure(let error):
                            print("failed to find documents: \(error)")
                            }
                        })
                case .failure(let error):
                    print("failed to login: \(error)")
                }
            }
        } catch _ {
            print("error")
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
