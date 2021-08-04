//
//
// Project: RSSchool_T9
// 
// Author: Mikhail Skuratov
// On: 03.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SPImageCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var subTitleLabel = UILabel()
    
    //var view = UIView()
    
    func setupImageView() {
        
        
        
        self.backgroundColor = UIColor.white
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 18
        self.layer.borderWidth = 1
        
        
        
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)

        
       
        
        let viewGrad = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 60))

        viewGrad.layer.cornerRadius = 10
        
        viewGrad.translatesAutoresizingMaskIntoConstraints = false
        
        let gradient = CAGradientLayer()

        gradient.frame = viewGrad.bounds
        gradient.colors = [UIColor(white: 0, alpha: 0).cgColor, UIColor(white: 0, alpha: 0.9).cgColor]
        viewGrad.layer.insertSublayer(gradient, at: 0)
        
        imageView.addSubview(viewGrad)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
                
            viewGrad.heightAnchor.constraint(equalToConstant: 60),
            viewGrad.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            viewGrad.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            viewGrad.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)

        ])
        setupTitle()
        setupSubTitel()
        
    }
    
    
    func setupTitle() {

        //titleLabel.text = "Test Test"
        
        titleLabel.font = UIFont(name: "Rockwell", size: 16.0)
        titleLabel.textColor = UIColor.white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(titleLabel)
        let bottonConstraint = titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -30)
        let leadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10)
        
        let tralingConstraint = titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)
        let heightConstraint = titleLabel.heightAnchor.constraint(equalToConstant: 19)
        
        NSLayoutConstraint.activate([bottonConstraint, leadingConstraint, tralingConstraint, heightConstraint])
    }
    
    func setupSubTitel() {
        //subTitleLabel.text = "Test Test"
        subTitleLabel.font = UIFont(name: "Rockwell", size: 12.0)
        subTitleLabel.textColor = UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(subTitleLabel)
        let bottonConstraint = subTitleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -13)
        let leadingConstraint = subTitleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10)
        let heightConstraint = subTitleLabel.heightAnchor.constraint(equalToConstant: 14)
        
        NSLayoutConstraint.activate([bottonConstraint, leadingConstraint, heightConstraint])
    }
    
    
    
    
}
