//
//  AlertService.swift
//  Netizens
//
//  Created by Krzysztof Lech on 08/12/2018.
//  Copyright © 2018 Krzysztof Lech. All rights reserved.
//

import UIKit

struct AlertService {
    
    func showAlert(withError error: ErrorResult, noInternetAction: @escaping Completion) {
        let errorDescription = error.getErrorMessage()
        switch error {
        case .noInternet:
            showNoInternetAlert(withAction: noInternetAction)
            
        default:
            showAlert(withTitle: errorDescription)
        }
    }
    
    private func showNoInternetAlert(withAction action: @escaping Completion ) {
        guard let controller = UIApplication.getPresentedViewController() else { return }
        
        let ac = UIAlertController(title: "No Internet!",
                                   message: "Presented data was fetched from local data base!!!",
                                   preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        ac.addAction(okAction)

        controller.present(ac, animated: true, completion: {
            action()
        })
    }
    
    private func showAlert(withTitle title: String) {
        guard let controller = UIApplication.getPresentedViewController() else { return }
        
        let ac = UIAlertController(title: title,
                                   message: nil,
                                   preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        ac.addAction(action)
        controller.present(ac, animated: true, completion: nil)
    }
}
