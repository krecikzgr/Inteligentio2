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
    var roomsSection: CollectionViewSection<VerticalCell<RoomHeaderCell, HeaderCellViewData>, [HeaderCellViewData]>?

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
        self.collectionView.backgroundColor = .mainDark()
    }

    func initDataSource() {
        self.dataSource = CollectionViewDataSource(collectionView: self.collectionView)
        self.roomsSection = CollectionViewSection<VerticalCell<RoomHeaderCell, HeaderCellViewData>, [HeaderCellViewData]>.build { (section) in
            section.numberOfColumns = 1
            section.cellHeight = 80
            section.onItemClickAction = { item, indexPath in
                print("Did Select item at indexpath \(indexPath)")
            }
        }
        self.dataSource?.addSection(section: self.roomsSection!)
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func set(rooms: [HeaderCellViewData]) {
        self.roomsSection?.items = [rooms]
        self.collectionView.reloadData()
    }
}
