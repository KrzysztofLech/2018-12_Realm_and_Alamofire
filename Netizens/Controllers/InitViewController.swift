//
//  InitViewController.swift
//  Netizens
//
//  Created by Krzysztof Lech on 08/12/2018.
//  Copyright © 2018 Krzysztof Lech. All rights reserved.
//

import UIKit

class InitViewController: UIViewController {

    private let listSegue = "ListSegue"
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        performSegue(withIdentifier: listSegue, sender: nil)
    }
}
