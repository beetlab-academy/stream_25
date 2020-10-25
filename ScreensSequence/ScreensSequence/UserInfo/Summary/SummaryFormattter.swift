//
//  SummaryFormattter.swift
//  ScreensSequence
//
//  Created by Krasa on 25.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import Foundation

class SummaryFormatter {
    func prettyPrinted(user: User, employer: Employer) -> String {
        var str = ""
        
        str += "Клиент:\n\(user.name)\n\(user.secondName)\n\(user.lastName)"
        str += "\n\nРаботодатель:\n\(employer.name)\n\(employer.inn)\n\(employer.job)"
        
        return str
    }
 }
