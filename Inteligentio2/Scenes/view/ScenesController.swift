//
//  ScenesController.swift
//  Inteligentio2
//
//  Created by Adrian on 13/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit


class ScenesController: UITableViewController, ScenesViewProtocol {
    var dataSource: ScenesDtaSource?
    let scenesRepository = ScenesRepository()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDataSource()
        self.initTableView()
        self.tableView.reloadData()

        self.scenesRepository.getAll(baseAddress: "http://192.168.0.111:3001/", page: 0, size: 0) { [unowned self] (result) in
            switch result {
            case let .success(objects):
                print("Success \(objects)")

            case let .failure(error):
                print("failure \(error)")
            }
        }
    }


    func initTableView() {
        self.initLayout()
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
        self.tableView.register(cellClass: SwitchCell.self)
        self.tableView.separatorStyle = .none
    }

    func initDataSource() {
        self.dataSource = ScenesDtaSource()
        self.dataSource?.onRowSelection = { [unowned self] index in
            print("Did Selec Scene with indexPath \(index)")
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

    func set(scenes: [SwitchCellData]) {
        self.dataSource?.setViewData(viewData: scenes)
        self.tableView.reloadData()
    }
}

