//
//  ScenesController.swift
//  Inteligentio2
//
//  Created by Adrian on 13/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit


class ScenesController: UICollectionViewController, ScenesViewProtocol {
    var dataSource: CollectionViewDataSource?
    var presenter: ScenesPresenterProtocol?
    var sceneSection: CollectionViewSection<SwitchCell, SwitchCellData>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initDataSource()
        self.initCollectionView()
        self.presenter = ScenesPresenter(view: self)
        self.presenter?.loadScenes(page: 0, size: 100)
    }


    convenience init() {
        self.init(collectionViewLayout: FlowLayoutLeftAlignment(spacing: 20.0))
    }

    func initCollectionView() {
        self.collectionView.backgroundColor = .mainBackground()
        self.collectionView.backgroundColor = UIColor.mainDark()
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

    func set(scenes: [SwitchCellData]) {
        self.sceneSection?.items = scenes;
        self.collectionView.reloadData()
    }
}

