//
//  UIViewControllerExtension.swift
//  Inteligentio2
//
//  Created by Adrian on 07.09.2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewController {
    func initLayout() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.mainDark()
        self.tableView.backgroundColor = UIColor.mainDark()
    }
}
