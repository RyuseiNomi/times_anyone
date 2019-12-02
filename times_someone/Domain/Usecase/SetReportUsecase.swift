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
    let saveDocument = Firestore.firestore().collection("reports").document()
    /**
     * Set a new Report to firestore
     */
    public func setReport(content: String) {
        saveDocument.setData([
            "authorRef": "/users/taro",
            "content": content
        ]) { error in
            if error != nil {
                fatalError("\(error)")
            }
        }
    }
}
