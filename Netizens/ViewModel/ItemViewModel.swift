//
//  ItemViewModel.swift
//  Netizens
//
//  Created by Krzysztof Lech on 08/12/2018.
//  Copyright © 2018 Krzysztof Lech. All rights reserved.
//

import Foundation

typealias Completion = (()->())

class ItemsViewModel {
    
    // MARK: - Private Properties
    
    private let apiService:   APIServiceProtocol
    private let alertService: AlertService
    private let dataManager:  DataManagerProtocol
    private var items: [Item] = []
    
    // MARK: - Public Properties
    
    var itemsCount: Int { return items.count }
    
    // MARK: - Init
    
    init(apiService: APIServiceProtocol = APIService(),
         alertService: AlertService = AlertService(),
         dataManager: DataManagerProtocol = DataManager()) {
        self.apiService = apiService
        self.alertService = alertService
        self.dataManager = dataManager
    }
    
    // MARK: - Networking
    
    func initFetch(successCompletion: @escaping Completion) {
        apiService.fetchData(url: Constants.itemsUrl) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let fetchedItems = self.apiService.processFetchedData(data)
                    self.items = fetchedItems
                    self.dataManager.createNewDataBase(withItems: fetchedItems)
                    successCompletion()
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.alertService.showAlert(withError: error, noInternetAction: {
                        self.dataManager.fetchData(completion: { (localItems) in
                            self.items = localItems
                            successCompletion()
                        })
                    })
                }
            }
        }
    }
    
    // MARK: - Public Methods
    
    func getItemData(withIndex index: Int) -> Item {
        return items[index]
    }
    
}
