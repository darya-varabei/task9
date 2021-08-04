//
// 
// Project: RSSchool_T9
// 
// Author: Mikhail Skuratov
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class RSItemViewController: UIViewController,  UICollectionViewDelegate{

    var checkTime = true
    var checkColor = UIColor.hexF3AF22()
    var collectionView: UICollectionView!
    let data = FillingData.data
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserDefaults.standard.set("1", forKey: "timerCheck")
        view.backgroundColor = UIColor.white
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        collectionView.register(SPImageCollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: { (_) in
            self.collectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
    
}

extension RSItemViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as! SPImageCollectionViewCell
        cell.setupImageView()
        switch data[indexPath.row] {
        case .gallery(let gallery):
            cell.imageView.image = gallery.coverImage
            cell.titleLabel.text = gallery.title
            cell.subTitleLabel.text = "Gallery"
        case .story(let story):
            cell.imageView.image = story.coverImage
            cell.titleLabel.text = story.title
            cell.subTitleLabel.text = "Story"
        }
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.clipsToBounds = true
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

}


extension RSItemViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let temp = view.safeAreaInsets.left
        
        let width = (view.bounds.width - 56 - temp * 2) / (414 - 56)
        return CGSize(width: 179 * width, height: 220 * width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        let temp = view.safeAreaInsets.left
        return UIEdgeInsets(top: 20, left: 20 + temp, bottom: 50 , right: 20 + temp)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyOrGallery = SPStoryAndGalleryViewController.init()
        
        storyOrGallery.data = data
        storyOrGallery.item = indexPath.row
        
        storyOrGallery.checkColor = checkColor
        storyOrGallery.checkTime = checkTime
        
        storyOrGallery.view.backgroundColor = UIColor.black
        storyOrGallery.modalPresentationStyle = UIModalPresentationStyle(rawValue: 0)!
        self.present(storyOrGallery, animated: true, completion: nil)
    }

}
