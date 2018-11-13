//
//  ScenesPresenter.swift
//  Inteligentio2
//
//  Created by Adrian on 13/11/2018.
//  Copyright © 2018 AdrianKaleta. All rights reserved.
//

import Foundation

class ScenesPresenter:ScenesPresenterProtocol {

    var repository:ScenesRepositoryProtocol?

    func getScenes() {
        self.repository.g
    }

    func setRepository(repository:ScenesRepositoryProtocol) {

    }
}
