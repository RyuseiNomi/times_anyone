//
//  GetReportsUsecase.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/20.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation
import Firebase

class GetReportsUsecase: GetReportProtocol {
    var reports = [Dictionary<String, Any>.Values]()
    let db = Firestore.firestore()
    
    /**
     * Get all reports from firestore
     */
    public func getAllReports(completion: @escaping ([Dictionary<String, Any>.Values])->()) {
        let reportDocRef = db.collection("reports")
        reportDocRef.getDocuments() { (querySnapshot, err) in
            if err == nil, let querySnapshot = querySnapshot {
                for report in querySnapshot.documents {
                    let data = report.data()
                    self.reports.append(data.values)
                }
                completion(self.reports)
            } else if err != nil {
                completion(self.reports)
                print("\(err)")
            }
        }
    }
}
