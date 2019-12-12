//
//  ReportRepository.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/20.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation

protocol GetReportProtocol {
    func getAllReports(completion: @escaping ([Report])->())
}

protocol SetReportProtocol {
    func setReport(content: String, completion: @escaping (Bool)->())
}
