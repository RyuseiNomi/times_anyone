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
    var postedReports = [Report]()
    let timelineView = UITableView()
    var refreshController = UIRefreshControl()
    let buttonView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let createReportButton = UIButton()
    let reportGetPresenter = ReportGetPresenter()
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        /* Time line Table View Setting */
        timelineView.frame = view.bounds
        timelineView.dataSource = self
        timelineView.delegate = self
        timelineView.refreshControl = self.refreshController
        timelineView.register(ReportCell.self, forCellReuseIdentifier: "ReportCell") //Import Custom Cell Class
        refreshController.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMM", options: 0, locale: Locale(identifier: "ja_JP"))
        
        /* Report Add Button View Setting */
        buttonView.layer.position = CGPoint(x: view.frame.width - view.frame.width/10, y: view.frame.height - view.frame.height/12)
        navigationController?.view.addSubview(buttonView)
        createReportButton.addTarget(self, action: Selector(("openPostModal")), for: .touchUpInside)
        buttonView.addSubview(createReportButton)
        buttonView.bringSubviewToFront(view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadReports()
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
        postModal.modalPresentationStyle = .custom
        postModal.transitioningDelegate = self
        present(postModal, animated: true, completion: nil)
    }
    
    @objc private func loadReports() {
        reportGetPresenter.getReports() { fetchedReports in
            self.postedReports = fetchedReports
            self.view.addSubview(self.timelineView)
        }
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        reportGetPresenter.getReports() { fetchedReports in
            self.postedReports = fetchedReports
            self.timelineView.reloadData()
            sender.endRefreshing()
        }
    }
}

extension TimelineViewController: UITableViewDataSource
{
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postedReports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reportCell = tableView.dequeueReusableCell(withIdentifier: "ReportCell", for: indexPath)
        let date = self.postedReports[indexPath.row].createdAt.dateValue()
        
        reportCell.textLabel?.text = self.postedReports[indexPath.row].content
        reportCell.detailTextLabel?.text = formatter.string(from: date as Date)
        return reportCell
    }
}

extension TimelineViewController: UITableViewDelegate
{
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ReportDetailViewController()
        vc.titleLabel.text = "\(self.postedReports[indexPath.row].content)"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TimelineViewController: UIViewControllerTransitioningDelegate
{
    //Return Custom Modal View
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationViewController(presentedViewController: presented, presenting: presenting)
    }
}
