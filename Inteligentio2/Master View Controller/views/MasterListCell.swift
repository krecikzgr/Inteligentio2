//
//  MasterListCell.swift
//  Inteligentio2
//
//  Created by Adrian on 02.09.2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit

struct MasterViewCellData {
    var identifier:String
    let title:String
    //let iconName: IconNames
}

open class MasterListCell: UITableViewCell {

    var icon: UIImageView?
    var titleLabel:UILabel?
    var containerView:UIView?
    var identifier:String = ""



    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.myInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        self.myInit()
    }


    func myInit() {
        self.initCell()
        self.initContainerView()
        self.initImageButton()
        self.initTitleLabel()
    }

    fileprivate func initImageButton() {

        guard self.icon == nil else {
            return
        }

        self.icon = UIImageView()
        self.icon?.translatesAutoresizingMaskIntoConstraints = false
        self.icon?.tintColor = .white

        self.containerView!.addSubview(self.icon!)
        self.icon?.set(width: 32)
        self.icon?.setHeight(height: 32)
        self.icon?.alignIn(y: 0.0)
        self.icon?.pinToSuperviewLeft(spacing: 10)
    }

    fileprivate func initCell() {
        self.backgroundColor = UIColor.clear
        self.selectedBackgroundView = nil
    }

    fileprivate func initContainerView() {
        guard self.containerView == nil else {
            return
        }
        self.containerView =  UIView()
        self.containerView?.translatesAutoresizingMaskIntoConstraints = false
        self.containerView?.backgroundColor = UIColor.mainBackground()
        let placementMargins = PlacementMargins(leftMargin: 10, rightMargin: -10, topMargin: 10, bottomMargin: -10)
        self.containerView?.setHeight(height: 45)
        self.add(child: self.containerView!, configuration: placementMargins)
    }

    fileprivate func initTitleLabel() {
        guard self.titleLabel == nil else {
            return
        }
        self.titleLabel = UILabel()
        self.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        self.titleLabel?.textColor = .white

        let margins = PlacementMargins(leftMargin: nil, rightMargin: -5, topMargin: 10, bottomMargin: -10)
        self.containerView?.add(child: self.titleLabel!, configuration: margins)
        self.titleLabel?.pinTo(viewOnLeft: self.icon!, spacing: 10)
    }
}

extension MasterListCell: Updatable {
    typealias ViewData = MasterViewCellData

    func update(viewData: MasterViewCellData) {
        self.titleLabel?.text = viewData.title
        self.identifier = viewData.identifier
        //self.icon?.image = UIImage.global(image: viewData.iconName)
    }
}
