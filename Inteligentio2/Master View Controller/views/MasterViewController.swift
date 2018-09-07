//
//  MasterViewController.swift
//  Inteligentio2
//
//  Created by Adrian on 29.08.2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import UIKit
import CoreData
import GenericDataSources

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var detailViewController: DetailViewController? = nil
    var managedObjectContext: NSManagedObjectContext? = nil

    var viewsToShow: [UIViewController] = []
    let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTableView()
        self.initData()
        self.tableView.reloadData()
    }


    func initData() {
        self.dataSource.items = [
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Scenes")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Rooms")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Events")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Sensors")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Schedule")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "SystemStatus")),
            CellConfigurator<MasterListCell>(viewData: MasterViewCellData(identifier: "", title: "Settings"))
        ]
    }

    func initTableView() {
        self.initLayout()
        self.tableView.dataSource = self.dataSource
        self.tableView.register(cellClass: MasterListCell.self)
        self.tableView.separatorStyle = .none
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

