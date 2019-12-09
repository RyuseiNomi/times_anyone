//
//  ReportGetPresenter.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/20.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation

class ReportGetPresenter: ReportsView
{
    var fetchedReports = [Dictionary<String, Any>.Values]()
    /**
     * Show reports who one person of
     */
    func getReports(completion: @escaping ([Dictionary<String, Any>.Values])->()) {
        self.getGetReportsUsecase().getAllReports() { reports in
            for key in reports{
                self.fetchedReports.append(key)
            }
            completion(self.fetchedReports)
        }
    }
    
    private func getGetReportsUsecase() -> GetReportsUsecase {
        let getReportUsecase = GetReportsUsecase()
        return getReportUsecase
    }
}
