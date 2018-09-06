//
//  Form.swift
//  KDA
//
//  Created by Adrian Kaleta on 31/08/2018.
//  Copyright © 2018 GSD. All rights reserved.
//

import Foundation
import UIKit

class DataSouce: NSObject {
     var items: [CellConfiguratorType] = []
}

extension DataSouce: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellConfigurator = items[(indexPath as NSIndexPath).row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellConfigurator.reuseIdentifier, for: indexPath)
        cellConfigurator.update(cell: cell)
        return cell
    }
}
