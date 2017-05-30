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

final class ___FILEBASENAMEASIDENTIFIER___ViewController: UIViewController {
    
    // MARK: - Constants
    
    let spinnerToken = "spinner"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Injected vars

    var controller: ___FILEBASENAMEASIDENTIFIER___Controller!
    var adapter: ListAdapter!
    var spinnerSectionController: ListSectionController!
    
    // MARK: - Private vars

    // MARK: - Public vars

    var items: [String] = []
    var loading = false

    // MARK: - 

    deinit { printDeinit(file: #file) }
}


// MARK: - View lifecycle

extension ___FILEBASENAMEASIDENTIFIER___ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.adapter.collectionView = self.collectionView
        
        self.controller.doSomething()
    }
}


// MARK: - Public methods

extension ___FILEBASENAMEASIDENTIFIER___ViewController {
    func displaySomething() {
        self.adapter.performUpdates(animated: true, completion: nil)
    }
}


// MARK: - Private methods

fileprivate extension ___FILEBASENAMEASIDENTIFIER___ViewController {
    func loadNext(completion: () -> Void) {
        // user reached the end of the list, load next data here
    }
}


// MARK: - ListAdapterDataSource

extension ___FILEBASENAMEASIDENTIFIER___ViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var objects = self.items as [ListDiffable]
        
        if loading {
            objects.append(self.spinnerToken as ListDiffable)
        }
        
        return objects
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let obj = object as? String, obj == self.spinnerToken {
            return self.spinnerSectionController
        } else {
            let sectionController = ___FILEBASENAMEASIDENTIFIER___DataSectionController()
            sectionController.controller = self.controller
            return sectionController
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}


// MARK: - UIScrollViewDelegate

extension ___FILEBASENAMEASIDENTIFIER___ViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        if !loading && distance < 200 {
            loading = true
            adapter.performUpdates(animated: true, completion: nil)
            self.loadNext {
                self.loading = false
                self.adapter.performUpdates(animated: true, completion: nil)
            }
        }
    }
}

