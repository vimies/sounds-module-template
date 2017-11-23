//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class ___VARIABLE_moduleName:identifier___Interactor {
    
    // MARK: - Injected vars
    
    weak var view: ___VARIABLE_moduleName:identifier___ViewController!
    
    // MARK: - Public vars

    var items: [String] = []
    var isLoading: Bool = false

    // MARK: - Private vars

    fileprivate var noMorePages: Bool = false
    fileprivate var page: Int = 0
}


// MARK: - Public methods

extension ___VARIABLE_moduleName:identifier___Interactor {
    func loadData() {
    	self.fetchNextData()
    }

    func loadNextData() {
    	self.fetchNextData()
    }
}


// MARK: - Private methods

extension ___VARIABLE_moduleName:identifier___Interactor {
	func fetchNextData() {
		guard noMorePages == false && isLoading == false else { return }
        isLoading = true


        view.updateList()
	}
}