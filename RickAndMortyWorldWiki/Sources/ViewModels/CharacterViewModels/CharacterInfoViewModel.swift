//
//  CharacterInfoViewModel 2.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 11.12.2024.
//

import Foundation
import Combine
import SwiftUI
import SwiftUICore

public class CharacterInfoViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var episode: [EpisodeModel] = []
    @Published var errorMessage: Error? = nil
    var episodeUrls: [String] = []
    
    func fetchEpisodes(){
        self.isLoading = true
        NetworkManager.shared.getEpisodeInfo(episodeUrl: episodeUrls) { result, error in
            if let newError = error {
                debugPrint(newError)
                self.isLoading = false;
                self.errorMessage = newError
                return
            }
            else {
                self.errorMessage = nil
            }
                
            if let result {
                self.episode.append(result)
            }
            
            self.isLoading = false;
        }
    }
}
