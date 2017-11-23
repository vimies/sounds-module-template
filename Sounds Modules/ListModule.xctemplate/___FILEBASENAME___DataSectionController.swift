//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import IGListKit

final class ___VARIABLE_moduleName:identifier___DataSectionController: ListSectionController {
    
    weak var controller: ___VARIABLE_moduleName:identifier___Interactor!

    private var object: String?

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        fatalError("Replace UICollectionViewCell with your cell")
        // return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
    }
    
    override func didUpdate(to object: Any) {
        self.object = String(describing: object)
    }
}
