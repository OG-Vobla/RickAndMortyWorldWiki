//
//  NetworkManager.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 29.10.2024.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchCharacters(completion: @escaping ([CharacterModel]?, Error?) -> Void) {
        let url = "https://rickandmortyapi.com/api/character/"
        
        AF.request(url).responseDecodable(of: CharacterResponse.self) { response in
            switch response.result {
            case .success(let characterResponse):
                completion(characterResponse.results, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

struct CharacterResponse: Codable {
    var results: [CharacterModel]
}
