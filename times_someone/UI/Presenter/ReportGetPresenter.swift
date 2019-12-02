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
    /**
     * Show reports who one person of
     */
    @objc func getReports() {
        self.getGetReportsUsecase().getAllReports()
    }
    
    private func getGetReportsUsecase() -> GetReportsUsecase {
        let getReportUsecase = GetReportsUsecase()
        return getReportUsecase
    }
}
