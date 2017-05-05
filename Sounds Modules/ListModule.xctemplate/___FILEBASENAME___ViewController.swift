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
    
    @IBOutlet weak var collectionView: IGListCollectionView!
    
    // MARK: - Injected vars

    var controller: ___FILEBASENAMEASIDENTIFIER___Controller!
    var adapter: IGListAdapter!
    var spinnerSectionControllerType: IGListSectionController.Type!
    
    // MARK: - Private vars

    // MARK: - Public vars

    var items: [String] = []
    var loading = false

    // MARK: - 
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


// MARK: - IGListAdapterDataSource

extension ___FILEBASENAMEASIDENTIFIER___ViewController: IGListAdapterDataSource {
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        var objects = self.items as [IGListDiffable]
        
        if loading {
            objects.append(self.spinnerToken as IGListDiffable)
        }
        
        return objects
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        if let obj = object as? String, obj == self.spinnerToken {
            return self.spinnerSectionControllerType.init()
        } else {
            return ___FILEBASENAMEASIDENTIFIER___DataSectionController()
        }
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
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

