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
        
        filters.forEach {
            if let filterSelected = $0.filterSelected {
                url += "&\($0.filterName.lowercased())=\(filterSelected)"
            }
        }
        
        AF.request(url).responseDecodable(of: CharacterResponse.self) { response in
            switch response.result {
            case .success(let characterResponse):
                completion(characterResponse.results, nil, characterResponse.info.pages)
            case .failure(let error):
                completion(nil, error, nil)
            }
        }
    }
    
    func getEpisodeInfo(episodeUrl: [String], completion: @escaping (EpisodeModel?, Error?) -> Void) {
        episodeUrl.forEach { url in
            AF.request(url).responseDecodable(of: EpisodeModel.self) { response in
                switch response.result {
                case .success(let episode):
                    completion(episode, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
    
    func fetchLocations(page: Int, completion: @escaping ([LocationInfoModel]?, Error?, Int?) -> Void) {
        let url = "https://rickandmortyapi.com/api/location?page=\(page)"
        
        AF.request(url).responseDecodable(of: LocationResponse.self) { response in
            switch response.result {
            case .success(let locationResponse):
                completion(locationResponse.results, nil, locationResponse.info.pages)
            case .failure(let error):
                completion(nil, error, nil)
            }
        }
    }
    
    func getCharacterInfo(characterUrl: [String], completion: @escaping (CharacterModel?, Error?) -> Void) {
        characterUrl.forEach { url in
            AF.request(url).responseDecodable(of: CharacterModel.self) { response in
                switch response.result {
                case .success(let character):
                    completion(character, nil)
                case .failure(let error):
                    completion(nil, error)
                }
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

struct LocationResponse: Decodable {
    var info: ResponseInfo
    var results: [LocationInfoModel]
}
