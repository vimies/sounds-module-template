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
import IGListKit

final class ___VARIABLE_moduleName:identifier___Builder: UIStoryboardBuilder {
    
    override class var name: String { get { return "___VARIABLE_moduleName:identifier___" } }
    
    override class func setup(container: Container) {
        container.register(___VARIABLE_moduleName:identifier___Controller.self) { r in
            let controller = ___VARIABLE_moduleName:identifier___Controller()
            // inject workers here
            return controller
        }
        
        container.storyboardInitCompleted(___VARIABLE_moduleName:identifier___ViewController.self) { r, vc in
            vc.controller = r.resolve(___VARIABLE_moduleName:identifier___Controller.self)
            vc.controller.view = vc
            vc.adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: vc, workingRangeSize: 0)
            vc.adapter.dataSource = vc
            vc.adapter.scrollViewDelegate = vc
            vc.spinnerSectionController = r.resolve(SpinnerSectionController.self)
        }
    }
}
