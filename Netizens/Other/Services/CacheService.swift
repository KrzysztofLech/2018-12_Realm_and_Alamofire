//
//  CacheService.swift
//  Netizens
//
//  Created by Krzysztof Lech on 08/12/2018.
//  Copyright © 2018 Krzysztof Lech. All rights reserved.
//

import Foundation

enum CacheConfiguration {
    static let maxObjects = 5000
    static let maxSize = 150 * 150 * maxObjects
}

class CacheService {
    static let shared = CacheService()
    
    private var cache: NSCache<NSString, AnyObject> = {
        let cache = NSCache<NSString, AnyObject>()
        cache.countLimit = CacheConfiguration.maxObjects
        cache.totalCostLimit = CacheConfiguration.maxSize
        return cache
    }()
    
    private init() { }
    
    func cache(object: AnyObject, forKey key: String) {
        cache.setObject(object, forKey: key as NSString)
    }
    
    func getFromCache(key: String) -> AnyObject? {
        return cache.object(forKey: key as NSString)
    }
}
