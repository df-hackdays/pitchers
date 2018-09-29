//
//  SurveyTabViewController.swift
//  HackApp
//
//  Created by Nirmal Patel on 2018-09-29.
//  Copyright © 2018 Nirmal Patel. All rights reserved.
//

import UIKit

class SurveyTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationItem.setHidesBackButton(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
