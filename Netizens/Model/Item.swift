//
//  Item.swift
//  Netizens
//
//  Created by Krzysztof Lech on 08/12/2018.
//  Copyright © 2018 Krzysztof Lech. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object, Decodable {
    
    @objc dynamic var title: String = ""
    @objc dynamic var thumbnailUrl: String = ""
    
    private enum ItemCodingKeys: String, CodingKey {
        case title
        case thumbnailUrl
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: ItemCodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
    }
}
