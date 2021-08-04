//
// 
// Project: RSSchool_T9
// 
// Author: Mikhail Skuratov
// On: 2.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SPGalleryViewController: SPStoryAndGalleryViewController, UICollectionViewDelegate {

    
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        collectionView.register(SPImageCollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        
    }


}

    extension SPGalleryViewController: UICollectionViewDataSource{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
            
            
            super.createButtonClose()
            super.createImageForTitel()
            

            return cell
        }

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 2
        }


    }


    extension SPGalleryViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let temp = view.safeAreaInsets.left

            let width = (view.bounds.width - 56 - temp * 2) / (414 - 56)
            return CGSize(width: 374 * width, height: 500 * width)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

            let temp = view.safeAreaInsets.left
            return UIEdgeInsets(top: 20, left: 20 + temp, bottom: 50 , right: 20 + temp)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 30
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 14
        }


    }

