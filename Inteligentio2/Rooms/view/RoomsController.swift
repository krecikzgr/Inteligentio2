//
//  RoomsController.swift
//  Inteligentio2
//
//  Created by Adrian on 06/03/2019.
//  Copyright © 2019 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit


class RoomsController: UICollectionViewController, RoomsViewProtocol {
    var dataSource: CollectionViewDataSource?
    var presenter: RoomsPresenterProtocol?
    var roomsSection: CollectionViewSection<SwitchCell, SwitchCellData>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDataSource()
        self.initCollectionView()
        self.presenter = RoomsPresenter(view: self)
        self.presenter?.loadRooms(page: 0, size: 100)
    }


    convenience init() {
        self.init(collectionViewLayout: FlowLayoutLeftAlignment(spacing: 20.0))
    }

    func initCollectionView() {
        self.collectionView.backgroundColor = .mainBackground()
    }

    func initDataSource() {
        self.dataSource = CollectionViewDataSource(collectionView: self.collectionView)
        let sceneSection = CollectionViewSection<SwitchCell, SwitchCellData>.build { (section) in
            section.numberOfColumns = 1
        }
        self.sceneSection = sceneSection
        self.dataSource?.addSection(section: sceneSection)
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func set(rooms: [SwitchCellData]) {
        
    }
}
