//
//  ItemTableViewCell.swift
//  Netizens
//
//  Created by Krzysztof Lech on 08/12/2018.
//  Copyright © 2018 Krzysztof Lech. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var thumbnailURL: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailImageView.layer.cornerRadius = 25
        thumbnailImageView.layer.masksToBounds = true
        thumbnailImageView.layer.borderWidth = 1
        thumbnailImageView.layer.borderColor = UIColor.lightGray.cgColor
        
        resetCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCell()
    }
    
    private func resetCell() {
        activityIndicator.startAnimating()
        thumbnailImageView.image = nil
        titleLabel.text = nil
    }
    
    func update(withData data: Item) {
        titleLabel.text = data.title
        thumbnailURL = data.thumbnailUrl
    }
}
