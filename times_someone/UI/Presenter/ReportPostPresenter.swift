//
//  ReportPostPresenter.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/21.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ReportPostPresenter: UIViewController, ReportPostView
{
    let saveDocument = Firestore.firestore().collection("reports").document()
    /**
     * Post report to firestore
     */
    @objc public func postReport(_ sender:SubmitButton) {
        self.getSetReportUsecase().setReport(content: sender.postContent!)
    }
    
    private func getSetReportUsecase() -> SetReportUsecase {
        let setReportUsecase = SetReportUsecase()
        return setReportUsecase
    }
}
