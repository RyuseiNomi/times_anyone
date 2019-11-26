//
//  TimelineViewController.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/23.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation
import UIKit

class TimelineViewController: UIViewController
{
    let timelineView = UITableView()
    let buttonView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let createReportButton = UIButton()
    let reportPostPresenter = ReportPostPresenter()
    
    override func viewDidLoad() {
        /* Time line Table View Setting */
        timelineView.frame = view.bounds
        timelineView.dataSource = self
        timelineView.delegate = self
        view.addSubview(timelineView)
        
        /* Report Add Button View Setting */
        buttonView.layer.position = CGPoint(x: view.frame.width - view.frame.width/10, y: view.frame.height - view.frame.height/12)
        navigationController?.view.addSubview(buttonView)
        createReportButton.addTarget(self, action: Selector(("openPostModal")), for: .touchUpInside)
        buttonView.addSubview(createReportButton)
        buttonView.bringSubviewToFront(view)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        createReportButton.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        createReportButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        createReportButton.backgroundColor = UIColor(red: 0.3, green: 0.7, blue: 0.6, alpha: 1)
        createReportButton.setTitle("+", for: UIControl.State.normal)
        createReportButton.layer.cornerRadius = 30.0
    }
    
    @objc public func openPostModal() {
        let postModal = PostModalViewController()
        navigationController?.pushViewController(postModal, animated: true)
    }
}

extension TimelineViewController: UITableViewDataSource
{
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Get report count from firebase
        // See https://qiita.com/abouch/items/3617ce37c4dd86932365
        return 10
    }
    
    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Show report content each cell field
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "row \(indexPath.row)"
        return cell
    }
}

extension TimelineViewController: UITableViewDelegate
{
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ReportDetailViewController()
        vc.titleLabel.text = "row \(indexPath.row)"
        navigationController?.pushViewController(vc, animated: true)
    }
}
