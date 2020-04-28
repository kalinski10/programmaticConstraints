//
//  swipingController.swift
//  programmaticConstarints
//
//  Created by Kalin Balabanov on 28/04/2020.
//  Copyright © 2020 Kalin Balabanov. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .green
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    
}
