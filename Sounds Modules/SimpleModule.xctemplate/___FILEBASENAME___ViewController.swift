//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

final class ___VARIABLE_moduleName:identifier___ViewController: UIViewController {
    
    // MARK: - IBOutlets

    // MARK: - Injected vars
    
    var controller: ___VARIABLE_moduleName:identifier___Controller!
    
    // MARK: - Private vars

    // MARK: - Public vars

    // MARK: - 

    deinit { printDeinit(file: #file) }
}


// MARK: - View lifecycle

extension ___VARIABLE_moduleName:identifier___ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.controller.doSomething()
    }
}


// MARK: - Public methods

extension ___VARIABLE_moduleName:identifier___ViewController {
    func displaySomething() {
    }
}


// MARK: - Private methods

fileprivate extension ___VARIABLE_moduleName:identifier___ViewController {
}
