//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import IGListKit

final class ___FILEBASENAMEASIDENTIFIER___DataSectionController: IGListSectionController, IGListSectionType {
    
    weak var controller: ___FILEBASENAMEASIDENTIFIER___Controller!

    private var object: String?

    deinit { printDeinit(file: #file) }
        
    func numberOfItems() -> Int {
        return 1
    }

    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        assert(true, "Replace UICollectionViewCell with your cell")
        return collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
    }
    
    func didUpdate(to object: Any) {
        self.object = String(describing: object)
    }
    
    func didSelectItem(at index: Int) { }
}
