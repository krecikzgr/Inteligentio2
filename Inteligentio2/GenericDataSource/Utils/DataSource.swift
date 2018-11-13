//
//  Form.swift
//  KDA
//
//  Created by Adrian Kaleta on 31/08/2018.
//  Copyright © 2018 GSD. All rights reserved.
//

import Foundation
import UIKit

typealias OnRowSelection = (IndexPath) -> Void

class DataSource: NSObject {
     var items: [CellConfiguratorType] = []
     var onRowSelection: OnRowSelection?
}

extension DataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConfigurator = items[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellConfigurator.reuseIdentifier, for: indexPath)
        cellConfigurator.update(cell: cell)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let onRowSelectionAction = self.onRowSelection else {
            return
        }
        self.onRowSelection!(indexPath)
    }
}

