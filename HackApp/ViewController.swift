//
//  ViewController.swift
//  HackApp
//
//  Created by Nirmal Patel on 2018-09-29.
//  Copyright © 2018 Nirmal Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var window: UIWindow?    
    var quiz: Quiz?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let q = quiz {
            lblTitle.text = q.shortDescription
            let v = QuizVC()
            v.quiz = q
            self.navigationController?.pushViewController(v, animated: false)
        }
        
        self.navigationController?.navigationBar.isHidden = false
        title = "DIGIKNOW"
        self.navigationItem.setHidesBackButton(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        
        setupViews()
        
    }
    
    @objc func btnGetStartedAction() {
        if let q = quiz {
            let v = QuizVC()
            v.quiz = q
            self.navigationController?.pushViewController(v, animated: true)
        }
    }
    
    func setupViews() {
        self.view.addSubview(lblTitle)
        lblTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive=true
        lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblTitle.widthAnchor.constraint(equalToConstant: 250).isActive=true
        lblTitle.heightAnchor.constraint(equalToConstant: 200).isActive=true
        lblTitle.isHidden = true
        self.view.addSubview(btnGetStarted)
        btnGetStarted.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnGetStarted.widthAnchor.constraint(equalToConstant: 150).isActive=true
        btnGetStarted.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnGetStarted.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive=true
        btnGetStarted.isHidden = true
    }
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
        lbl.text="Quiz App"
        lbl.textColor=UIColor.darkGray
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let btnGetStarted: UIButton = {
        let btn=UIButton()
        btn.setTitle("Get Started", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor.orange
        btn.layer.cornerRadius=5
        btn.layer.masksToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnGetStartedAction), for: .touchUpInside)
        return btn
    }()
}

