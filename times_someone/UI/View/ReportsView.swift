//
//  ReportsView.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/21.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation

protocol ReportsView {
    func getReports(completion: @escaping ([Dictionary<String, Any>.Values])->())
}

protocol ReportPostView {
    func postReport(_ sender: SubmitButton)
}
