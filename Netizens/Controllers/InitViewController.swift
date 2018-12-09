//
//  InitViewController.swift
//  Netizens
//
//  Created by Krzysztof Lech on 08/12/2018.
//  Copyright © 2018 Krzysztof Lech. All rights reserved.
//

import UIKit

class InitViewController: UIViewController {
    
    @IBOutlet private weak var logoImageView: UIImageView!
    
    private let listSegue = "ListSegue"
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startLogoAnimation()
    }
    
    private func startLogoAnimation() {
        UIView.animate(withDuration: 0.8,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 2,
                       options: .curveEaseIn,
                       animations: {
                        self.logoImageView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        })
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.85,
                       options: .curveEaseIn,
                       animations: {
                        self.logoImageView.frame.origin.x -= self.view.frame.width
        }) { (_) in
            self.logoImageView.isHidden = true
            self.performSegue(withIdentifier: self.listSegue, sender: nil)
        }
    }
}
