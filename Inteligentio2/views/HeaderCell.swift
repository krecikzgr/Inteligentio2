//
//  VerticalCell.swift
//  Inteligentio2
//
//  Created by Adrian on 09/03/2019.
//  Copyright © 2019 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


public struct HeaderCellViewData {
    var identifier: Int?
    let title: String
    var icon: String?
}

public class HeaderCell: CollectionCell<HeaderCellViewData> {

    var titleLabel: UILabel?
    var containerView: UIView?
    var identifier: Int?
    var icon: UIImageView?

    struct Sizes {
        static let margin: CGFloat = 10;
        static let containerViewRadis: CGFloat = 10
        static let height: CGFloat = 100
        static let width: CGFloat = 150
    }

    fileprivate var switchSatusChanged: SwitchStatusChanged?

    open override func initialize() {
        self.myInit()
    }

    public override func updateFor(item: HeaderCellViewData) {
        self.titleLabel?.text = item.title
        self.identifier = item.identifier
        self.icon?.image = UIImage(named: item.icon ?? "")
    }

    func myInit() {
        self.initCell()
        self.initContainerView()
        self.initTitleLabel()
    }


    fileprivate func initCell() {
        self.backgroundColor = UIColor.clear
        self.selectedBackgroundView = nil
    }

    fileprivate func initContainerView() {
        self.containerView = UIView()
        self.containerView?.backgroundColor = .mainBackground()
        self.addSubview(self.containerView!)
        self.containerView?.layer.cornerRadius = Sizes.containerViewRadis

        self.containerView?.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-Sizes.margin)
            make.right.equalTo(self.snp.right).offset(-Sizes.margin)
            make.top.equalTo(self.snp.top).offset(Sizes.margin)
            make.left.equalTo(self.snp.left).offset(Sizes.margin)
            make.width.equalTo(Sizes.width)
            make.height.equalTo(Sizes.height)
        }
    }

    fileprivate func initTitleLabel() {
        self.titleLabel = UILabel()
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        self.titleLabel?.textColor = .white
        self.containerView?.addSubview(self.titleLabel!)

        self.titleLabel?.snp.makeConstraints({ (make) in
            make.bottom.equalTo(self.containerView!.snp.bottom).offset(-Sizes.margin)
            make.right.equalTo(self.containerView!.snp.right).offset(-Sizes.margin)
            make.top.equalTo(self.containerView!.snp.top).offset(Sizes.margin)
            make.left.equalTo(self.containerView!.snp.left).offset(Sizes.margin)
        })
    }
}
