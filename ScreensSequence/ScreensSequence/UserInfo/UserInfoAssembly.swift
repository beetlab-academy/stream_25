//
//  UserInfoAssembly.swift
//  ScreensSequence
//
//  Created by Krasa on 25.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import UIKit

class UserInfoAssembly {
    private let storageAssembly = StorageAssembly()
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func nameViewController(with callback: NameViewControllerCallback) -> NameViewController {
        let vc = storyboard.instantiateViewController(identifier: "NameViewController") as! NameViewController
        vc.storage = storageAssembly.storage
        vc.callback = callback
        
        return vc
    }
    
    func jobViewController(with callback: JobViewControllerCallback) -> JobViewController {
        let vc = storyboard.instantiateViewController(identifier: "JobViewController") as! JobViewController
        vc.storage = storageAssembly.storage
        vc.callback = callback
        
        return vc
    }
    
    func summaryViewController(with callback: SummaryViewControllerCallback) ->  SummaryViewController {
        let vc = storyboard.instantiateViewController(identifier: "SummaryViewController") as! SummaryViewController
        vc.storage = storageAssembly.storage
        vc.callback = callback
        
        return vc
    }
}
