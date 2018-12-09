//
//  DetailViewController.swift
//  Netizens
//
//  Created by Krzysztof Lech on 09/12/2018.
//  Copyright © 2018 Krzysztof Lech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet private weak var blurBackgroundView: UIView!
    @IBOutlet private weak var imageContainerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Properties
    
    var item: Item!

    //MARK: - Life Cycles Methods
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        downloadImage()
        setupImageView()
        
        blurBackgroundView.alpha = 0.0
        imageContainerView.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startBackgroundViewAnimation()
        startImageViewAnimation()
    }
    
    //MARK: - Other Methods
    
    private func downloadImage() {
        ImageService.getImage(withUrl: item.url) { [weak self] (image) in
            self?.imageView.image = image
        }
    }
    
    private func setupImageView() {
        imageView.layer.borderWidth = 2
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowRadius = 20
        imageView.layer.shadowOpacity = 0.9
    }
    
    private func startBackgroundViewAnimation() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.blurBackgroundView.alpha = 0.7
        }
    }

    private func startImageViewAnimation() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.2,
                       usingSpringWithDamping: 0.65,
                       initialSpringVelocity: 2,
                       options: .curveEaseIn,
                       animations: { [weak self] in
                        self?.imageContainerView.transform = CGAffineTransform.identity
        })
    }
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
