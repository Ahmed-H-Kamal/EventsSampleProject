//
//  HomeViewModel.swift
//  EventSampleProject
//
//  Created by Ahmed Hamdy on 12/09/2021.
//

import Foundation
class HomeViewModel: NSObject {
    let isLoading = Observable<Bool>(false)
    let sectionViewModels = Observable<[SectionViewModel]>([])
    let categoriesList = Observable<[EventType]>([])

    
    func getCategories(completion: @escaping(_ categories:[EventType]?, _ error: Error?) -> Void)
    {
        let url = "http://private-7466b-eventtuschanllengeapis.apiary-mock.com/eventtypes"
        ApiManager.makeApiCall(with: url, method: .get) { (response, error) in
            if (error != nil) {
                completion (nil, error!)
            }
            else {
                if let data = response {
                    do {
                        let decoded = try JSONDecoder().decode([EventType].self, from: data)
                        completion (decoded, nil)
                    } catch {
                        print("*** ERROR *** \(error)")
                    }
                }
            }
        }
    }
}
