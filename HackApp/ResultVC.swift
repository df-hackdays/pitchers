//
//  ResultVC.swift
//  HackApp
//
//  Created by Nirmal Patel on 2018-09-29.
//  Copyright © 2018 Nirmal Patel. All rights reserved.
//

import UIKit
import StitchCore

class ResultVC: UIViewController {
    
    var score: Int?
    var totalScore: Int?
    var points: String = ""
    var quizId: String?
    var quiz: Quiz?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor.white
        setupViews()
        
    }
    
    func showRating() {
        var rating = ""
        var color = UIColor.black
        guard let sc = score, let tc = totalScore else { return }
        let s = sc * 100 / tc
        if s < 10 {
            rating = "Poor"
            color = UIColor.darkGray
        }  else if s < 40 {
            rating = "Average"
            color = UIColor.blue
        } else if s < 60 {
            rating = "Good"
            color = UIColor.yellow
        } else if s < 80 {
            rating = "Excellent"
            color = UIColor.red
        } else if s <= 100 {
            rating = "Outstanding"
            color = UIColor.orange
        }
        lblRating.textColor=color
    }
    
    @objc func btnRestartAction() {
        if let vcs = navigationController?.viewControllers, vcs.count > 0 {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func setupViews() {
        self.view.addSubview(lblTitle)
        lblTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80).isActive=true
        lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        self.view.addSubview(lblScore)
        lblScore.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 0).isActive=true
        lblScore.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblScore.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lblScore.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        lblScore.text = "\(score!) / \(totalScore!)"
        
        self.view.addSubview(lblRating)
        lblRating.topAnchor.constraint(equalTo: lblScore.bottomAnchor, constant: 40).isActive=true
        lblRating.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblRating.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lblRating.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        showRating()
        
        self.view.addSubview(btnRestart)
        btnRestart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive=true
        btnRestart.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnRestart.widthAnchor.constraint(equalToConstant: 150).isActive=true
        btnRestart.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnRestart.addTarget(self, action: #selector(btnRestartAction), for: .touchUpInside)
        
        if let q = quiz {
            lblRating.text="You won \(q.points) points"
        }
    }
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
//        lbl.text="Your Score"
        lbl.textColor=UIColor.darkGray
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 46)
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblScore: UILabel = {
        let lbl=UILabel()
        lbl.text="CONGRATULATIONS"
        lbl.textColor=UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblRating: UILabel = {
        let lbl=UILabel()
        
        lbl.textColor=UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        
        return lbl
    }()
    
    let btnRestart: UIButton = {
        let btn = UIButton()
        btn.setTitle("Restart", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor=UIColor.orange
        btn.layer.cornerRadius=5
        btn.clipsToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }()
    
}
