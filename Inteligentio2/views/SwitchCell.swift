//
//  SwitchCell.swift
//  Inteligentio2
//
//  Created by Adrian on 13/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import UIKit

typealias SwitchStatusChanged = (Bool) -> Void

public struct SwitchCellData {
    var identifier: Int?
    let title: String
    var switchDataState: Bool
    var switchSatusChanged: SwitchStatusChanged?
}

public class SwitchCell: CollectionCell<SwitchCellData> {

    var titleLabel: UILabel?
    var containerView: UIView?
    var identifier: Int?
    var switchButton: UISwitch?
    fileprivate var switchSatusChanged: SwitchStatusChanged?

    open override func initialize() {
        self.myInit()
    }

    public override func updateFor(item: SwitchCellData) {
        self.titleLabel?.text = item.title
        self.identifier = item.identifier
        self.switchButton?.isOn = item.switchDataState
        self.switchSatusChanged = item.switchSatusChanged
    }

    func myInit() {
        self.initCell()
        self.initContainerView()
        self.initSwichButton()
        self.initTitleLabel()
    }


    fileprivate func initCell() {
        self.backgroundColor = UIColor.clear
        self.selectedBackgroundView = nil

    }

    fileprivate func initContainerView() {
        guard self.containerView == nil else {
            return
        }
        self.containerView = UIView()
        self.containerView?.translatesAutoresizingMaskIntoConstraints = false
        self.containerView?.backgroundColor = UIColor.mainBackground()
        let placementMargins = PlacementMargins(leftMargin: 10, rightMargin: -10, topMargin: 10, bottomMargin: -10)
        self.add(child: self.containerView!, configuration: placementMargins)
        self.containerView?.setHeight(height: 45)
    }

    fileprivate func initSwichButton() {
        guard self.switchButton == nil else {
            return
        }
        self.switchButton = UISwitch()
        self.switchButton?.translatesAutoresizingMaskIntoConstraints = false
        self.switchButton?.tintColor = UIColor.switchBlueColor()
        self.switchButton?.onTintColor = UIColor.switchBlueColor()

        let margins = PlacementMargins(leftMargin: nil, rightMargin: -5, topMargin: 10, bottomMargin: -10)
        self.containerView?.add(child: self.switchButton!, configuration: margins)
    }

    @objc fileprivate func switchChangedState() {
        guard let switchAction = self.switchSatusChanged else {
            return
        }
        switchAction(self.switchButton?.isOn ?? false)
    }

    fileprivate func initTitleLabel() {
        guard self.titleLabel == nil else {
            return
        }
        self.titleLabel = UILabel()
        self.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        self.titleLabel?.textColor = .white

        let margins = PlacementMargins(leftMargin: 5, rightMargin: nil, topMargin: 10, bottomMargin: -10)
        self.containerView?.add(child: self.titleLabel!, configuration: margins)
        self.titleLabel?.pinTo(viewOnRight: self.switchButton!, spacing: -5)
    }
}
