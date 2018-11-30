//
//  MyTableViewExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 13/10/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func fadeVisibleCells() {
        self.reloadData()
        var delayCounter = 0.0
        for cell in self.visibleCells {
            cell.alpha = 0.0
            UIView.animate(withDuration: TimeInterval(delayCounter),animations: {
                cell.alpha = 1.0
            }, completion: nil)
            delayCounter += 0.0
        }
    }
    
}
