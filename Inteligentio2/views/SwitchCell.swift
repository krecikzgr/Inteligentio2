//
//  SwitchCell.swift
//  Inteligentio2
//
//  Created by Adrian on 13/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation
import  UIKit

typealias SwitchStatusChanged = (Bool) -> Void

struct SwitchCellData {
    var identifier:String
    let title:String
    var switchDataState:Bool
    var switchSatusChanged: SwitchStatusChanged?
}

open class SwitchCell: UITableViewCell {

    var titleLabel:UILabel?
    var containerView:UIView?
    var identifier:String = ""
    var switchButton:UISwitch?
    fileprivate var switchSatusChanged: SwitchStatusChanged?


    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.myInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.myInit()
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
        self.selectionStyle = .none
    }

    fileprivate func initContainerView() {
        guard self.containerView == nil else {
            return
        }
        self.containerView =  UIView()
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
        //self.switchButton?.backgroundColor = .white
        self.switchButton?.tintColor = UIColor.switchBlueColor()
        self.switchButton?.onTintColor = UIColor.switchBlueColor()

        let margins = PlacementMargins(leftMargin: nil, rightMargin: -5, topMargin: 10, bottomMargin: -10)
        self.containerView?.add(child: self.switchButton!, configuration: margins)
    }

    @objc fileprivate func switchChangedState(){
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

extension SwitchCell: Updatable {
    typealias ViewData = SwitchCellData

    func update(viewData: SwitchCellData) {
        self.titleLabel?.text = viewData.title
        self.identifier = viewData.identifier
        self.switchButton?.isOn = viewData.switchDataState
        self.switchSatusChanged = viewData.switchSatusChanged
    }
}
