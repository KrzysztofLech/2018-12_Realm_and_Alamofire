//
//  DataManager.swift
//  Netizens
//
//  Created by Krzysztof Lech on 09/12/2018.
//  Copyright © 2018 Krzysztof Lech. All rights reserved.
//

import Foundation
import RealmSwift

protocol DataManagerProtocol {
    func createNewDataBase(withItems items: [Item])
    func fetchData(completion: @escaping ([Item]) -> Void)
}

class DataManager: DataManagerProtocol {
    
    private let realm = try! Realm()
    private var items: Results<Item> = try! Realm().objects(Item.self)
    
    func createNewDataBase(withItems items: [Item]) {
        try! realm.write {
            realm.deleteAll()
            realm.add(items)
        }
        print("New local data base created with \(items.count) elements")
    }

    
    func fetchData(completion: @escaping ([Item]) -> Void) {
        let itemsArray: [Item] = items.map { $0 }
        
        print("***** Realm items count", items.count)
        completion(itemsArray)
    }    
}
