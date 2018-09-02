//
//  ViewModel.swift
//  Inteligentio2
//
//  Created by Adrian on 02.09.2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit

protocol ViewItem {

}

class ViewSection {
    var items:[ViewItem] = []
}

class TableViewViewModel:NSObject {
    var sections:[ViewSection] = []
}

extension TableViewViewModel:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }

}
