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
    let saveDocument = Firestore.firestore().collection("reports").document()
    var isSuccess = true
    var userRef: DocumentReference!
    
    /**
     * Set a new Report to firestore
     */
    public func setReport(content: String, completion: @escaping (Bool)->()) {
        self.getUserReference() { userRef in
            self.userRef = userRef
        }
        saveDocument.setData([
            "authorRef": self.userRef,
            "content": content
        ]) { error in
            if error != nil {
                fatalError("\(error)")
                self.isSuccess = false
                completion(self.isSuccess)
            }
            print(self.isSuccess)
            completion(self.isSuccess)
        }
    }
    
    private func getUserReference(completion: @escaping (DocumentReference)->()) {
        let userRefString = db.collection("users").document("taro")
        let userRef = db.document(userRefString.path)
        print(userRef)
        completion(userRef)
    }
}
