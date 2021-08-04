//
// 
// Project: RSSchool_T9
// 
// Author: Mikhail Skuratov
// On: 4.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SPZoomImageViewController: UIViewController, UIScrollViewDelegate {

    var index = Int()
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openImage()
        createButtonClose()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    let scrolForImage = UIScrollView()
    let imageView = UIImageView(image: UIImage("minsk-4"))
    
    func openImage(){
        imageView.image = images[index]
        let viewTemp = UIView()
        viewTemp.frame = view.frame
        print(view.frame)
        
        view.addSubview(viewTemp)
        
        scrolForImage.delegate = self
        
        viewTemp.addSubview(scrolForImage)
        scrolForImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrolForImage.topAnchor.constraint(equalTo: view.topAnchor),
            scrolForImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrolForImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrolForImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)


        ])
        scrolForImage.addSubview(imageView)
        scrolForImage.backgroundColor = UIColor.black
        scrolForImage.contentSize = imageView.image!.size
        scrolForImage.minimumZoomScale = view.frame.width / (imageView.image?.size.width)!
        let zoomWidth = view.frame.width / (imageView.image?.size.width)!
        let zoomHeight = view.frame.height / (imageView.image?.size.height)!
        
        let zoomScale = min(zoomWidth, zoomHeight)
        scrolForImage.zoomScale = zoomScale
        //imageView.frame.origin.y = 150
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }

    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView.frame.origin.y = (view.frame.height - imageView.frame.height) / 2 + scrollView.contentOffset.y
        imageView.frame.origin.x = (view.frame.width - imageView.frame.width) / 2 + scrollView.contentOffset.x
        return imageView
    }
    
    
    @objc func closeVC(button: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func createButtonClose(){
        let closeButton = UIButton(type: .custom)
        closeButton.backgroundColor = UIColor.black
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.layer.borderColor = UIColor.white.cgColor
        closeButton.layer.borderWidth = 1
        closeButton.layer.cornerRadius = 20
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = UIColor.white
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        closeButton.addTarget(self, action: #selector(closeVC), for: .touchUpInside)
    }
    
}
