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
                for (index, report) in querySnapshot.documents.enumerated() {
                    let data = report.data()
                    //TODO Report構造体を利用してデータを追加する
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
