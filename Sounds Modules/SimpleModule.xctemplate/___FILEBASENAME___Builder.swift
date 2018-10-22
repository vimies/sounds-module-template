//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension ___VARIABLE_moduleName:identifier___Builder {
    static func getView() -> ___VARIABLE_moduleName:identifier___ViewController? {
        return self.instantiateViewController { vc in
            // Inject vars here
        }
    }
}

final class ___VARIABLE_moduleName:identifier___Builder: UIStoryboardBuilder {
    
    override class var name: String { return "___VARIABLE_moduleName:identifier___" }
    
    override class func setup(container: Container) {
        container.register(___VARIABLE_moduleName:identifier___Interactor.self) { r in
            return ___VARIABLE_moduleName:identifier___Interactor()
        }
        
        container.storyboardInitCompleted(___VARIABLE_moduleName:identifier___ViewController.self) { r, vc in
            vc.interactor = r.resolve(___VARIABLE_moduleName:identifier___Interactor.self)
            vc.interactor.view = vc
        }
    }
}
