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
    var cellType:
}

protocol ViewSection {
    associatedtype T
    var items:[T] {get set}
}

extension ViewSection {
    func getHeaderTitle() -> String? {
        return nil
    }

    func getHeaderView() -> UIView? {
        return nil
    }
}

class TableViewViewModel<T:ViewSection, Cell:UITableViewCell>:NSObject,UITableViewDataSource where Cell:ConfigurableCell, Cell.T == T.T {
    var sections:[T]

    init(sections:[T]) {
        self.sections = sections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: Cell.self)




        return cell!
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].getHeaderTitle()
    }

}
