//
//  MasterViewController.swift
//  Inteligentio2
//
//  Created by Adrian on 29.08.2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import UIKit
import CoreData

enum MainSection: Int {
    case scenes = 0
    case rooms = 1
    case events = 2
    case sensors = 3
    case schedule = 4
    case systemStatus = 5
    case settings = 6
}

class MasterViewController: UITableViewController {

    var viewsToShow: [UIViewController] = []
    var dataSource: MasterDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDataSource()
        self.initTableView()
        self.tableView.reloadData()
    }


    func initTableView() {
        self.initLayout()
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
        self.tableView.register(cellClass: MasterListCell.self)
        self.tableView.separatorStyle = .none
    }

    func initDataSource() {
        self.dataSource = MasterDataSource()
        self.dataSource?.onRowSelection = { [unowned self] index in
            switch index.row {
            case MainSection.scenes.rawValue:
                let viewController = ScenesController()
                self.splitViewController?.showDetailViewController(viewController, sender: self)
            case MainSection.sensors.rawValue:
                let viewController = SensorsController()
                self.splitViewController?.showDetailViewController(viewController, sender: self)
            default:
                break;
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

