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
    var reports = [String :Any]()
    let db = Firestore.firestore()
    
    /**
     * Get all reports from firestore
     */
    public func getAllReports() {
        let reportDocRef = db.collection("reports")
        
        reportDocRef.whereField("content", isEqualTo: true).getDocuments() { (querySnapshot, err) in
            if err == nil, let querySnapshot = querySnapshot {
                for report in querySnapshot.documents {
                    let data = report.data()
                    print(data)
                }
            } else if err != nil {
                print("\(err)")
            }
        }
    }
}
