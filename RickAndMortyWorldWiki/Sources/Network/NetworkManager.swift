//
//  NetworkManager.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 29.10.2024.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchCharacters(page: Int, filters: [Filter], completion: @escaping ([CharacterModel]?, Error?, Int?) -> Void) {
        var url = "https://rickandmortyapi.com/api/character?page=\(page)"
        
        filters.forEach { url += "&\($0.filterName.lowercased())=\($0.filterSelected)" }
        
        AF.request(url).responseDecodable(of: CharacterResponse.self) { response in
            switch response.result {
            case .success(let characterResponse):
                completion(characterResponse.results, nil, characterResponse.info.pages)
            case .failure(let error):
                completion(nil, error, nil)
            }
        }
    }
}

struct ResponseInfo: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct CharacterResponse: Decodable {
    var info: ResponseInfo
    var results: [CharacterModel]
}

