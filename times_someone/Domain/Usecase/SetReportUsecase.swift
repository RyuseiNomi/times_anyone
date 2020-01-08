//
//  SetReportUsecase.swift
//  times_someone
//
//  Created by 能美龍星 on 2019/11/21.
//  Copyright © 2019 Ryusei Nomi. All rights reserved.
//

import Foundation
import Firebase

class SetReportUsecase: SetReportProtocol
{
    let db = Firestore.firestore()
    let reportDocument = Firestore.firestore().collection("users").document("taro").collection("reports").document()
    var isSuccess = true
    var userRef: DocumentReference!
    
    /**
     * Set a new Report to firestore
     */
    public func setReport(content: String, completion: @escaping (Bool)->()) {
        reportDocument.setData([
            "content": content,
            "createdAt": Timestamp(date: Date())
        ]) { error in
            if error != nil {
                fatalError("\(error)")
                self.isSuccess = false
                completion(self.isSuccess)
            }
            completion(self.isSuccess)
        }
    }
}
