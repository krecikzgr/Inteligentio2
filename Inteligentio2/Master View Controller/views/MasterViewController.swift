//
//  MasterViewController.swift
//  Inteligentio2
//
//  Created by Adrian on 29.08.2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {

    var viewsToShow: [UIViewController] = []
    var dataSource:MasterDataSource?

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
            let viewController = ScenesController()
            self.splitViewController?.showDetailViewController(viewController, sender: self)
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

