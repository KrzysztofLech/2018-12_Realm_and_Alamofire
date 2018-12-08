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
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            self.logoImageView.alpha = 0.0
        }) { (_) in
            self.performSegue(withIdentifier: self.listSegue, sender: nil)
        }
    }
}
