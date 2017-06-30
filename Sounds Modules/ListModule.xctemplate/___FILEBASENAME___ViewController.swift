//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

final class ___VARIABLE_moduleName:identifier___ViewController: UIViewController {
    
    // MARK: - Constants
    
    let spinnerToken = "spinner"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Injected vars

    var controller: ___VARIABLE_moduleName:identifier___Controller!
    var adapter: ListAdapter!
    var spinnerSectionController: ListSectionController!
    
    // MARK: - Private vars

    // MARK: - Public vars

    // MARK: - 

    deinit { printDeinit(file: #file) }
}


// MARK: - View lifecycle

extension ___VARIABLE_moduleName:identifier___ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.adapter.collectionView = self.collectionView
        
        self.controller.loadData()
    }
}


// MARK: - Public methods

extension ___VARIABLE_moduleName:identifier___ViewController {
    func updateList() {
        self.adapter.performUpdates(animated: true, completion: nil)
    }
}


// MARK: - Private methods

fileprivate extension ___VARIABLE_moduleName:identifier___ViewController { }


// MARK: - ListAdapterDataSource

extension ___VARIABLE_moduleName:identifier___ViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects = self.controller.items as [ListDiffable]
        
        if self.controller.isLoading {
            objects.append(self.spinnerToken as ListDiffable)
        }
        
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let obj = object as? String, obj == self.spinnerToken {
            return self.spinnerSectionController
        } else {
            let sectionController = ___VARIABLE_moduleName:identifier___DataSectionController()
            sectionController.controller = self.controller
            return sectionController
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}


// MARK: - UIScrollViewDelegate

extension ___VARIABLE_moduleName:identifier___ViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        if distance < 200 {
            self.controller.loadNextData()
        }
    }
}

