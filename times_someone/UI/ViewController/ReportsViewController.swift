//
//  ReportsController.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/18.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import UIKit

class ReportsViewController: UIViewController {

    let titleLabel = UILabel()
    let createReportButton = UIButton()
    
    let reportPostPresenter = ReportPostPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        titleLabel.text = "times_someone"
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        createReportButton.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        createReportButton.layer.position = CGPoint(x: view.frame.width - view.frame.width/10*2, y:view.frame.height - view.frame.height/10*2)
        createReportButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        createReportButton.setTitle("投稿", for: UIControl.State.normal)
        //TODO ターゲットをReportPostPresenterに向ける
        createReportButton.addTarget(self, action: #selector(reportPostPresenter.postReport), for: .touchUpInside)
        view.addSubview(createReportButton)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titleLabel.frame = view.bounds
    }

}

