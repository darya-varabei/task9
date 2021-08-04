//
// 
// Project: RSSchool_T9
// 
// Author: Mikhail Skuratov
// On: 1.08.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SPStoryAndGalleryViewController: UIViewController, UIScrollViewDelegate {

    var data = FillingData.data
    var item = 0;
    let lineView = UIView()
    let label = UILabel()
    var scrolView = UIScrollView()
    let viewForText = UIView()
    
    var checkColor = UIColor.white
    var checkTime = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrolView.backgroundColor = UIColor.black
        scrolView.delegate = self

        scrolView.contentSize = CGSize(width: view.bounds.width, height: 658 * view.frame.width / 413)
        
        view.addSubview(scrolView)
        scrolView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrolView.topAnchor.constraint(equalTo: view.topAnchor),
            scrolView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrolView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrolView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        createButtonClose()
        createImageForTitel()
        
        switch data[item] {
        case .gallery(let gallery):
            createGallery(images: gallery.images)
        case .story(let story):
            createStory(text: story.text)
            
        }
        

    }
    override func viewDidAppear(_ animated: Bool) {
        switch data[item] {
        case .story(_):
            scrolView.contentSize.height = viewForText.frame.height + 30 + viewForText.frame.origin.y
        default:
            break
        }
        
    }
    
    
    func createStory(text: String){
        
        
        viewForText.layer.borderColor = UIColor.white.cgColor
        viewForText.layer.borderWidth = 1
        scrolView.addSubview(label)
        scrolView.addSubview(viewForText)
        
        
    
       
        
        label.font = UIFont(name: "Rockwell", size: 24.0)
        
        label.text = text
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.lineBreakMode = .byClipping
        label.numberOfLines = 100
        viewForText.layer.cornerRadius = 8
        
        viewForText.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 200),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60)

        ])
        
        NSLayoutConstraint.activate([
            
            viewForText.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 180),
            viewForText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            viewForText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            viewForText.bottomAnchor.constraint(equalTo: label.bottomAnchor)
            
        ])
        
        let viewSVG = SPViewSVG()
        scrolView.addSubview(viewSVG)
        viewSVG.type = item
        viewSVG.numberImage = 0
        viewSVG.translatesAutoresizingMaskIntoConstraints = false
        viewSVG.color = checkColor
        viewSVG.time = checkTime
        
        let viewSVG1 = SPViewSVG()
        scrolView.addSubview(viewSVG1)
        viewSVG1.type = item
        viewSVG1.numberImage = 1
        viewSVG1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewSVG.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 50),
            viewSVG.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            viewSVG.widthAnchor.constraint(equalToConstant: 75),
            viewSVG.heightAnchor.constraint(equalToConstant: 75)

        ])
        
        viewSVG1.color = checkColor
        viewSVG1.time = checkTime
        
        NSLayoutConstraint.activate([
            viewSVG1.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 50),
            viewSVG1.widthAnchor.constraint(equalToConstant: 75),
            viewSVG1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            viewSVG1.heightAnchor.constraint(equalToConstant: 75)

        ])
        
    }
    
    
    
    
    
    
    
    @objc func closeVC(button: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func openImage(button: UIButton){
        
        
        let zoomImage = SPZoomImageViewController.init()
        
    
        zoomImage.index = button.tag
        
        switch data[item] {
        case .gallery(let gallery):
            zoomImage.images = gallery.images
        case .story(_):
            break
        }
        
        zoomImage.view.backgroundColor = UIColor.black
        zoomImage.modalPresentationStyle = UIModalPresentationStyle(rawValue: 0)!
        self.present(zoomImage, animated: true, completion: nil)
        
    }
    
    func createButtonClose(){
        let closeButton = UIButton(type: .custom)
        closeButton.backgroundColor = UIColor.black
        scrolView.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.layer.borderColor = UIColor.white.cgColor
        closeButton.layer.borderWidth = 1
        closeButton.layer.cornerRadius = 20
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = UIColor.white
        
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.trailingAnchor.constraint(equalTo: scrolView.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            closeButton.topAnchor.constraint(equalTo: scrolView.topAnchor, constant: 20)
        ])
        closeButton.addTarget(self, action: #selector(closeVC), for: .touchUpInside)
    }
    
    func createImageForTitel(){
        let viewImage = UIView()
        viewImage.layer.cornerRadius = 8
        viewImage.layer.borderWidth = 1
        viewImage.layer.borderColor = UIColor.white.cgColor
        
        viewImage.translatesAutoresizingMaskIntoConstraints = false
        scrolView.addSubview(viewImage)
        NSLayoutConstraint.activate([
            viewImage.trailingAnchor.constraint(equalTo: scrolView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            viewImage.leadingAnchor.constraint(equalTo: scrolView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            viewImage.topAnchor.constraint(equalTo: scrolView.topAnchor, constant: 100),
            viewImage.heightAnchor.constraint(equalToConstant: 500 * ((view.frame.width - 40) / 374))

        ])

        var widthLabel: CGFloat
        let titleLabel = UILabel()
        let typeLabel = UILabel()
        let titleImage = UIImageView()
        switch data[item] {
        case .gallery(let gallery):
            titleImage.image = gallery.coverImage
            typeLabel.text = "Gallery"
            widthLabel = 152
            titleLabel.text = gallery.title
            scrolView.contentSize.height = scrolView.contentSize.height + CGFloat((531 * Int(view.frame.width)/413 * gallery.images.count)) + 20
        case .story(let story):
            titleImage.image = story.coverImage
            typeLabel.text = "Story"
            widthLabel = 122
            titleLabel.text = story.title
            
            //fix: height
            scrolView.contentSize.height = 5000
        }
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        viewImage.addSubview(titleImage);
        titleImage.layer.cornerRadius = 8

        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: viewImage.topAnchor),
            titleImage.bottomAnchor.constraint(equalTo: viewImage.bottomAnchor),
            titleImage.leadingAnchor.constraint(equalTo: viewImage.leadingAnchor),
            titleImage.trailingAnchor.constraint(equalTo: viewImage.trailingAnchor),
        ])

        titleImage.contentMode = .scaleAspectFill
        titleImage.clipsToBounds = true


        let viewForText = UIView()


        viewForText.layer.cornerRadius = 8
        viewForText.translatesAutoresizingMaskIntoConstraints = false
        viewForText.layer.backgroundColor = UIColor.black.cgColor
        viewForText.layer.borderColor = UIColor.white.cgColor
        viewForText.layer.borderWidth = 1
        scrolView.addSubview(viewForText)



        NSLayoutConstraint.activate([
            viewForText.topAnchor.constraint(equalTo: viewImage.topAnchor, constant: 500 * ((view.frame.width - 40) / 374) - 20),
            viewForText.heightAnchor.constraint(equalToConstant:40),
            viewForText.widthAnchor.constraint(equalToConstant: widthLabel),
            viewForText.centerXAnchor.constraint(equalTo: viewImage.centerXAnchor)
        ])


        typeLabel.font = UIFont(name: "Rockwell", size: 24.0)
        typeLabel.textColor = UIColor.white
        typeLabel.textAlignment = .center
        viewForText.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: viewForText.topAnchor, constant: 8),
            typeLabel.heightAnchor.constraint(equalToConstant: 29),
            typeLabel.centerXAnchor.constraint(equalTo: viewForText.centerXAnchor)
        ])



        let viewGrad = UIView()

        //viewGrad.backgroundColor = UIColor.white

        let lay = CAGradientLayer()
        lay.colors = [UIColor(white: 0, alpha: 0).cgColor,
                      UIColor(white: 0, alpha: 1).cgColor]

        lay.locations = [0.0 , 1.0]
        lay.frame = CGRect(x: 0, y: 0, width: 1000, height: 200)
        viewGrad.layer.insertSublayer(lay, at: 0)


        viewImage.addSubview(viewGrad)


        viewGrad.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewGrad.bottomAnchor.constraint(equalTo: viewImage.bottomAnchor),
            viewGrad.leadingAnchor.constraint(equalTo: viewImage.leadingAnchor),
            viewGrad.trailingAnchor.constraint(equalTo: viewImage.trailingAnchor),
            viewGrad.topAnchor.constraint(equalTo: viewImage.bottomAnchor, constant: -200),
        ])



        titleLabel.font = UIFont(name: "Rockwell", size: 48.0)
        titleLabel.textColor = UIColor.white
        var height:CGFloat = 116
        titleLabel.numberOfLines = 2
        if (titleLabel.text!.count < 12) {
            height = 58
            titleLabel.numberOfLines = 1

        }

        viewImage.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.lineBreakMode = NSLineBreakMode(rawValue: 2)!
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: viewImage.bottomAnchor, constant: -55),
            titleLabel.leadingAnchor.constraint(equalTo: viewImage.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: height)
        ])
        lineView.backgroundColor = UIColor.white;
        lineView.translatesAutoresizingMaskIntoConstraints = false
        scrolView.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: viewImage.bottomAnchor, constant: 58),
            lineView.leadingAnchor.constraint(equalTo: scrolView.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            lineView.trailingAnchor.constraint(equalTo: scrolView.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
    }
    
    
    func createGallery(images: [UIImage]) {

        var arrayView = [UIView]()
        var i = 0

        while i < images.count {

            let viewForImage = UIButton()
            viewForImage.layer.backgroundColor = UIColor.black.cgColor
            viewForImage.layer.borderWidth = 1
            viewForImage.layer.borderColor = UIColor.white.cgColor
            viewForImage.layer.cornerRadius = 8
            scrolView.addSubview(viewForImage)

            viewForImage.tag = i
            var  topConstraint = viewForImage.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 40)
            if i > 0 {
                topConstraint = viewForImage.topAnchor.constraint(equalTo: arrayView[i-1].bottomAnchor, constant: 20)
            }
            let height = view.bounds.width / 413
            viewForImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                topConstraint,
                viewForImage.leadingAnchor.constraint(equalTo: scrolView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                viewForImage.trailingAnchor.constraint(equalTo: scrolView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                                            
                viewForImage.heightAnchor.constraint(equalToConstant: 512 * height)
            ])
            arrayView.append(viewForImage)
            
            let imageView = UIImageView()
            imageView.image = images[i]
            viewForImage.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 8
            
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: viewForImage.topAnchor, constant: 10),
                imageView.leadingAnchor.constraint(equalTo: viewForImage.leadingAnchor, constant: 10),
                imageView.trailingAnchor.constraint(equalTo: viewForImage.trailingAnchor, constant: -10),
                imageView.bottomAnchor.constraint(equalTo: viewForImage.bottomAnchor, constant: -10)
            ])
            
            viewForImage.addTarget(self, action: #selector(openImage), for: .touchUpInside)
            i += 1
        }
    }
}


    


