//
//  ReportListViewController.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/23.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation
import UIKit

class ReportListViewController: UITableViewController
{
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 100
    }
    
    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "row \(indexPath.row)"
        return cell
    }
    
    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ReportsViewController()
        vc.titleLabel.text = "row \(indexPath.row)"
        navigationController?.pushViewController(vc, animated: true)
    }
}
