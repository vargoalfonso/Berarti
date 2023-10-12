//
//  ArticleViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 30/11/22.
//

import Foundation

final class SocialViewModel: ObservableObject {
    
    @Published var funFactList: [FunFact] = []
    @Published var isPresentingCommunityModal: Bool = false
    
    init() {
        retrieveFunFacts()
    }
    
    /// Retrieving all of the fun facts objects from JSON data
    private func retrieveFunFacts() {
        do {
            if let path = Bundle.main.path(forResource: "funfacts", ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                funFactList = try JSONDecoder().decode([FunFact].self, from: data)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
