//
//  Users.swift
//  TableView
//
//  Created by YOUNG on 2021/07/24.
//

import Foundation

struct Users: Codable {
    
    var workName: String?
    var countNum: Int?
    var setNum: Int?
    var minutes: Int?
    var date: String?
  

    
    init(workName: String?, countNum: Int?, setNum: Int?, minutes: Int?, date: String) {
        self.workName = workName
        self.countNum = countNum
        self.setNum = setNum
        self.minutes = minutes
        self.date = date
    }
    
    init(workName: String?, countNum: Int?, setNum: Int?, date: String) {
        self.workName = workName
        self.countNum = countNum
        self.setNum = setNum
        self.date = date
    }

    
}
